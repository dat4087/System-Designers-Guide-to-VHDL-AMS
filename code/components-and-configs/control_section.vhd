-- not in book

library ieee;  use ieee.std_logic_1164.all;

entity control_section is
end entity control_section;

-- end not in book


architecture structural of control_section is

  component reg is
    generic ( width : positive );
    port ( clk : in std_logic;
           d : in std_logic_vector(0 to width - 1);
           q : out std_logic_vector(0 to width - 1) );
  end component reg;

  for flag_reg : reg
    use entity work.reg(gate_level)
    port map ( clock => clk, data_in => d, data_out => q );

  -- . . .

  -- not in book
  signal clock_phase1, zero_result, neg_result, overflow_result,
         zero_flag, neg_flag, overflow_flag : std_logic;
  -- end not in book

begin

  flag_reg : component reg
    generic map ( width => 3 )
    port map ( clk => clock_phase1,
               d(0) => zero_result, d(1) => neg_result,
               d(2) => overflow_result,
               q(0) => zero_flag, q(1) => neg_flag,
               q(2) => overflow_flag );

  -- . . .

  -- not in book

  stimulus : process is
  begin
    clock_phase1 <= '0';
    zero_result <= '0'; neg_result <= '0'; overflow_result <= '0'; wait for 10 ns;
    clock_phase1 <= '1', '0' after 5 ns;  wait for 10 ns;
    zero_result <= '0'; neg_result <= '0'; overflow_result <= '1'; wait for 10 ns;
    clock_phase1 <= '1', '0' after 5 ns;  wait for 10 ns;
    zero_result <= '0'; neg_result <= '1'; overflow_result <= '0'; wait for 10 ns;
    clock_phase1 <= '1', '0' after 5 ns;  wait for 10 ns;
    zero_result <= '0'; neg_result <= '1'; overflow_result <= '1'; wait for 10 ns;
    clock_phase1 <= '1', '0' after 5 ns;  wait for 10 ns;
    zero_result <= '1'; neg_result <= '0'; overflow_result <= '0'; wait for 10 ns;
    clock_phase1 <= '1', '0' after 5 ns;  wait for 10 ns;
    zero_result <= '1'; neg_result <= '0'; overflow_result <= '1'; wait for 10 ns;
    clock_phase1 <= '1', '0' after 5 ns;  wait for 10 ns;
    zero_result <= '1'; neg_result <= '1'; overflow_result <= '0'; wait for 10 ns;
    clock_phase1 <= '1', '0' after 5 ns;  wait for 10 ns;
    zero_result <= '1'; neg_result <= '1'; overflow_result <= '1'; wait for 10 ns;
    clock_phase1 <= '1', '0' after 5 ns;  wait for 10 ns;

    wait;
  end process stimulus;

  -- end not in book

end architecture structural;
