--------------------------------------------------------------------------------------------------
-- Hive Table for Weather Data
--
-- Sample data:
-- {
-- "coord":{"lon":8.68,"lat":50.12},
-- "sys":{"type":1,"id":4881,"message":0.1859,"country":"DE","sunrise":1491195340,"sunset":1491242510},
-- "weather":[{"id":800,"main":"Clear","description":"Sky is Clear","icon":"01n"}],
-- "main":{"temp":15.29,"pressure":1023,"humidity":50,"temp_min":14,"temp_max":16},
-- "visibility":10000,
-- "wind":{"speed":5.7,"deg":30},
-- "clouds":{"all":0},
-- "dt":1491247886,
-- "id":2925533,
-- "name":"Frankfurt am Main"
-- }
--
-- add a partitions:
-- ALTER TABLE et_weather ADD PARTITION(ingest_date='xxx')
-- or
-- MSCK REPAIR TABLE
--------------------------------------------------------------------------------------------------

USE raw;

DROP TABLE et_weather;

CREATE EXTERNAL TABLE  et_weather (
  coord STRUCT<lon:DOUBLE, lat:DOUBLE> COMMENT 'City geo location longitude and City geo location latitude',
  sys STRUCT <type:INT, id:INT, message:DOUBLE, country:STRING, sunrise:BIGINT, sunset:BIGINT> COMMENT 'sys.type Internal parameter  sys.id Internal parameter sys.message Internal parameter sys.country Country code  sys.sunrise Sunrise time, unix, UTC sys.sunset Sunset time unix UTC',
  weather ARRAY<STRUCT <id:BIGINT, main:STRING, description:STRING, icon:STRING>> COMMENT 'additional info Weather condition codes weather.id Weather condition id weather.main Group of weather parameters Rain, Snow, Extreme etc.  weather.description Weather condition within the group  weather.icon Weather icon id ',
  main STRUCT <temp:DOUBLE, humidity:DOUBLE, temp_min:DOUBLE, temp_max:DOUBLE> COMMENT 'Temperature Celsius, Humidity % Minimum temperature at the moment. This is deviation from current temp that is possible for large cities and megalopolises geographically expanded. Unit Celsius Maximum temperature at the moment. ',
  visibility BIGINT COMMENT 'Visibility meter' , 
  wind STRUCT <speed:DOUBLE, deg:DOUBLE> COMMENT 'Wind speed. Unit meter/sec  Wind direction degrees (meteorological)',  
  clouds STRUCT <a:double> COMMENT 'Cloudiness Percent',
  dt BIGINT COMMENT 'Time of data calculation Unix UTC',  
  id BIGINT COMMENT 'City ID',
  name STRING COMMENT 'City Name'
) 
COMMENT 'Current weather, see https://openweathermap.org/current for more details'
PARTITIONED BY (ingest_date string)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 'adl://hmaneadls.azuredatalakestore.net/tenant01/data/raw/external/weather' 
;

-- Adding partitions:

MSCK REPAIR TABLE et_weather;