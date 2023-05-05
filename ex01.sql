CREATE
OR REPLACE FUNCTION consulta_aluno(nome varchar(50)) RETURNS TABLE(
    nom_alu varchar(50),
    nom_curso varchar(50),
    tot_cred integer,
    mgp float
) AS $ $
SELECT
    alunos.nom_alu,
    cursos.nom_curso,
    alunos.tot_cred,
    alunos.mgp
FROM
    alunos
    join cursos on alunos.cod_curso = cursos.cod_curso
where
    nom_alu ilike '%' || nome || '%';

$ $ LANGUAGE SQL;