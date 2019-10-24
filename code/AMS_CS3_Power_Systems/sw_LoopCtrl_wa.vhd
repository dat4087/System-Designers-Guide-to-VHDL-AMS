library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity sw_LoopCtrl_wa is
  generic ( r_open : resistance := 1.0e6;
            r_closed : resistance := 1.0e-3;
            sw_state : integer := 1 );       
  port ( terminal c, p1, p2 : electrical );

end entity sw_LoopCtrl_wa;

----------------------------------------------------------------

architecture ideal of sw_LoopCtrl_wa is

  quantity v1 across i1 through c to p1;
  quantity v2 across i2 through c to p2;
  quantity r1, r2 : resistance;

begin

  if (sw_state = 2) use
    r1 == r_open;
    r2 == r_closed;
  else
    r1 == r_closed;
    r2 == r_open; 
  end use;

  v1 == r1 * i1;
  v2 == r2 * i2;

end architecture ideal;
