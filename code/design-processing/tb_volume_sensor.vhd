-- created by: Veribest WaveBench Version 16.00.00.02
library work; use work.all;
library ieee_proposed;  use ieee_proposed.electrical_systems.all;
library ieee; use ieee.std_logic_1164.all;

entity  tb_volume_sensor is
end  tb_volume_sensor;

architecture test_bench of tb_volume_sensor is
    -- Component declarations
    -- Signal declarations
  signal	clk, full, rst : std_logic;
  terminal	flow, minus_ref : electrical;

begin
    -- Signal assignments
    -- Component instances

    vol1 : entity work.volume_sensor(structural)
        port map(
            clk => clk,
            full => full,
			rst => rst,
			flow => flow,
			minus_ref => minus_ref
        );
    vio : entity work.v_sine(ideal)
        generic map(
            freq => 1.0,
            amplitude => 16.0
        )
        port map(
            pos => flow,
            neg => ELECTRICAL_REF
        );
    vm_ref : entity work.v_constant(ideal)
        generic map(
            level => -10.0
        )
        port map(
            pos => minus_ref,
            neg => ELECTRICAL_REF
        );
-- Test code generation processes  
  -- clk
    P_clk :
    process
    begin
        clk <= '1';
        wait for 500000.000 ns;
        clk <= '0';
        wait for 500000.000 ns;
    end process P_clk;

  -- rst
    P_rst :
    process
    begin
    	wait for 0.0 ms;	rst <=  '0';
  		wait for 2.0 ms;	rst <=  '1';
		wait for 2.0 ms;	rst <=  '0';
		wait;
    end process;

  end test_bench;
