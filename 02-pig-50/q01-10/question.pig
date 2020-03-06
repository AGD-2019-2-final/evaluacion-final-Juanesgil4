-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm -f data.tsv
fs -put data.tsv

datos = LOAD 'data.tsv' USING PigStorage()
    AS (
        letter:CHARARRAY,
        date:CHARARRAY,
        number:INT
    );
grouped = GROUP datos BY letter;
counted = FOREACH grouped GENERATE group AS letter, COUNT(datos) AS count;
STORE counted INTO 'output';
fs -get output/ .
