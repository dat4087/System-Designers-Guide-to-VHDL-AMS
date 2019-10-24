entity inline_03 is
end entity inline_03;



architecture test of inline_03 is

  signal clk, ready : bit;

begin

  dut1 : entity work.control_unit
    -- code from book (in text)
    generic map ( 200 ps, 1500 ps, false )
    -- end code from book
    port map ( clk, ready, open, open );

  dut2 : entity work.control_unit
    -- code from book (in text)
    generic map ( Tpd_clk_out => 200 ps, Tpw_clk => 1500 ps )
    -- end code from book
    port map ( clk, ready, open, open );

  dut3 : entity work.control_unit
    -- code from book (in text)
    generic map ( 200 ps, 1500 ps, debug => open )
    -- end code from book
    port map ( clk, ready, open, open );

end architecture test;
