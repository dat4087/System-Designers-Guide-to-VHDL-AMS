-- not in book

package alu_types is

  constant data_width : positive := 32;

end package alu_types;


package io_types is

  constant data_width : positive := 32;

end package io_types;


entity controller_system is
end entity controller_system;

-- end not in book



library ieee;  use ieee.std_logic_1164.all;
use work.alu_types.all, work.io_types.all;

architecture structural of controller_system is

  alias alu_data_width is work.alu_types.data_width;
  alias io_data_width is work.io_types.data_width;

  signal alu_in1, alu_in2,
         alu_result : std_logic_vector(0 to alu_data_width - 1);
  signal  io_data : std_logic_vector(0 to io_data_width - 1);
  -- . . .

  -- not in book
  -- following should not analyze: data_width not directly visible
  -- constant test : positive := data_width;
  -- end not in book

begin

  -- . . .

end architecture structural;
