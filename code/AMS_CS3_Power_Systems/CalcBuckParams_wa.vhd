library ieee;  use ieee.math_real.all;
library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity CalcBuckParams_wa is
  
  generic ( Vin : voltage := 42.0;           -- input voltage [Volts]
            Vout : voltage := 4.8;           -- output voltage [Volts]
            Vd : voltage := 0.7;             -- diode Voltage [Volts]
            Imin : current := 15.0e-3;       -- min output current [Amps]
            Vripple : voltage := 100.0e-3;   -- output voltage ripple [Volts]
            Resr : resistance := 50.0e-3 );

  port ( quantity Fsw : in  real;           -- switching frequency [Hz]
         quantity Lmin : out inductance;    -- minimum inductance [Henries]
         quantity Cmin : out capacitance);  -- minimum capacitance [Farads]

end entity CalcBuckParams_wa ;

----------------------------------------------------------------

architecture ideal of CalcBuckParams_wa is

  constant D : real := (Vout + Vd)/(Vin + 1.0e-9);   -- Duty Cycle
  quantity Ts : real;   -- Period
  quantity Ton : real;  -- On Time

  quantity Fxo, Fp1, Fp2, Fz : real; 

begin  -- architecture behavioral

  Ts == 1.0/(Fsw+1.0e-9);
  Ton == D*Ts;
  Lmin == (Vin - Vout) * Ton/(2.0*Imin);
  Cmin == (2.0*Imin)/(8.0*Fsw*Vripple+1.0e-9);

  -- Calculate compensator parameters
  Fxo == Fsw/5.0;  -- desired crossover frequency
  Fp1 == Fxo * 1.5;
  Fp2 == 1.0/(math_2_pi*Resr*Cmin*4.0+1.0e-9);
  Fz == 1.0/(math_2_pi*sqrt(Lmin*Cmin*4.0)+1.0e-9);

end architecture ideal;
