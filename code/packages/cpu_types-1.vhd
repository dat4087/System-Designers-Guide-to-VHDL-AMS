package cpu_types is

  constant word_size : positive := 16;
  constant address_size : positive := 24;

  subtype word is bit_vector(word_size - 1 downto 0);
  subtype address is bit_vector(address_size - 1 downto 0);

  type status_value is ( halted, idle, fetch, mem_read, mem_write,
                         io_read, io_write, int_ack );

  subtype opcode is bit_vector(5 downto 0);

  function extract_opcode ( instr_word : word ) return opcode;

  constant op_nop : opcode := "000000";
  constant op_breq : opcode := "000001";
  constant op_brne : opcode := "000010";
  constant op_add : opcode := "000011";
  -- . . .

end package cpu_types;



-- not in book

package body cpu_types is

  function extract_opcode ( instr_word : word ) return opcode is
  begin
    return work.cpu_types.op_nop;
  end function extract_opcode;

end package body cpu_types;

-- end not in book
