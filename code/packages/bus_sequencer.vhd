-- not in book

library ieee;  use ieee.std_logic_1164.all;

entity bus_sequencer is
  port ( rd, wr, sel, width, burst : out std_ulogic;
         addr_low_2 : out std_ulogic_vector(1 downto 0);
         ready : out std_ulogic;
         control_reg_wr, status_reg_rd, data_fifo_wr, data_fifo_rd,
         other_signal : out std_ulogic );
end entity bus_sequencer;

----------------

library ieee;  use ieee.std_logic_1164.all;

entity state_register is
  port ( phi1, phi2 : in std_ulogic;
         next_state : in std_ulogic_vector(3 downto 0);
         current_state : out std_ulogic_vector(3 downto 0) );
end entity state_register;


architecture std_cell of state_register is

begin

end architecture std_cell;

-- end not in book




architecture fsm of bus_sequencer is

  -- This architecture implements the sequencer as a finite-state machine.
  -- NOTE: it uses the clock signals from clock_pkg to synchronize the fsm.

  signal next_state_vector : -- . . .;
  -- not in book
    std_ulogic_vector(3 downto 0);
  signal current_state_vector : std_ulogic_vector(3 downto 0);
  -- end not in book

begin

  bus_sequencer_state_register : entity work.state_register(std_cell)
    port map ( phi1 => work.clock_pkg.clock_phase1,
               phi2 => work.clock_pkg.clock_phase2,
               next_state => next_state_vector,
               -- . . . );
               -- not in book
               current_state => current_state_vector );
               -- end not in book

  -- . . .

end architecture fsm;
