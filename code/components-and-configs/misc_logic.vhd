library project_lib;
library util;  use util.stimulus_generators.all;

entity misc_logic is
end entity misc_logic;


-- code from book

architecture gate_level of misc_logic is

  component nand3 is
    generic ( Tpd : delay_length );
    port ( a, b, c : in bit;  y : out bit );
  end component nand3;

  for all : nand3
    use entity project_lib.nand3(basic);

  -- . . .

  -- not in book
  signal sig1, sig2, sig3, out_sig : bit;
  signal test_vector : bit_vector(1 to 3);
  -- end not in book

begin

  gate1 : component nand3
    generic map ( Tpd => 2 ns )
    port map ( a => sig1, b => sig2, c => sig3, y => out_sig );

  -- . . .

  -- not in book

  all_possible_values(test_vector, 10 ns);

  (sig1, sig2, sig3) <= test_vector;

  -- end not in book

end architecture gate_level;

-- end code from book
