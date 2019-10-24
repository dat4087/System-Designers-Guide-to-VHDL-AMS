-- not in book

entity computer_system is
end entity computer_system;


library util;  use util.stimulus_generators.all;

-- end not in book


architecture structure of computer_system is

  component decoder_2_to_4 is
    generic ( prop_delay : delay_length );
    port ( in0, in1 : in bit;
           out0, out1, out2, out3 : out bit );
  end component decoder_2_to_4;

  -- . . .

  -- not in book

  signal addr : bit_vector(5 downto 4);
  signal interface_a_select, interface_b_select,
         interface_c_select, interface_d_select : bit;
  -- end not in book

begin

  interface_decoder : component decoder_2_to_4
    generic map ( prop_delay => 4 ns )
    port map ( in0 => addr(4), in1 => addr(5),
               out0 => interface_a_select, out1 => interface_b_select,
               out2 => interface_c_select, out3 => interface_d_select );

  -- . . .

  -- not in book

  all_possible_values(addr, 10 ns);

  -- end not in book

end architecture structure;
