entity receiver is
end entity receiver;



architecture test of receiver is
begin

  -- code from book

  receiver : process is

    use work.bounded_buffer_adt.all;

    variable receive_buffer : bounded_buffer := new_bounded_buffer(2048);
    variable buffer_overrun, buffer_underrun : boolean;
    -- . . .

    -- not in book
    variable received_byte, check_byte : byte;
    -- end not in book

  begin
    -- . . .

    test_full(receive_buffer, buffer_overrun);
    if not buffer_overrun then
      write(receive_buffer, received_byte);
    end if;
    -- . . .

    test_empty(receive_buffer, buffer_underrun);
    if not buffer_underrun then
      read(receive_buffer, check_byte);
    end if;
    -- . . .

  end process receiver;

  -- end code from book

end architecture test;

