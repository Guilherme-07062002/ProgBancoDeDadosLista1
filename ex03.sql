CREATE OR REPLACE FUNCTION 
codigo_curso(nome VARCHAR(50)) 
RETURNS TABLE( nom_curso VARCHAR(50), codigo INTEGER) 
AS $$
    SELECT  cursos.nom_curso,
            cursos.cod_curso
    FROM cursos
    WHERE cursos.nom_curso ilike '%' || nome || '%';
$$ LANGUAGE SQL;