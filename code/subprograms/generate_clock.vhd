entity generate_clock is
end entity generate_clock;



library ieee;  use ieee.std_logic_1164.all;

architecture test of generate_clock is

  -- code from book

  procedure generate_clock ( signal clk : out std_ulogic;
                             constant Tperiod, Tpulse, Tphase : in time ) is
  begin
    wait for Tphase;
    loop
      clk <= '1', '0' after Tpulse;
      wait for Tperiod;
    end loop;
  end procedure generate_clock;

  -- end code from book

  -- code from book (in text)

  signal phi1, phi2 : std_ulogic := '0';
  -- . . .

  -- end code from book

begin

  -- code from book (in text)

  gen_phi1 : generate_clock ( phi1, Tperiod => 50 ns, Tpulse => 20 ns,
                                    Tphase => 0 ns );

  gen_phi2 : generate_clock ( phi2, Tperiod => 50 ns, Tpulse => 20 ns,
                                    Tphase => 25 ns );

  -- end code from book

end architecture test;
