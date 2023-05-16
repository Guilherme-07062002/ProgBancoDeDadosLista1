CREATE OR REPLACE FUNCTION migra_curso(antigo_curso integer, novo_curso integer)
									  
RETURNS VOID AS $$

# Armazenar código do coordenador para que mesmo após retirá-lo do antigo curso seja possivel atribui-lo a outro.
DECLARE cod_coord_antigo INTEGER;

	BEGIN
        # Armazenando código do coordenador na variavel
		SELECT cod_coord INTO cod_coord_antigo 
		FROM cursos 
		WHERE cod_curso = antigo_curso;

        # Removendo coordenador do antigo curso
		UPDATE cursos
		SET cod_coord = null
		WHERE cod_curso = antigo_curso;

        # Inserindo coordenador em novo curso	
		UPDATE cursos 
		SET cod_coord = cod_coord_antigo
		WHERE cod_curso = novo_curso;

        # Atualizando tabela alunos
		UPDATE alunos SET cod_curso = novo_curso 
		WHERE cod_curso = antigo_curso;

        # Atualizando tabela professores
    	UPDATE professores SET cod_curso = novo_curso
		WHERE cod_curso = antigo_curso;
	END;
    
$$ LANGUAGE plpgsql;