library ieee_proposed;  use ieee_proposed.thermal_systems.all;

entity thermostat is
  port ( quantity sensor_temp : in temperature;
         signal desired_temp : in real;
         signal heater_on : out boolean );
end entity thermostat;

----------------------------------------------------

architecture example of thermostat is
begin

  controller : process ( desired_temp, 
                         sensor_temp'above(desired_temp + 2.0),
                         sensor_temp'above(desired_temp - 2.0) ) is
  begin
    if sensor_temp < desired_temp - 2.0 then
      heater_on <= true;
    elsif sensor_temp > desired_temp + 2.0 then
      heater_on <= false;
    end if;
  end process controller;

end architecture example;
