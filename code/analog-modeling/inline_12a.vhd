library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity inline_12a is

end entity inline_12a;


architecture test of inline_12a is

  -- code from book

  type biases is (forward, reverse);
  type regions is (cutoff, saturation, linear);
  
  signal bias : biases;
  signal region : regions;

  -- end code from book

  constant threshold_voltage : voltage := 0.6;
  constant k : real := 0.0125;
  terminal gate, source, drain : electrical;
  quantity vds across ids through drain to source;
  quantity vsd across source to drain;
  quantity vgs across gate to source;
  quantity vgd across gate to drain;
  
begin

  -- code from book

  case bias use
    when forward =>
      case region use
        when cutoff =>
          ids == 0.0;
        when saturation =>
          ids == 0.5 * k * (vgs - threshold_voltage)**2;
        when linear =>
          ids == k * (vgs - threshold_voltage - 0.5*vds) * vds;
      end case;
    when reverse =>
      case region use
        when cutoff =>
          ids == 0.0;
        when saturation =>
          ids == -0.5 * k * (vgd - threshold_voltage)**2;
        when linear =>
          ids == -k * (vgd - threshold_voltage - 0.5*vsd) * vsd;
      end case;
  end case;

  -- end code from book

end architecture test;
