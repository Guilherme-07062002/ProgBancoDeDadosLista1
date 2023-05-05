CREATE OR REPLACE FUNCTION 
codigo_disciplina (nome VARCHAR(50)) 
RETURNS TABLE(disciplina VARCHAR(50), codigo INTEGER) 
AS $$
    SELECT  disciplinas.nom_disc,
            disciplinas.cod_disc
    FROM disciplinas
    WHERE disciplinas.nom_disc ilike '%' || nome || '%';
$$ LANGUAGE SQL;