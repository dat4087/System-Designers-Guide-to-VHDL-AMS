entity inline_01 is

end entity inline_01;


----------------------------------------------------------------


architecture test of inline_01 is
begin


  block_1_a : block is

    -- code from book:

    type word is array (0 to 31) of bit;

    --

    type controller_state is (initial, idle, active, error);

    type state_counts is array (idle to error) of natural;

    -- end of code from book

  begin
  end block block_1_a;


  process_1_a : process is

    -- code from book:

    type word is array (31 downto 0) of bit;

    --

    type controller_state is (initial, idle, active, error);

    --

    type state_counts is
      array (controller_state range idle to error) of natural;

    --

    subtype coeff_ram_address is integer range 0 to 63;
    type coeff_array is array (coeff_ram_address) of real;

    --

    variable buffer_register, data_register : word;
    variable counters : state_counts;
    variable coeff : coeff_array;

    -- end of code from book

  begin

    -- code from book:

    coeff(0) := 0.0;

    counters(active) := counters(active) + 1;

    data_register := buffer_register;

    -- end of code from book

    wait;
  end process process_1_a;


end architecture test;
