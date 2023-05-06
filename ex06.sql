CREATE OR REPLACE FUNCTION copia_curso(curso_origem integer,
									  curso_destino integer)
RETURNS TABLE(codigos integer)
AS $$
    # Insira na tabela curriculo
	INSERT INTO curriculos (cod_curso, cod_disc, periodo)

        # O resultado da consulta abaixo, que retorna uma "tabela virtual"
        # Onde o código do curso_destino é associado com cod_disc e periodo que pertencem ao curso_origem
        SELECT curso_destino, cod_disc, periodo 
        FROM curriculos 
        WHERE cod_curso = curso_origem

    # Por fim retorne o campo cod_disc resultante desta consulta.
    # Que no caso possui os códigos das disciplinas que foram inseridos na tabela
    RETURNING cod_disc;
$$
LANGUAGE SQL;