entity inline_19 is

end entity inline_19;


----------------------------------------------------------------


architecture test of inline_19 is

  subtype data_type is integer;

  signal transmit_data : data_type := 0;

begin


  -- code from book:
  
  transmit_element : process (transmit_data) is
    -- . . .      -- variable declarations
  begin
    report "transmit_element: data = "
        & data_type'image(transmit_data);
    -- . . .
  end process transmit_element;

  -- end of code from book


  stimulus : process is
  begin
    transmit_data <= 10 after 10 ns, 20 after 20 ns;
    wait;
  end process stimulus;


end architecture test;
