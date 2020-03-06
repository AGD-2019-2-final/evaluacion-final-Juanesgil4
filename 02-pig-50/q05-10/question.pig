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

data = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letra:CHARARRAY, 
        lista_letras:BAG{t: tuple(a:CHARARRAY)},
        clave_valor:MAP[]);
DUMP data;

lista_letras = FOREACH data GENERATE lista_letras;
DUMP lista_letras;

charac = FOREACH lista_letras GENERATE FLATTEN(lista_letras) AS letra;
DUMP charac;

agrp = GROUP charac BY letra;
DUMP agrp;

letracount = FOREACH agrp GENERATE group, COUNT(charac);
DUMP letracount;

STORE letracount INTO 'output' using PigStorage('\t');
