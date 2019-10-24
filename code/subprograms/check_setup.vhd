entity check_setup is
end entity check_setup;



architecture test of check_setup is

  -- code from book

  procedure check_setup ( signal data, clock : in bit;
                          constant Tsu : in time ) is
  begin
    if clock'event and clock = '1' then
      assert data'last_event >= Tsu
        report "setup time violation" severity error;
    end if;
  end procedure check_setup;

  -- end code from book

  signal ready, phi2 : bit := '0';
  constant Tsu_rdy_clk : delay_length := 4 ns;

begin

  -- code from book (in text)

  check_ready_setup : check_setup ( data => ready, clock => phi2,
                                    Tsu => Tsu_rdy_clk );

  -- end code from book

  clock_gen : phi2 <= '1' after 10 ns, '0' after 20 ns when phi2 = '0';

  stimulus : ready <= '1' after 4 ns,
                      '0' after 56 ns,
                      '1' after 87 ns,
                      '0' after 130 ns;

end architecture test;
