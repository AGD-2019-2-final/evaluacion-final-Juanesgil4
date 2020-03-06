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
fs -rm -f -r data.tsv
fs -put data.tsv

u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (col1:CHARARRAY,
        col2:BAG{t: TUPLE(p:CHARARRAY)},
        col3:MAP[]);

t6 = FOREACH u GENERATE FLATTEN($2);
t6_1 = FOREACH t6 GENERATE $0;
t6_2 = GROUP t6_1 BY $0;
final6 = FOREACH t6_2 GENERATE CONCAT($0,',',(CHARARRAY)COUNT($1));
DUMP final6;

STORE final6 INTO 'output';

fs -copyToLocal output output
