entity inline_04d is

end entity inline_04d;


----------------------------------------------------------------


architecture test of inline_04d is

  type opcode_type is (opcode_1, opcode_2, halt_opcode);
  signal opcode : opcode_type := opcode_1;

  signal halt_indicator : boolean := false;

begin

  process_1_d : process (opcode) is

    variable PC : integer := 0;
    constant effective_address : integer := 1;
    variable executing : boolean := true;

  begin

    -- code from book:

    if opcode = halt_opcode then
      PC := effective_address;
      executing := false;
      halt_indicator <= true;
    end if;

    -- end of code from book

  end process process_1_d;

  stimulus : process is
  begin
    opcode <= opcode_2 after 100 ns, halt_opcode after 200 ns;
    wait;
  end process stimulus;

end architecture test;
