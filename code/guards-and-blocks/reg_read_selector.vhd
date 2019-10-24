library ieee;  use ieee.std_logic_1164.all;

entity reg_read_selector is
end entity reg_read_selector;


architecture test of reg_read_selector is

  constant reg0 : std_logic_vector(7 downto 0) := "00000000";
  constant reg1 : std_logic_vector(7 downto 0) := "11111111";
  signal dbus : std_logic_vector(7 downto 0);
  signal reg_sel, read, reg_addr : X01 := '0';

begin

  -- code from book

  reg_read_selector : block (reg_sel = '1' and read = '1') is
  begin
    dbus <= reg0 when guard and reg_addr = '0' else
            reg1 when guard and reg_addr = '1' else
            "ZZZZZZZZ";
  end block reg_read_selector;

  -- end code from book

  stimulus : process is
  begin
    reg_sel <= '1';  wait for 10 ns;
    read <= '1', '0' after 5 ns;  wait for 10 ns;
    reg_sel <= '0';  wait for 10 ns;
    read <= '1', '0' after 5 ns;  wait for 10 ns;
    reg_addr <= '1';  wait for 10 ns;
    reg_sel <= '1';  wait for 10 ns;
    read <= '1', '0' after 5 ns;  wait for 10 ns;

    wait;
  end process stimulus;

end architecture test;
