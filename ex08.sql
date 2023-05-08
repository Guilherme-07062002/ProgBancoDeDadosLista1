CREATE OR REPLACE FUNCTION remove_curso(codigo integer)
RETURNS void AS $$
	
	DELETE FROM historicos_escolares WHERE mat_alu 
	IN (SELECT mat_alu FROM alunos WHERE cod_curso = codigo);
	
	DELETE FROM turmas_matriculadas WHERE mat_alu 
	IN (SELECT mat_alu FROM alunos WHERE cod_curso = codigo);
	
	UPDATE cursos SET cod_coord = null WHERE cod_coord 
	IN (SELECT cod_prof FROM professores WHERE cod_curso = codigo);
	
	DELETE FROM turmas_matriculadas WHERE turma 
	IN (SELECT turma FROM turmas WHERE cod_prof IN 
		(SELECT cod_prof from professores WHERE cod_curso = codigo));
	
	DELETE FROM turmas WHERE cod_prof 
	IN (SELECT cod_prof FROM professores WHERE cod_curso = codigo);
	
	DELETE FROM alunos WHERE cod_curso = codigo; 
	DELETE FROM curriculos WHERE cod_curso = codigo; 
	DELETE FROM professores WHERE cod_curso = codigo;
	DELETE FROM cursos WHERE cod_curso = codigo;
$$ LANGUAGE SQL;