-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm -f -r data.tsv
fs -put data.tsv

datos = LOAD 'data.tsv' USING PigStorage('\t')
    AS (col1:CHARARRAY,
        col2:CHARARRAY,
        col3:INT);
DUMP datos;

p3 = ORDER datos BY $2;
Resp3 = LIMIT p3 5;
Resp = FOREACH Resp3 GENERATE $2;
DUMP Resp;


STORE Resp INTO 'output';
