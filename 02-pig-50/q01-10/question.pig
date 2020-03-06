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
u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (col1:CHARARRAY,
        col2:CHARARRAY,
        col3:INT);
DUMP u;

t1 = GROUP u BY $0;
final1 = FOREACH t1 GENERATE $0,COUNT(u);
DUMP final1;

STORE final1 INTO 'output';
