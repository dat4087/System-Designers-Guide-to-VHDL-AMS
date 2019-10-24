entity D_flipflop is
  generic ( Tpd_clk_q, Tsu_d_clk, Th_d_clk : delay_length );
  port ( clk, d : in bit;  q : out bit );
end entity D_flipflop;

--------------------------------------------------

architecture basic of D_flipflop is
begin

  behavior : q <= d after Tpd_clk_q when clk = '1' and clk'event;

  check_setup : process is
  begin
    wait until clk = '1';
    assert d'last_event >= Tsu_d_clk
      report "setup violation";
  end process check_setup;

  check_hold : process is
  begin
    wait until clk'delayed(Th_d_clk) = '1';
    assert d'delayed'last_event >= Th_d_clk
      report "hold violation";
  end process check_hold;

end architecture basic;
