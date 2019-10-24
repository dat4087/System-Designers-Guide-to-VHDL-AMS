library ieee_proposed;
use ieee_proposed.mechanical_systems.all;
use ieee_proposed.electrical_systems.all;

entity propulsion is
  port ( signal clk, reset : in bit;    -- control inputs
         signal rpm : in natural;       -- requested rpm
         signal forward : in bit );     -- requested direction
end entity propulsion;

architecture mixed of propulsion is
  terminal p1, p2 : electrical;
  terminal shaft1, shaft2, shaft3 : rotational_v;
  signal forward_gear : bit;
  -- ...
begin

  motor : entity work.dc_motor(ideal)
    port map ( p1, p2, shaft1 );

  gear : entity work.gear_av(ideal)
    port map ( forward_gear, shaft1, shaft2 );

  intertia : entity work.inertia_av(ideal)
    port map ( shaft2, shaft3 );

  prop : entity work.propeller(ideal)
    port map ( shaft3 );

  control_section : process is
    -- variable declarations for control_section to control voltage inputs
    -- and gear shifting
    -- ...
  begin
    -- ...
    wait on clk, reset;
  end process control_section;

  -- ...

end architecture mixed;
