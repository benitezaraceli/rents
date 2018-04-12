CREATE OR REPLACE FUNCTION client_is_json_valid (
	p_client                      jsonb
) RETURNS BOOLEAN AS $$
BEGIN 
	IF NOT p_client ? 'dni' OR NOT p_client ? 'fullname' OR NOT p_client ? 'address' OR NOT p_client ? 'phone' OR NOT p_client 'mail'
	THEN
		RETURN FALSE;
	END IF;
	
	RETURN TRUE;
END;
$$ LANGUAGE plpgsql STABLE STRICT
SET search_path FROM CURRENT;
