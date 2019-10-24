-- to be analyzed into resource library cell_lib

library ieee;  use ieee.std_logic_1164.all;

entity ms_flipflop is
  port ( phi1, phi2 : in std_logic;
         d : in std_logic;
         q : out std_logic );
end entity ms_flipflop;


architecture normal_drive of ms_flipflop is
  signal master_d : std_logic;
begin
  master_d <= d when phi1 = '1';
  q <= master_d when phi2 = '1';
end architecture normal_drive;


architecture high_drive of ms_flipflop is
  signal master_d : std_logic;
begin
  master_d <= d when phi1 = '1';
  q <= master_d when phi2 = '1';
end architecture high_drive;



-- code from book

library cell_lib;

configuration last_high_drive of shift_reg is

  for cell_level

    for reg_array ( 0 to parallel_data'length - 2 )

      for first_cell
        for cell : master_slave_flipflop
          use entity cell_lib.ms_flipflop(normal_drive);
        end for;
      end for;

      for other_cell
        for cell : master_slave_flipflop
          use entity cell_lib.ms_flipflop(normal_drive);
        end for;
      end for;

    end for;

    for reg_array ( parallel_data'length - 1 )

      for other_cell
        for cell : master_slave_flipflop
          use entity cell_lib.ms_flipflop(high_drive);
        end for;
      end for;

    end for;

  end for;

end configuration last_high_drive;

-- end code from book
