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
u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (col1:CHARARRAY,
        col2:CHARARRAY,
        col3:INT);
DUMP u;

t3 = ORDER u BY $2;
t3_1 = LIMIT t3 5;
final3 = FOREACH t3_1 GENERATE $2;
DUMP final3;


STORE final3 INTO 'output';
