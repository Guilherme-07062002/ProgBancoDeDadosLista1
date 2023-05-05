CREATE
OR REPLACE FUNCTION codigo_disciplina (nome varchar(50)) RETURNS TABLE(disciplina varchar(50), codigo integer) AS $ $
SELECT
    disciplinas.nom_disc,
    disciplinas.cod_disc
from
    disciplinas
where
    disciplinas.nom_disc ilike '%' || nome || '%';$ $ LANGUAGE SQL;