CREATE OR REPLACE FUNCTION car (
	IN p_patent                   text,
	IN p_brand                    text,
	IN P_model                    text,
	IN p_year                     integer,
	IN p_description              text,
	IN p_status                   text
) RETURNS car AS
$$
	INSERT INTO car(patent, brand, model, year, description, status)
		VALUES(p_patent, p_brand, P_model, p_year, p_description, p_status)
	RETURNING *;
$$ LANGUAGE sql VOLATILE STRICT
SET search_path FROM CURRENT;

-GETTERS

CREATE OR REPLACE FUNCTION car_get_patent (
	IN p_car                      car
) RETURNS text AS
$$
	SELECT patent(p_car);
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;
