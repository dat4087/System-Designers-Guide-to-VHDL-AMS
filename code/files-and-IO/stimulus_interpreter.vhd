entity stimulus_interpreter is
end entity stimulus_interpreter;


architecture test of stimulus_interpreter is

  signal temperature, setting : integer;
  signal enable, heater_fail : bit;

begin

-- code from book

stimulus_interpreter : process is

  use std.textio.all;

  file control : text open read_mode is "control";

  variable command : line;
  variable read_ok : boolean;
  variable next_time : time;
  variable whitespace : character;
  variable signal_id : string(1 to 4);
  variable temp_value, set_value : integer;
  variable on_value, fail_value : bit;

begin

  command_loop : while not endfile(control) loop

    readline ( control, command );

    -- read next stimulus time, and suspend until then
    read ( command, next_time, read_ok );
    if not read_ok then
      report "error reading time from line: " & command.all
        severity warning;
      next command_loop;
    end if;
    wait for next_time - now;

    -- skip whitespace
    while command'length > 0
      and ( command(command'left) = ' '    -- ordinary space
            or command(command'left) = ' '  -- non-breaking space
            or command(command'left) = HT ) loop
      read ( command, whitespace );
    end loop;

    -- read signal identifier string
    read ( command, signal_id, read_ok );
    if not read_ok then
      report "error reading signal id from line: " & command.all
        severity warning;
      next command_loop;
    end if;
    -- dispatch based on signal id
    case signal_id is

      when "temp" =>
        read ( command, temp_value, read_ok );
        if not read_ok then
          report "error reading temperature value from line: "
                 & command.all
            severity warning;
          next command_loop;
        end if;
        temperature <= temp_value;

      when "set " =>
        -- . . .    -- similar to "temp"

        -- not in book
        read ( command, set_value, read_ok );
        if not read_ok then
          report "error reading setting value from line: "
                 & command.all
            severity warning;
          next command_loop;
        end if;
        setting <= set_value;
        -- end not in book

      when "on  " =>
        read ( command, on_value, read_ok );
        if not read_ok then
          report "error reading on value from line: "
                 & command.all
            severity warning;
          next command_loop;
        end if;
        enable <= on_value;

      when "fail" =>
        -- . . .    -- similar to "on  "

        -- not in book
        read ( command, fail_value, read_ok );
        if not read_ok then
          report "error reading fail value from line: "
                 & command.all
            severity warning;
          next command_loop;
        end if;
        heater_fail <= fail_value;
        -- end not in book

      when others =>
        report "invalid signal id in line: " & signal_id
          severity warning;
        next command_loop;

    end case;

  end loop command_loop;

  wait;

end process stimulus_interpreter;

-- end code from book

end architecture test;
