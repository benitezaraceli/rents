CREATE OR REPLACE FUNCTION car_is_json_valid (
	p_car                      jsonb
) RETURNS BOOLEAN AS $$
BEGIN 
	IF NOT p_car ? 'phone' OR NOT p_car ? 'brand' OR NOT p_car ? 'model' OR NOT p_car ? 'year' OR NOT p_car 'description' OR NOT 'status'
	THEN
		RETURN FALSE;
	END IF;
	
	RETURN TRUE;
END;
$$ LANGUAGE plpgsql STABLE STRICT
SET search_path FROM CURRENT;
