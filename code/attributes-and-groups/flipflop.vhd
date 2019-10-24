entity flipflop is
  generic ( Tsetup : delay_length );
  port ( clk, d : in bit;  q : out bit );
end entity flipflop;


-- code from book

architecture behavior of flipflop is
begin

  timing_check : process (clk) is
  begin
    if clk = '1' then
      assert d'last_event >= Tsetup
        report "set up violation detected in " & timing_check'path_name
        severity error;
    end if;
  end process timing_check;

  -- . . .    -- functionality

end architecture behavior;

-- end code from book
