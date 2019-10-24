entity thermostat is
  port ( desired_temp, actual_temp : in integer;
         heater_on : out boolean );
end entity thermostat;

--------------------------------------------------

architecture example of thermostat is
begin

  controller : process (desired_temp, actual_temp) is
  begin
    if actual_temp < desired_temp - 2 then
      heater_on <= true;
    elsif actual_temp > desired_temp + 2 then
      heater_on <= false;
    end if;
  end process controller;

end architecture example;
