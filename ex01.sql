CREATE OR REPLACE FUNCTION consulta_aluno(nome VARCHAR(50)) 
RETURNS TABLE(nom_alu VARCHAR(50),nom_curso VARCHAR(50), tot_cred INTEGER, mgp FLOAT) 
AS $$

    SELECT alunos.nom_alu, cursos.nom_curso, alunos.tot_cred, alunos.mgp
    FROM alunos
    JOIN cursos ON alunos.cod_curso = cursos.cod_curso
    WHERE nom_alu ilike '%' || nome || '%';

$$ LANGUAGE SQL;