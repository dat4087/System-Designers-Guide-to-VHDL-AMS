library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity motor_system_wa is  
  port ( terminal vp, vm, px1, px2, px3 : electrical);  -- 2 inputs, 3 outputs
end entity motor_system_wa;

----------------------------------------------------------------

architecture simple of motor_system_wa is
  
  quantity v_in across vp to vm;  -- Inout voltage/Current
  quantity x1 across ix1 through px1 to electrical_ref;
  quantity x2 across ix2 through px2 to electrical_ref;
  quantity x3 across ix3 through px3 to electrical_ref;
  constant Tfb : real := 0.001;
  constant Kfb : real := 1.0;
  constant Te : real := 0.001;
  constant Ke : real := 1.0;
  constant Tm : real := 0.1;
  constant Km : real := 1.0;
  constant c11 : real := -1.0/Tfb;
  constant c12  : real := 0.0;
  constant c13 : real := Kfb/Tfb;
  constant c21 : real := -Ke/Te;
  constant c22 : real := -1.0/Te;
  constant c23 : real := 0.0;
  constant c31 : real := 0.0;
  constant c32 : real := Km/Tm;
  constant c33 : real := -1.0/Tm;
  
begin  -- architecture simple
  
  x1'dot ==  c11*x1 + c12*x2 + c13*x3;
  x2'dot ==  c21*x1 + c22*x2 + c23*x3  + (Ke/Te)*v_in;
  x3'dot ==  c31*x1 + c32*x2 + c33*x3;
  
end architecture simple;
