entity inline_01a is

end entity inline_01a;


architecture test of inline_01a is

  quantity capacitor_voltage : real;
  constant capacitance : real := 1.0e-9;

  subtype current is real;
  
  -- code from book

  subtype charge is real tolerance "default_charge";
  quantity capacitor_charge : charge;

  --

  quantity engine_power : real tolerance "approximate_power";

  --

  quantity I_sense : current := 0.15; -- initial value is 150mA

  --

  quantity amplifier_gains : real_vector (3 downto 0) := (1.0, 1.0, 1.0, 0.5);

  -- end code from book

begin

  -- code from book

  capacitor_charge == capacitor_voltage * capacitance;

  -- end code from book

end architecture test;
