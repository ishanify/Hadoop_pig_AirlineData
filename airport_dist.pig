routes = load '/user/flight/routes.dat' using PigStorage(',') AS (
airline:chararray, 
ailine_id:chararray, 
airport_src:chararray, 
airport_srcid:chararray, 
airport_dest:chararray, 
airport_destid:chararray, 
codeshare:chararray, 
stops: chararray,
equipment: chararray);

air_nonull = FILTER routes by airport_srcid != '\\N' AND airport_destid != '\\N';

group_routes = group air_nonull by (airport_srcid, airport_destid); 
route_ids = foreach group_routes generate group.airport_srcid as src, group.airport_destid as dest; 

airports = load '/user/flight/airports.dat' using PigStorage(',') AS (id:chararray, 
name:chararray, 
city:chararray, 
country:chararray, 
lat: float,
lon: float,
alti: float,
timezone: float,
dst: chararray,
tz: chararray,
airport_type: chararray,
src: chararray);

src_names = join route_ids by src, airports by id;

all_names = join src_names by route_ids::dest, airports by id;
