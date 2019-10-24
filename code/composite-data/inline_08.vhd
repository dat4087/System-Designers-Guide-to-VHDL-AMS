entity inline_08 is

end entity inline_08;


----------------------------------------------------------------


architecture test of inline_08 is
begin


  process_2_a : process is

    -- code from book:

    type sample is array (natural range <>) of integer;

    variable short_sample_buf : sample(0 to 63);

    subtype long_sample is sample(0 to 255);
    variable new_sample_buf, old_sample_buf : long_sample;

    constant lookup_table : sample := ( 1 => 23, 3 => -16, 2 => 100, 4 => 11);

    constant beep_sample : sample := ( 127, 63, 0, -63, -127, -63, 0, 63 );

    -- end of code from book

  begin
    wait;
  end process process_2_a;


end architecture test;
