entity tb_full is
end entity tb_full;


library util;  use util.stimulus_generators.all;

architecture test of tb_full is

  signal in1, in2, in3, out1, out2 : bit;
  signal test_vector : bit_vector(1 to 3);

begin

  dut : configuration work.full
    generic map ( inpad_delay => 2 ns, outpad_delay => 3 ns )
    port map ( in1 => in1, in2 => in2, in3 => in3, out1 => out1, out2 => out2 );

  stimulus : all_possible_values ( test_vector, 50 ns );

  (in1, in2, in3) <= test_vector;

end architecture test;
