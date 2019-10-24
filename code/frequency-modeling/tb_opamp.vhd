library IEEE; use IEEE.std_logic_1164.all;
library IEEE_proposed; use IEEE_proposed.electrical_systems.all;

entity tb_opamp is
end tb_opamp;

architecture TB_opamp of tb_opamp is
    -- Component declarations
    -- Signal declarations
    terminal in_src, op_neg2, out_opamp2 : electrical;
    terminal out_opamp1, op_neg1, op_neg3, out_opamp3, out_opamp3_res, op_neg3_res : electrical;
begin
    -- Signal assignments
    -- Component instances
    vio : entity work.v_sine(ideal)
        generic map(
            freq => 100.0,
            amplitude => 5.0e-3
        )
        port map(
            pos => in_src,
            neg => ELECTRICAL_REF
        );

    OP1 : entity work.opamp(slew_limited)
    	port map(
            plus_in => electrical_ref,
            minus_in => op_neg1,
		output => out_opamp1
        );
    R1in : entity work.resistor(ideal)
        generic map(
            res => 10.0e3
        )
        port map(
            p1 => in_src,
            p2 => op_neg1
        );
    R1F : entity work.resistor(ideal)
        generic map(
            res => 10.0e9
        )
        port map(
            p1 => op_neg1,
            p2 => out_opamp1
        );
    Rload1 : entity work.resistor(ideal)
        generic map(
            res => 1.0e3
        )
        port map(
            p1 => out_opamp1,
            p2 => electrical_ref
        );
end TB_opamp;
