library IEEE; use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

library IEEE_proposed; use IEEE_proposed.electrical_systems.all;

entity tb_adc is
end tb_adc;

architecture tb_adc of tb_adc is
    -- Component declarations
    -- Signal declarations
    	signal clk_in : bit;
	signal clk_in_tmp : std_logic;
    	signal dig_out1, dig_out2 : bit;
    	terminal sine_in : electrical;
	quantity gain : real;
begin
    -- Signal assignments
	clk_in <= To_bit(clk_in_tmp);	-- convert std_logic to bit
    -- Component instances
    v1 : entity work.v_sine(ideal)
        generic map(
            freq => 1.0,
            amplitude => 5.0
        )
        port map(
            pos => sine_in,
            neg => ELECTRICAL_REF
        );
    adc25 : entity work.adc(struct)
        port map(
			gain => gain,
            a => sine_in,
            d_out => dig_out1,
            clk => clk_in
        );
    adc26 : entity work.adc(ideal)
        port map(
			gain => gain,
            a => sine_in,
            d_out => dig_out2,
            clk => clk_in
        );
    clock1 : entity work.clock_duty(ideal)
        generic map(
            on_time => 1 ms,
            off_time => 0.5 ms
        )
        port map(
            CLOCK_OUT => clk_in_tmp
        );
    src1 : entity work.src_constant(ideal)
        generic map(
            level => 1.0
        )
        port map(
            output => gain
        );
end tb_adc;
