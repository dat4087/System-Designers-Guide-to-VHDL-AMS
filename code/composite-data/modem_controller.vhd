entity modem_controller is

end entity modem_controller;


----------------------------------------------------------------


architecture test of modem_controller is
begin

  -- code from book:

  modem_controller : process is

    type symbol is ('a', 't', 'd', 'h', digit, cr, other);
    type symbol_string is array (1 to 20) of symbol;
    type state is range 0 to 6;
    type transition_matrix is array (state, symbol) of state;

    constant next_state : transition_matrix :=
      ( 0 => ('a' => 1, others => 6),
        1 => ('t' => 2, others => 6),
        2 => ('d' => 3, 'h' => 5, others => 6),
        3 => (digit => 4, others => 6),
        4 => (digit => 4, cr => 0, others => 6),
        5 => (cr => 0, others => 6),
        6 => (cr => 0, others => 6) );

    variable command : symbol_string;
    variable current_state : state := 0;

    -- not in book:
    type sample_array is array (positive range <>) of symbol_string;
    constant sample_command : sample_array :=
      ( 1 => ( 'a', 't', 'd', digit, digit, cr, others => other ),
        2 => ( 'a', 't', 'h', cr, others => other ),
        3 => ( 'a', 't', other, other, cr, others => other ) );
    -- end not in book

  begin
    -- . . .
    -- not in book:
    for command_index in sample_command'range loop
      command := sample_command(command_index);
    -- end not in book
    for index in 1 to 20 loop
      current_state := next_state( current_state, command(index) );
      case current_state is
        -- . . .
        -- not in book:
        when 0 => exit;
        when others => null;
        -- end not in book
      end case;
    end loop;
    -- . . .
    -- not in book:
    end loop;
    wait;
    -- end not in book
  end process modem_controller;

  -- end of code from book

end architecture test;
