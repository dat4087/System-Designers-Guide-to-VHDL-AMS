library ieee;  use ieee.std_logic_1164.all;

entity inline_02 is
end entity inline_02;


architecture test of inline_02 is

  signal unbuffered_clock : std_logic;
  signal buffered_clock_array : std_logic_vector(0 to 7);

begin

  -- code from book (in text)

  clock_buffer_tree : entity work.fanout_tree(recursive)
    generic map ( height => 3 )
    port map ( input => unbuffered_clock,
               output => buffered_clock_array );

  -- end code from book

  clock_gen : process is
  begin
    unbuffered_clock <= '1' after 5 ns, '0' after 10 ns;
    wait for 10 ns;
  end process clock_gen;

end architecture test;
