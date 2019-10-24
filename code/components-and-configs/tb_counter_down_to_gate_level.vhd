entity tb_counter_down_to_gate_level is
end entity tb_counter_down_to_gate_level;


use work.counter_types.all;

architecture test of tb_counter_down_to_gate_level is

  signal clk, clr : bit := '0';
  signal q0, q1 : digit;

begin

  dut : configuration work.counter_down_to_gate_level
    port map ( clk => clk, clr => clr,
               q0 => q0, q1 => q1 );

  clk_gen : clk <= not clk after 20 ns;

  clr_gen : clr <= '1' after 95 ns,
		   '0' after 135 ns;

end architecture test;
