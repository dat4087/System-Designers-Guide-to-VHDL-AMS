library IEEE;
use IEEE.std_logic_1164.all;
library IEEE_proposed;
use IEEE_proposed.electrical_systems.all;
use IEEE_proposed.thermal_systems.all;
entity tb_diode is
end tb_diode;

architecture TB_diode of tb_diode is
    -- Component declarations
    -- Signal declarations
    terminal in_src : electrical;
    terminal r1_d1 : electrical;
	terminal temp_in : thermal;
begin
    -- Signal assignments
    -- Component instances
    vio : entity work.v_sine(ideal)
        generic map(
            freq => 100.0,
            amplitude => 5.0
        )
        port map(
            pos => in_src,
            neg => ELECTRICAL_REF
        );
    tmp : entity work.TempConstant(ideal)
        generic map(
            level => 100.0
        )
        port map(
            th1 => temp_in,
            th2 => thermal_REF
        );
    R1 : entity work.resistor(ideal)
	        generic map(
            res => 100.0
       )
        port map(
            p1 => in_src,
            p2 => r1_d1
        );
	D1 : entity work.diode(one)
       port map(
            p => r1_d1,
            m => electrical_ref,
			j => temp_in
        );
end TB_diode;
