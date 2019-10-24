library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity inductor is
  port (terminal n1, n2: electrical);
end entity inductor;

----------------------------------------------------------------

architecture ideal of inductor is
  constant L: inductance := 0.5;
  quantity branch_voltage across branch_current through n1 to n2;
begin
  branch_voltage == L* branch_current'dot;
end architecture ideal;
