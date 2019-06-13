# ETL on Airlines industy data in Hadoop using pig script
Learning to do ETL in Hadoop is complex and time consuming but not with Pig. Pig gives a SQL-Like languege to run MapReduce jobs that transform data for complex analysis. I have used Pig Latin to extract, Load and Transform data of airlines, airports and routes.

### Objective
To find the distance (using latitude and longitudes) in KM between airports where a distinct route exists from source and destination.
Output to include Airport source and destination information and distance between them.

### Prerequisite:
1. Hadoop HDFS, I used HortonWorks Sandbox which already has all necessary builds for running Pig Latin scripts.
2. Dataset files should be in the HDFS (just keeping data files in linux file system is not enough; it has to be in HDFS)

### About the Dataset:
- The datasets are available in https://openflights.org/data.html
- Airports Database contains over 10,000 airports. 
- <img src=https://openflights.org/demo/openflights-apdb-2048.png width=50% height=50%></img>
- Airlines Database contains 5888 airlines.
- Route Database contains 67663 routes between 3321 airports on 548 airlines 
<img src=https://openflights.org/demo/openflights-routedb-2048.png height=50% width=50%></img>

### Steps for solution
1. Load the data of routes and perform these steps:
  - Filtering out the missing values in routes
  - Extracting the list of distinct routes with Source and Destination airport IDs into a relation
2. Load the data of airports
3. Join the relations obtained from step 1 and 2 twice; once to get source airport information and then to get destination airport information
4. Generate the columns as required from the above relation. I took Airport ID, name, latitude, longitude of both source and destination airports. 
5. The tricky part is to calculate distance in KM using latitudes and longitudes. I did that using the simple Euclidian formula:
```
distance = SQRT((lat2 - lat1) * (lat2 - lat1) + (lon2 - lon1) * (lon2 - lon1)) * 111
```
6. Saving the information as a tab seperated file on HDFS.

### Conclusion
The Pig Latin script ran Map Reduce jobs successuly to generate a tab seperated file with preciseley the information we needed - Airports details and distances between them.
