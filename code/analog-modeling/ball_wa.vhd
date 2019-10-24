ENTITY ball_wa IS 
END ENTITY ball_wa; 

ARCHITECTURE simple OF ball_wa IS 
	QUANTITY v: real; 
	QUANTITY s: real; 
	CONSTANT G: real := 9.81; 
	CONSTANT Air_Res: real := 0.1; 
	SIGNAL damping: real := -0.7; 
	signal v_at_impact : real:= 0.0; 
	signal impact: boolean; 
BEGIN 
	if domain = quiescent_domain use 
		v == 0.0; 
		s == 30.0; 
	elsif impact use 
		v == damping*v_at_impact; 
		s == 0.0; 
	else 
		s'dot == v; 
		v'dot == -G; 
	end use; 
	process begin 
		wait until not s'above(0.0); 
		if v < -1.0e-9 then 
			v_at_impact <= v; 
			impact <= true, false after 1 us; 
		else 
			damping <= 0.0; 
			impact <= true; 
		end if; 
	end process; 
	break on impact; 
END architecture simple; 



