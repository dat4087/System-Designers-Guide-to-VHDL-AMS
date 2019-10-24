library ieee, ieee_proposed;
use ieee_proposed.electrical_systems.all;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity bfsk_wa is

  generic ( fc : real := 455.0e3;       -- mean carrier frequency
            delta_f : real := 5.0e3;    -- difference between low and high
                                        --   carrier frequency
            amp : voltage := 1.0;       -- amplitude of modulated signal
            offset : voltage := 0.0 );  -- output offset voltage

  port ( signal d_in : in std_logic;     -- digital input
         terminal a_out : electrical );  -- output terminal 

end entity bfsk_wa;

----------------------------------------------------------------

architecture behavioral of bfsk_wa is

  quantity vout across iout through a_out;         -- output branch
  quantity phi : real;                             -- free quantity angle in radians
  constant wc : real := math_2_pi * fc;            -- convert fc to rad/s
  constant delta_w : real := math_2_pi * delta_f;  -- convert delta_f to rad/s

begin

  if To_X01(d_in) = '0' use
    phi'dot == wc;             -- set to carrier frequency
  elsif To_X01(d_in) = '1' use
    phi'dot == wc + delta_w;   -- set to carrier frequency + delta
  else
    phi'dot == 0.0;
  end use;

  vout == offset + amp * sin(phi);  -- create sinusoidal output using phi

end architecture behavioral;




