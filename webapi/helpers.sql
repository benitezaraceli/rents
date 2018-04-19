CREATE OR REPLACE FUNCTION webapi.is_text_valid_json (
	p_json                        text
) RETURNS boolean AS $$
BEGIN
	RETURN (p_json::json IS NOT NULL);
EXCEPTION 
	WHEN others THEN
		RETURN FALSE;  
END;
$$ LANGUAGE plpgsql IMMUTABLE STRICT
SET search_path FROM CURRENT;
