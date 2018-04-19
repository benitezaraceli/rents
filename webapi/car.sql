CREATE OR REPLACE FUNCTION webapi.car_validate_car (
	p_car                      jsonb
) RETURNS BOOLEAN AS $$
BEGIN 
	IF NOT p_car ? 'phone' OR NOT p_car ? 'brand' OR NOT p_car ? 'model' OR NOT p_car ? 'year' OR NOT p_car 'description' OR NOT 'status'
	THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END;
$$ LANGUAGE plpgsql STABLE STRICT
SET search_path FROM CURRENT;



CREATE OR REPLACE FUNCTION webapi.car_create_car (
	IN p_car                      text
) RETURNS void AS $$
DECLARE
	p_car                         jsonb;

BEGIN
	IF NOT webapi.is_text_valid_json(p_car)
	THEN
		RAISE EXCEPTION 'webapi.car_create_car EXCEPTION: parameter is not a valid JSON';
	END IF;

	v_car := p_car::jsonb;

	IF NOT webapi.car_validate_car(v_car)
	THEN
		RAISE EXCEPTION 'webapi.car_create_car EXCEPTION: malformed json object';

	END IF;

	PERFORM car (
		v_car ->> 'patent',
		v_car ->> 'brand',
		v_car ->> 'model',
		(v_car ->> 'year')::integer,
		v_car ->> 'description',
		v_car ->> 'status'
		);
END;
$$ LANGUAGE plpgsql VOLATILE STRICT
SET search_path FROM CURRENT;
