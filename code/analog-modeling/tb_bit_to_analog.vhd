library IEEE; use IEEE.std_logic_1164.all; use IEEE.std_logic_arith.all;
library IEEE_proposed; use IEEE_proposed.electrical_systems.all;

entity tb_bit_to_analog is
end tb_bit_to_analog;

architecture TB_bit2analog of tb_bit_to_analog is
    -- Component declarations
    -- Signal declarations
	terminal ana_out : electrical;
    signal ina : bit;
	signal ina_tmp : std_logic;

begin
    -- Signal assignments
	ina <= To_bit(ina_tmp);		-- convert std_logic to bit
    -- Component instances
    d2a1 : entity work.bit_to_analog(ideal)
        port map(
           d => ina,			-- bit type pin
           a => ana_out
        );
    clk1 : entity work.clock_duty(ideal)
        generic map(
            off_time => 2 ms,
            on_time => 1 ms
        )
        port map(
            CLOCK_OUT => ina_tmp	-- std_logic type pin
        );
    R1 : entity work.resistor(ideal)
        generic map(
            res => 10.0e3
        )
        port map(
            p1 => ana_out,
            p2 => electrical_ref
        );
end TB_bit2analog;
