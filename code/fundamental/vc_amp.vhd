library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                       
entity vc_amp is
  port ( quantity g : in voltage;
         terminal a, o : electrical );
end entity vc_amp;

architecture ideal of vc_amp is
  quantity v_in across a;
  quantity v_out across i_out through o;
begin
  v_out == v_in * g;
end architecture ideal;
