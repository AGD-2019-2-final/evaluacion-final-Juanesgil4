-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm -f data.tsv

fs -put -f data.tsv .

info=LOAD 'data.tsv' USING PigStorage() AS (
    f1:CHARARRAY,
    f2:BAG{t: TUPLE()},
    f3:MAP[]
);

col = FOREACH info GENERATE FLATTEN(f3) AS c1;

keys = FOREACH col GENERATE FLATTEN(c1) AS k;

tok = FOREACH keys GENERATE FLATTEN(TOKENIZE(k)) AS f1;

grouped = GROUP tok BY f1;

lettercount = FOREACH grouped GENERATE group, COUNT(tok);

STORE lettercount INTO 'output' USING PigStorage(',');

fs -get output .

fs -rm data.tsv

fs -rm output/*
fs -rmdir output
