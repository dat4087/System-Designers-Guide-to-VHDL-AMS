library ieee_proposed;  use ieee_proposed.electrical_systems.all;
library ieee;  use ieee.math_real.all;

entity inline_01a is

end entity inline_01a;


architecture test of inline_01a is

  function inverse_exp ( x : real ) return real is
  begin
    return 10.0 * exp(-2.0e-6 * x);
  end function inverse_exp;

  -- code from book

  type domain_type is (quiescent_domain, time_domain, frequency_domain);

  --

  quantity spec_source : real spectrum 2.5, math_pi / 2.0;

  --

  function frequency return real;

  --

  quantity source1 : real spectrum inverse_exp(frequency), math_pi / 4.0;

  --

  quantity source2 : real spectrum 5.0, 1.0E-6 * frequency / math_pi;

  -- end code from book

  function frequency return real is
  begin
    return std.standard.frequency;
  end function frequency;

begin
end architecture test;
