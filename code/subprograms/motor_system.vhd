library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity motor_system is
  port ( terminal vp, vm : electrical;
         terminal px : electrical_vector(1 to 3) );
end entity motor_system;

----------------------------------------------------------------

architecture state_space of motor_system is
  
  quantity v_in across vp to vm;
  quantity x across i_x through px to electrical_ref;
  constant Tfb : real := 0.001;
  constant Kfb : real := 1.0;
  constant Te : real := 0.001;
  constant Ke : real := 1.0;
  constant Tm : real := 0.1;
  constant Km : real := 1.0;
        
  type real_matrix is array (1 to 3, 1 to 3) of real;
  constant c : real_matrix := ( ( -1.0/Tfb, 0.0, Kfb/Tfb ),
                                ( -Ke/Te, -1.0/Te, 0.0 ),
                                ( 0.0, Km/Tm, -1.0/Tm ) );
        
begin
  
  state_eqn : procedural is
    variable sum : real_vector(1 to 3) := (0.0, 0.0, 0.0);
  begin
    for i in 1 to 3 loop
      for j in 1 to 3 loop
        sum(i) := sum(i) + c(i, j) * x(j);
      end loop;
    end loop;
    x(1)'dot := sum(1);
    x(2)'dot := sum(2) + (Ke/Te)*v_in;
    x(3)'dot := sum(3);
  end procedural state_eqn;
        
end architecture state_space;
