-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Genere una relación con el apellido y su longitud. Ordene por longitud y 
-- por apellido. Obtenga la siguiente salida.
-- 
--   Hamilton,8
--   Garrett,7
--   Holcomb,7
--   Coffey,6
--   Conway,6
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r data.tsv
fs -put data.tsv

u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (col1:CHARARRAY,
        col2:BAG{t: TUPLE(p:CHARARRAY)},
        col3:MAP[]);

t10 = FOREACH u GENERATE FLATTEN($1);
t10_1 = GROUP t10 BY $0;
final10 = FOREACH t10_1 GENERATE CONCAT($0,'\t',(CHARARRAY)COUNT($1));
DUMP final10;

STORE final10 INTO 'output';

fs -copyToLocal output output
