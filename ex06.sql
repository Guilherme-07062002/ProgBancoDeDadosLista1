CREATE OR REPLACE FUNCTION copia_curso(velho integer, novo integer)
RETURNS void
AS $$

	INSERT INTO curriculos
	SELECT novo, cod_disc, periodo
	FROM curriculos
	WHERE cod_curso = velho;

$$ LANGUAGE SQL;