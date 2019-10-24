library ieee;  use ieee.math_real.all;
library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity opamp_2pole is
  port ( terminal in_pos, in_neg, output : electrical );
end entity opamp_2pole;

----------------------------------------------------------------

architecture dot of opamp_2pole is

  constant A : real := 1.0e6;                      -- open loop gain
  constant fp1 : real := 5.0;                      -- first pole
  constant fp2 : real := 9.0e5;                    -- second pole
  constant tp1 : real := 1.0 / (fp1 * math_2_pi);  -- first time constant
  constant tp2 : real := 1.0 / (fp2 * math_2_pi);  -- second time constant
  quantity v_in across in_pos to in_neg;					
  quantity v_out across i_out through output;

begin

  v_in == (tp1 * tp2) * v_out'dot'dot / A
          + (tp1 + tp2) * v_out'dot / A + v_out / A;

end architecture dot;

----------------------------------------------------------------

architecture ltf of opamp_2pole is

  constant A : real := 1.0e6;		   -- open loop gain
  constant fp1 : real := 5.0;		   -- first pole (Hz)
  constant fp2 : real := 9.0e5;		   -- second pole (Hz)
  constant wp1 : real := fp1 * math_2_pi;  -- first pole (rad/s)
  constant wp2 : real := fp2 * math_2_pi;  -- second pole (rad/s)
  constant num : real_vector := (0 => wp1 * wp2 * A);
  constant den : real_vector := (wp1 * wp2, wp1 + wp2, 1.0);
  quantity v_in across in_pos to in_neg;
  quantity v_out across i_out through output;

begin

  v_out == v_in'ltf(num, den);

end architecture ltf;
