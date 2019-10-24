entity inline_04d is
end entity inline_04d;



architecture test of inline_04d is

  signal system_clock, request, request_pending : bit := '0';

begin

  -- code from book (in text)

  request_flipflop : entity work.D_flipflop(basic)
    generic map ( Tpd_clk_q => 4 ns,
                  Tsu_d_clk => 3 ns, Th_d_clk => 1 ns )
    port map ( clk => system_clock,
               d => request, q => request_pending );

  -- end code from book

  clock_gen : system_clock <= '1' after 10 ns,
                              '0' after 20 ns when system_clock = '0';

  stimulus :  request <= '1' after  25 ns, '0' after  35 ns,
                         '1' after  67 ns, '0' after  71 ns,
                         '1' after 108 ns, '0' after 110.5 ns;
    
end architecture test;
