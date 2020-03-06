-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm -f data.tsv

fs -put -f data.tsv .

lines= LOAD 'data.tsv' USING PigStorage() AS (
    f1:CHARARRAY,
    f2:BAG{t: TUPLE()},
    f3:MAP[]
);

u = FOREACH lines GENERATE f1, COUNT(f2) AS c1, SIZE(f3) AS c2;

ordenadas = ORDER u BY f1, c1, c2;

STORE ordenadas INTO 'output' USING PigStorage(',');

fs -get output .

fs -rm data.tsv

fs -rm output/*
fs -rmdir output
