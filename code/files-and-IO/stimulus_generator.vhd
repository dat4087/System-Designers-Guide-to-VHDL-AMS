library ieee;  use ieee.std_logic_1164.all;

entity stimulus_generator is
end entity stimulus_generator;


architecture test of stimulus_generator is



begin

  -- code from book

  stimulus_generator : process is

    type directory_file is file of string;
    file directory : directory_file open read_mode is "stimulus-directory";
    variable file_name : string(1 to 50);
    variable file_name_length : natural;
    variable open_status : file_open_status;

    subtype stimulus_vector is std_logic_vector(0 to 9);
    type stimulus_file is file of stimulus_vector;
    file stimuli : stimulus_file;
    variable current_stimulus : stimulus_vector;
    -- . . .

  begin
    file_loop : while not endfile(directory) loop
      read( directory, file_name, file_name_length );
      if file_name_length > file_name'length then
        report "file name too long: " & file_name & "... - file skipped"
          severity warning;
        next file_loop;
      end if;
      file_open ( open_status, stimuli,
                  file_name(1 to file_name_length), read_mode );
      if open_status /= open_ok then
        report file_open_status'image(open_status) & " while opening file "
               & file_name(1 to file_name_length) & " - file skipped"
          severity warning;
        next file_loop;
      end if;
      stimulus_loop : while not endfile(stimuli) loop
        read(stimuli, current_stimulus);
        -- . . .    -- apply the stimulus
      end loop stimulus_loop;
      file_close(stimuli);
    end loop file_loop;
    wait;
  end process stimulus_generator;

  -- end code from book

end architecture test;
