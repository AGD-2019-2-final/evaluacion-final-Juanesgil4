-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (col1:CHARARRAY,
        col2:BAG{t: TUPLE(p:CHARARRAY)},
        col3:MAP[]);

t5 = FOREACH u GENERATE FLATTEN($1);
t5_1 = GROUP t5 BY $0;
final5 = FOREACH t5_1 GENERATE CONCAT($0,'\t',(CHARARRAY)COUNT($1));
DUMP final5;


STORE final5 INTO 'output';
