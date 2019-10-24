-- not in book
library ieee;  use ieee.std_logic_1164.all;

entity controller is
end entity controller;

-- end not in book


architecture structural of controller is

  component reg is
    generic ( width : positive );
    port ( clock : in std_logic;
           data_in : in std_logic_vector(0 to width - 1);
           data_out : out std_logic_vector(0 to width - 1) );
  end component reg;

  -- . . .

  -- not in book
  subtype state_type is std_logic_vector(0 to 5);
  signal clock_phase1 : std_logic;
  signal next_state, current_state : state_type;
  -- end not in book

begin

  state_reg : component reg
    generic map ( width => state_type'length )
    port map ( clock => clock_phase1,
               data_in => next_state,
               data_out => current_state );

  -- . . .

end architecture structural;
