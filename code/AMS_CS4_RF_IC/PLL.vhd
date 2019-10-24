library ieee_proposed;  use ieee_proposed.electrical_systems.all;
library ieee;  use ieee.math_real.all;
               
entity PLL is

  generic ( Fp : real := 20.0e3;   -- loop filter pole freq [Hz]
            Fz : real := 1.0e6;	   -- loop filter zero freq [Hz]
            Kv : real := 100.0e3;  -- VCO gain [Hz/V]
            Fc : real := 1.0e6 );  -- VCO center freq [Hz]

  port ( terminal input, lf_out, vco_out : electrical );

end entity PLL;

----------------------------------------------------------------

architecture behavioral of PLL is

  quantity v_in across input to electrical_ref;
  quantity v_lf across i_lf through lf_out to electrical_ref;
  quantity v_vco across i_vco through vco_out to electrical_ref;

  -- internal quantities and constants

  -- multiplier 
  quantity mult : real;

  -- loop filter (Lag) 
  constant wp : real  := math_2_pi * fp;	  -- pole freq in rad/s
  constant wz : real  := math_2_pi * fz;	  -- zero freq in rad/s
  constant num : real_vector := (1.0, 1.0 / wz);  -- numerator array 
  constant den : real_vector := (1.0, 1.0 / wp);  -- denominator array

  -- VCO
  quantity phi : real;				  -- used in VCO equation
  constant Kv_w	: real := math_2_pi * Kv;	  -- change gain to (rad/s)/V
  constant wc : real := math_2_pi * Fc;		  -- change freq to rad/s

begin

  if domain = quiescent_domain use
    phi == 0.0;                     -- initialize phi
  else
    phi'dot == wc + Kv_w * (v_lf);  -- calculate VCO frequency
  end use;

  mult == v_in * v_vco;		    -- multiplier output

  v_lf == mult'ltf(num, den);	    -- loop filter output

  v_vco == cos(phi);		    -- VCO output

end architecture behavioral;
