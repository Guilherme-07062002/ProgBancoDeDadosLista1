CREATE OR REPLACE FUNCTION copia_curso(curso_origem integer, curso_destino integer)
RETURNS TABLE(codigos integer)
AS $$
	
    INSERT INTO curriculos (cod_curso, cod_disc, periodo)
    SELECT curso_destino, cod_disc, periodo 
    FROM curriculos 
    WHERE cod_curso = curso_origem

    RETURNING cod_disc;
$$
LANGUAGE SQL;