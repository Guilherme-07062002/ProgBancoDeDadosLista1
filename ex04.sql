CREATE OR REPLACE FUNCTION 
pre_requisitos(codigo INTEGER)
RETURNS TABLE(pre_requisitos VARCHAR(50))
AS $$
	SELECT disciplinas.nom_disc 
	FROM disciplinas 
	WHERE disciplinas.cod_disc 
	IN (SELECT pre_requisitos.cod_disc_pre 
		FROM pre_requisitos WHERE cod_disc = codigo);
$$
LANGUAGE SQL;