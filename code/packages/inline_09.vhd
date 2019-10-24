library ieee;

entity inline_09 is

end entity inline_09;


----------------------------------------------------------------


architecture test of inline_09 is
begin

  process_5_c : process is

    use ieee.math_real.all;

    -- code from book

    type complex is record
        re : real;    -- Real part
        im : real;    -- Imaginary part
      end record;

    subtype positive_real is real range 0.0 to real'high;
    subtype principal_value is real range -math_pi to math_pi;

    type complex_polar is record
        mag : positive_real;      -- Magnitude
        arg : principal_value;    -- Angle in radians; -math_pi is illegal
      end record;

    -- end of code from book

  begin
    wait;
  end process process_5_c;


end architecture test;
