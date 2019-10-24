use work.automotive_valve_defs.all;

entity automotive_valve is
  port ( terminal p1, p2 : valve_fluidic;
         terminal control : valve_translational );
end entity automotive_valve;


-- not in book

architecture test of automotive_valve is
begin
end architecture test;

-- end not in book
