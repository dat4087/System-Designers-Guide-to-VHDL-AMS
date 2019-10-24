library IEEE;
use IEEE.std_logic_1164.all;
library IEEE_proposed;
use IEEE_proposed.electrical_systems.all;
entity tb_analog_switch is
end tb_analog_switch;

architecture TB_analog_switch of tb_analog_switch is
    -- Component declarations
    -- Signal declarations
    terminal in_ana_src : electrical;
	terminal in_switch : electrical;
    signal clock_out : std_logic;
begin
    -- Signal assignments
    -- Component instances
    vdc1 : entity work.v_constant(ideal)
        generic map(
            level => 1.0
        )
        port map(
            pos => in_ana_src,
            neg => ELECTRICAL_REF
        );
    Clk1 : entity work.clock(ideal)
        generic map(
            period => 10.0ms
        )        
		port map(
            clk_out => clock_out
        );
    R1 : entity work.resistor(ideal)
        generic map(
            res => 100.0
        )        
		port map(
            p1 => in_ana_src,
            p2 => in_switch
        );
    swtch : entity work.analog_switch(ideal)
        port map(
            n1 => in_switch,
            n2 => ELECTRICAL_REF,
			control => clock_out
        );
end TB_analog_switch;
