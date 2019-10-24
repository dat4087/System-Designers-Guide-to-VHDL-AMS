library ieee_proposed;  use ieee_proposed.mechanical_systems.all;
                        
entity gear_rv_r is
  generic ( ratio : real := 1.0 );  -- gear ratio (revs of shaft2 for 1 rev of shaft1)
                            	    -- note: can be negative, if shaft polarity changes
  port ( terminal rotv1 : rotational_v;  -- rotational velocity terminal
         terminal rot2 : rotational );	 -- rotational angle terminal
end entity gear_rv_r;

----------------------------------------------------------------

architecture ideal of gear_rv_r is

  quantity w1 across torq_vel through rotv1 to rotational_v_ref;
  quantity theta across torq_ang through rot2 to rotational_ref;

begin

  theta  == ratio * w1'integ;           -- output is angle (integral of w1)
  torq_vel == -1.0 * torq_ang * ratio;  -- input torque as function of output angle

end architecture ideal;
