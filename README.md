# Pig Latin - ETL on Airlines industy data
Learning to do ETL in Hadoop is complex and time consuming but not with Pig. Pig gives a SQL-Like languege to run MapReduce jobs that transform data for complex analysis. I have used Pig Latin to extract, Load and Transform data of airlines, airports and routes.

### Objective
To find the distance between airports where a distinct route exists from source and destination.
Output to include Airport source and destination information and distance between them.

### About the Dataset:
- The datasets are available in https://openflights.org/data.html
- Airports Database contains over 10,000 airports. 
- <img src=https://openflights.org/demo/openflights-apdb-2048.png width=50% height=50%></img>
- Airlines Database contains 5888 airlines.
- Route Database contains 67663 routes between 3321 airports on 548 airlines 
<img src=https://openflights.org/demo/openflights-routedb-2048.png height=50% width=50%></img>

### Steps for solution
- Loading the data of routes 
- Filtering out the missing values in routes
- Extracting the list of distinct routes using Source and Destination airport IDs

- Loading the data of airports
