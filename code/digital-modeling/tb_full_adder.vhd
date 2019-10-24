entity tb_full_adder is
end entity tb_full_adder;


library util;  use util.stimulus_generators.all;

architecture test of tb_full_adder is

  signal a, b, c_in, s, c_out : bit;
  signal test_vector : bit_vector(1 to 3);

begin

  dut : entity work.full_adder
    port map ( a => a, b => b, c_in => c_in, s => s, c_out => c_out );

  all_possible_values ( test_vector, 10 ns );

  (a, b, c_in) <= test_vector;

end architecture test;
