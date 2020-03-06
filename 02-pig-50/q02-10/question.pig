-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
-- 

data = LOAD 'data.tsv' using PigStorage('\t') AS (id:chararray,date:chararray,numero:int);
final2 = ORDER data BY id, numero ASC;

STORE final2 INTO './output' using PigStorage('\t');
