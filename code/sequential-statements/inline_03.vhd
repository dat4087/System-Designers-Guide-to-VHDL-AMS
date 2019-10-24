entity inline_03 is

end entity inline_03;


----------------------------------------------------------------


architecture test of inline_03 is
begin

  process_1_c : process is

    type mode_type is (immediate, other_mode);
    type opcode_type is (load, add, subtract, other_opcode);

    variable mode : mode_type;
    variable opcode : opcode_type;
    constant immed_operand : integer := 1;
    constant memory_operand : integer := 2;
    constant address_operand : integer := 3;
    variable operand : integer;

    procedure procedure_1_c is
    begin

      -- code from book:

      if mode = immediate then
        operand := immed_operand;
      elsif opcode = load or opcode = add or opcode = subtract then
        operand := memory_operand;
      else
        operand := address_operand;
      end if;

      -- end of code from book

    end procedure_1_c;

  begin
    mode := immediate;
    procedure_1_c;

    mode := other_mode;
    opcode := load;
    procedure_1_c;

    opcode := add;
    procedure_1_c;

    opcode := subtract;
    procedure_1_c;

    opcode := other_opcode;
    procedure_1_c;

    wait;
  end process process_1_c;

end architecture test;
