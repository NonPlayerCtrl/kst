FUNCTION_BLOCK TON
	VAR_INPUT
		IN : BOOL;
		PT : TIME;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		ET : TIME;
	END_VAR
	VAR
		RUNNING : BOOL;
		START : TIME;
	END_VAR

	IF IN = FALSE THEN 
		Q := FALSE; 
		ET := 0; 
		RUNNING := FALSE;
	ELSIF RUNNING = FALSE THEN 
		START := CTIME; 
		RUNNING := TRUE;
	ELSIF CTIME - (START + PT) >= 0 THEN 
		Q := TRUE;
		ET := PT;
	ELSE 
		IF not Q THEN 
			ET := CTIME - START; 
		END_IF;
	END_IF;
END_FUNCTION_BLOCK