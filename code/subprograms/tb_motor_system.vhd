library IEEE_proposed;
use IEEE_proposed.electrical_systems.all;

entity tb_motor_system is
end tb_motor_system ;

architecture TB_motor_system of tb_motor_system is
    -- Component declarations
    -- Signal declarations
	terminal in_src, x1_out, x2_out, x3_out : electrical;

begin
    v7 : entity work.v_sine(ideal)
        generic map(
            freq => 10.0,
            amplitude => 1.0
        )
        port map(
            pos => in_src,
			neg => electrical_ref
        );
	state_var1: entity work.motor_system_wa(simple)
		port map(
            vp => in_src,
            vm => ELECTRICAL_REF,
			px1 => x1_out,
			px2 => x2_out,
			px3 => x3_out
        );
end TB_motor_system ;


