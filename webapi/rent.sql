CREATE OR REPLACE FUNCTION rent_is_json_valid (
	p_rent                        jsonb
) RETURNS BOOLEAN AS $$
BEGIN 
	IF NOT p_rent ? 'patent' OR NOT p_rent ? 'rent_date' OR NOT p_rent ? 'return_date' OR NOT p_rent ? 'dni'
	THEN
		RETURN FALSE;
	END IF;
	
	RETURN TRUE;
END;
$$ LANGUAGE plpgsql STABLE STRICT
SET search_path FROM CURRENT;
