library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity buck_sw is
  generic ( Vd : voltage := 0.7;       -- diode voltage
            Vramp : voltage := 2.5 );  -- p-p amplitude of ramp voltage
  port ( terminal input, output, ref, ctrl: electrical );
end entity buck_sw;

----------------------------------------------------------------

architecture average of buck_sw is

  quantity Vout across Iout through output to ref;
  quantity Vin across input to ref;
  quantity Vctrl across ctrl to ref;

begin

  Vout == Vctrl * Vin / Vramp - Vd;  -- averaged equation

end architecture average;
