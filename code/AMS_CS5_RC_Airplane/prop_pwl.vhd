library ieee_proposed;  use ieee_proposed.mechanical_systems.all;

entity prop_pwl is
  generic ( ydata : real_vector;    -- torque data points
            xdata : real_vector );  -- velocity data points
  port ( terminal shaft1 : rotational_v );
end entity prop_pwl;

----------------------------------------------------------------

architecture ideal of prop_pwl is

  use work.pwl_functions.all;

  quantity w across torq through shaft1 to rotational_v_ref;

begin

  torq == pwl_dim1_extrap(w, xdata, ydata);

end architecture ideal;
