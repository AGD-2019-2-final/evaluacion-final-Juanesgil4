-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT
--        firstname,
--        color
--    FROM 
--        u 
--    WHERE 
--       color REGEXP '^[^b]';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

20_1 = filter u by (color matches '.*^[^b].+.*');
20_f = FOREACH 20_1 GENERATE firstname, color;
DUMP 20_f;
STORE 20_f INTO 'output' USING PigStorage(',');
fs -copyToLocal output output;
