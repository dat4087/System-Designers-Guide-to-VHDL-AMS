library IEEE;  use IEEE.MATH_REAL.all;
library IEEE_proposed;  use IEEE_proposed.ELECTRICAL_SYSTEMS.all;

entity src_sine is

  generic ( freq : real;              -- frequency [Hertz]
            amplitude : voltage;      -- amplitude [Volts]
            phase : real := 0.0;      -- initial phase [Degrees]
            offset : voltage := 0.0;  -- DC value [Volts]
            df : real := 0.0;         -- damping factor [1/second]
            ac_mag : voltage := 1.0;  -- AC magnitude [Volts]
            ac_phase : real := 0.0);  -- AC phase [Degrees]

  port ( quantity output : out real );

end entity src_sine;


architecture ideal of src_sine is
  
  -- Declare quantity for phase in radians (calculated below)
  quantity phase_rad : real;
  -- Declare quantity in frequency domain for AC analysis
  quantity ac_spec : real spectrum ac_mag, math_2_pi * ac_phase / 360.0;

begin
  
  -- Convert phase to radians
  phase_rad == math_2_pi *(freq * now + phase / 360.0);

  if domain = quiescent_domain or domain = time_domain use
    output == offset + amplitude * sin(phase_rad) * exp(-now * df);
  else
    output == ac_spec;  -- used for Frequency (AC) analysis
  end use;

end architecture ideal;
