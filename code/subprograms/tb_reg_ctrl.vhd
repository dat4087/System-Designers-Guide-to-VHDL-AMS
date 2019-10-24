entity tb_reg_ctrl is
end entity tb_reg_ctrl;



library ieee;  use ieee.std_logic_1164.all;
library util;

architecture test of tb_reg_ctrl is

  signal reg_addr_decoded, rd, wr, io_en,
         cpu_clk, reg_rd, reg_wr : std_ulogic := '0';
  signal test_vector : std_ulogic_vector(1 to 5);

  use util.stimulus_generators.all;

begin

  dut : entity work.reg_ctrl
    port map ( reg_addr_decoded, rd, wr, io_en, cpu_clk, reg_rd, reg_wr );

  stimulus : process is
  begin
    all_possible_values( bv => test_vector,
                              delay_between_values => 10 ns );
    wait;
  end process stimulus;

  (reg_addr_decoded, rd, wr, io_en, cpu_clk) <= test_vector;

end architecture test;
