library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
-- code from book

entity battery is
  port ( terminal plus, minus : electrical );
end entity battery;

architecture wrong of battery is
  constant v_nominal : real := 9.0;
  quantity v across plus to minus;
begin
  v == v_nominal;
end architecture wrong;

--

architecture correct of battery is
  constant v_nominal : real := 9.0;
  quantity v across i through plus to minus;
begin
  v == v_nominal;
end architecture correct;

-- end code from book

                        

library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity inline_04a is

end entity inline_04a;


architecture test of inline_04a is

  signal clamp : bit;
  quantity v1, v2 : real;

begin

  -- code from book

  if clamp = '1' use
    v1 == 5.0;
    v2 == 0.0;
  else
    v1 == v2;
  end use;

  -- end code from book

end architecture test;
                        
