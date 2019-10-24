entity tb_thermostat is

end entity tb_thermostat;

----------------------------------------------------------------

architecture test_example of tb_thermostat is

  signal desired_temp, actual_temp : integer := 25;
  signal heater_on : boolean := false;

begin

  dut : entity work.thermostat(example)
    port map ( desired_temp => desired_temp, actual_temp => actual_temp,
               heater_on => heater_on );

  stimulus : process is
  begin
    wait for 5 sec;
    actual_temp <= 24;		wait for 5 sec;
    actual_temp <= 23;		wait for 5 sec;
    actual_temp <= 22;		wait for 5 sec;
    actual_temp <= 21;		wait for 5 sec;
    actual_temp <= 22;		wait for 5 sec;
    actual_temp <= 23;		wait for 5 sec;
    actual_temp <= 24;		wait for 5 sec;
    actual_temp <= 25;		wait for 5 sec;
    actual_temp <= 26;		wait for 5 sec;
    actual_temp <= 27;		wait for 5 sec;
    actual_temp <= 28;		wait for 5 sec;
    actual_temp <= 29;		wait for 5 sec;
    actual_temp <= 28;		wait for 5 sec;
    actual_temp <= 27;		wait for 5 sec;
    actual_temp <= 26;		wait for 5 sec;
    actual_temp <= 25;		wait for 5 sec;
    actual_temp <= 24;		wait for 5 sec;
    actual_temp <= 23;		wait for 5 sec;
    actual_temp <= 22;		wait for 5 sec;
    actual_temp <= 21;		wait for 5 sec;
    actual_temp <= 22;		wait for 5 sec;
    actual_temp <= 23;		wait for 5 sec;
    actual_temp <= 24;		wait for 5 sec;
    actual_temp <= 25;		wait for 5 sec;
    actual_temp <= 26;		wait for 5 sec;
    actual_temp <= 27;		wait for 5 sec;
    actual_temp <= 28;		wait for 5 sec;
    actual_temp <= 29;		wait for 5 sec;
    actual_temp <= 28;		wait for 5 sec;
    actual_temp <= 27;		wait for 5 sec;
    actual_temp <= 26;		wait for 5 sec;

    desired_temp <= 30;		wait for 5 sec;
    actual_temp <= 25;		wait for 5 sec;
    actual_temp <= 26;		wait for 5 sec;
    actual_temp <= 27;		wait for 5 sec;
    actual_temp <= 28;		wait for 5 sec;
    actual_temp <= 29;		wait for 5 sec;
    actual_temp <= 30;		wait for 5 sec;
    actual_temp <= 31;		wait for 5 sec;
    actual_temp <= 32;		wait for 5 sec;
    actual_temp <= 33;		wait for 5 sec;
    actual_temp <= 34;		wait for 5 sec;
    actual_temp <= 35;		wait for 5 sec;
    actual_temp <= 34;		wait for 5 sec;
    actual_temp <= 33;		wait for 5 sec;
    actual_temp <= 32;		wait for 5 sec;
    actual_temp <= 31;		wait for 5 sec;
    actual_temp <= 30;		wait for 5 sec;

    wait;
  end process stimulus;

end architecture test_example;
