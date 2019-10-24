library ieee_proposed;  use ieee_proposed.mechanical_systems.all;

entity stop_r is
  generic ( k_stop : real := 1.0e6;
            ang_max : real := 1.05;
            ang_min : real := -1.05;
            damp_stop : real := 1.0e2 );
  port ( terminal ang1, ang2 : rotational );
end entity stop_r;

----------------------------------------------------------------

architecture ideal of stop_r is

  quantity velocity : velocity;
  quantity ang across trq through ang1 to ang2;

begin

  velocity == ang'dot;

  if ang > ang_max use	   -- Hit upper stop, generate opposing torque
    trq == k_stop * (ang - ang_max) + (damp_stop * velocity);
  elsif ang > ang_min use  -- Between stops, no opposing torque
    trq   == 0.0;
  else		           -- Hit lower stop, generate opposing torque
    trq   == k_stop * (ang - ang_min) + (damp_stop * velocity);
  end use;

  break on ang'above(ang_min), ang'above(ang_max);

end architecture ideal;
