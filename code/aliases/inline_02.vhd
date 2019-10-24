entity inline_02 is

end entity inline_02;


----------------------------------------------------------------


architecture test of inline_02 is
begin


  process_1_a : process is

    -- code from book:

    type register_array is array (0 to 15) of bit_vector(31 downto 0);

    type register_set is record
        general_purpose_registers : register_array;
        program_counter : bit_vector(31 downto 0);
        program_status : bit_vector(31 downto 0);
      end record;

    variable CPU_registers : register_set;

    alias PSW is CPU_registers.program_status;
    alias PC is CPU_registers.program_counter;
    alias GPR is CPU_registers.general_purpose_registers;

    alias SP is CPU_registers.general_purpose_registers(15);

    alias interrupt_level is PSW(30 downto 26);

    -- end of code from book

    procedure procedure_1_b is

      -- code from book:

      alias SP is GPR(15);

      alias interrupt_level : bit_vector(4 downto 0) is PSW(30 downto 26);

      -- end of code from book

    begin
    end procedure procedure_1_b;

  begin
    wait;
  end process process_1_a;


end architecture test;
