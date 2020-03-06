-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.csv` escriba una consulta en Pig que genere la 
-- siguiente salida:
-- 
--   Vivian@Hamilton
--   Karen@Holcomb
--   Cody@Garrett
--   Roth@Fry
--   Zoe@Conway
--   Gretchen@Kinney
--   Driscoll@Klein
--   Karyn@Diaz
--   Merritt@Guy
--   Kylan@Sexton
--   Jordan@Estes
--   Hope@Coffey
--   Vivian@Crane
--   Clio@Noel
--   Hope@Silva
--   Ayanna@Jarvis
--   Chanda@Boyer
--   Chadwick@Knight
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--

fs -rm -f -r output;
--
fs -rm -f data.csv

fs -put -f data.csv .

charac = LOAD 'data.csv' USING PigStorage(',') AS (
    f1:INT,
    f2:CHARARRAY,
    f3:CHARARRAY,
    f4:DATETIME,
    f5:CHARARRAY,
    f6:INT
);

u = FOREACH charac GENERATE CONCAT(f2,'@',f3);

STORE u INTO 'output';

fs -get output .

fs -rm data.csv

fs -rm output/*
fs -rmdir output
