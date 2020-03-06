--
-- Pregunta
-- ===========================================================================
-- 
-- El archivo `truck_event_text_partition.csv` tiene la siguiente estructura:
-- 
--   driverId       INT
--   truckId        INT
--   eventTime      STRING
--   eventType      STRING
--   longitude      DOUBLE
--   latitude       DOUBLE
--   eventKey       STRING
--   correlationId  STRING
--   driverName     STRING
--   routeId        BIGINT
--   routeName      STRING
--   eventDate      STRING
-- 
-- Escriba un script en Pig que carge los datos y obtenga los primeros 10 
-- registros del archivo para las primeras tres columnas, y luego, ordenados 
-- por driverId, truckId, y eventTime. 
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba su respuesta a partir de este punto <<<
-- 
fs -rm -f truck_event_text_partition.csv

fs -put -f truck_event_text_partition.csv .

info= LOAD 'truck_event_text_partition.csv' USING PigStorage(',') AS (
    driverid:INT,
    truckid:INT,
    eventtime:CHARARRAY,
    eventtype:CHARARRAY, 
    longitude: DOUBLE,
    latitude: DOUBLE,
    eventkey: CHARARRAY,
    correlationid: CHARARRAY,
    drivername: CHARARRAY,
    routeid: BIGINTEGER,
    routename: CHARARRAY,
    eventdate: CHARARRAY
);

s = LIMIT info 10;

col = FOREACH s GENERATE driverid, truckid, eventtime;

orden = ORDER col BY driverid, truckid, eventtime;

STORE orden INTO 'output' USING PigStorage(',');

fs -get output .

fs -rm truck_event_text_partition.csv

fs -rm output/*
fs -rmdir output
