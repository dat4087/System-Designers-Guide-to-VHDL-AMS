-- not in book

entity signal_generator is
  generic ( period : delay_length := 20 ns;
            pulse_count : natural := 5 );
end entity signal_generator;

-- end not in book


library ieee;  use ieee.std_logic_1164.all;

architecture top_level of signal_generator is

  signal raw_signal : std_ulogic;
  -- . . .

  procedure generate_pulse_train ( width, separation : in delay_length;
                                   number : in natural;
                                   signal s : out std_ulogic ) is
  begin
    for count in 1 to number loop
      s <= '1', '0' after width;
      wait for width + separation;
    end loop;
  end procedure generate_pulse_train;

begin

  raw_signal_generator : process is
  begin
    -- . . .
    generate_pulse_train ( width => period / 2,
                           separation => period - period / 2,
                           number => pulse_count,
                           s => raw_signal );
    -- . . .
    -- not in book
    wait;
    -- end not in book
  end process raw_signal_generator;

  -- . . .

end architecture top_level;
