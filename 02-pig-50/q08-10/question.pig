-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm -f -r data.tsv
fs -put data.tsv

u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (col1:CHARARRAY,
        col2:BAG{t: TUPLE(p:CHARARRAY)},
        col3:MAP[]);


t8 = FOREACH u GENERATE FLATTEN($1), FLATTEN(KEYSET($2));
t8_1 = GROUP t8 BY ($0,$1);
final8 = FOREACH t8_1 GENERATE group,COUNT(t8);
DUMP final8

STORE final8 INTO 'output';

fs -copyToLocal output output
