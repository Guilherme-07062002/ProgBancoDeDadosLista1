CREATE OR REPLACE FUNCTION migra_curso(velho integer, novo integer)
RETURNS void
AS $$

	UPDATE cursos 
	SET cod_coord = null
	WHERE cod_curso = velho;
	
	UPDATE cursos 
	SET cod_coord = novo
	WHERE cod_curso = null;

	UPDATE curriculos 
	SET cod_curso = novo
	WHERE cod_curso = velho;
	
	UPDATE professores 
	SET cod_curso = novo
	WHERE cod_curso = velho;
	
	UPDATE alunos 
	SET cod_curso = novo
	WHERE cod_curso = velho;

$$ LANGUAGE SQL;
