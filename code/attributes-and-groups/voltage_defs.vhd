package voltage_defs is

  type voltage is range -2e9 to +2e9
    units
      nV;
      uV = 1000 nV;
      mV = 1000 uV;
      V = 1000 mV;
    end units voltage;

  attribute resolution : real;

  attribute resolution of nV : units is 1.0;
  attribute resolution of uV : units is 0.01;
  attribute resolution of mV : units is 0.01;
  attribute resolution of V : units is 0.001;

end package voltage_defs;
