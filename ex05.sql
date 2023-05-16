CREATE OR REPLACE FUNCTION disciplinas_dependentes(codigo integer)
RETURNS TABLE(dependentes varchar(50))
AS $$

	SELECT nom_disc 
	FROM disciplinas
	WHERE cod_disc IN (SELECT cod_disc FROM pre_requisitos WHERE cod_disc_pre = codigo);

$$
LANGUAGE SQL;