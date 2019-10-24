entity inline_08 is

end entity inline_08;


----------------------------------------------------------------


architecture test of inline_08 is
begin

  process_2_c : process is

    -- code from book:

    type opcodes is
      (nop, add, subtract, load, store, jump, jumpsub, branch, halt);

    subtype control_transfer_opcodes is opcodes range jump to branch;

    -- end of code from book

    variable opcode : opcodes;
    variable operand : integer;
    constant memory_operand : integer := 1;
    constant address_operand : integer := 2;

  begin

    for i in opcodes loop
      opcode := i;

      -- code from book:

      case opcode is
        when load | add | subtract =>
          operand := memory_operand;
        when store | jump | jumpsub | branch =>
          operand := address_operand;
        when others =>
          operand := 0;
      end case;

      --

      case opcode is
        when add to load =>
          operand := memory_operand;
        when branch downto store =>
          operand := address_operand;
        when others =>
          operand := 0;
      end case;

      -- end of code from book

      case opcode is
        when add to load =>
          operand := memory_operand;
        -- code from book:
        when control_transfer_opcodes | store =>
          operand := address_operand;
        -- end of code from book
        when others =>
          operand := 0;
      end case;

    end loop;

    wait;
  end process process_2_c;


end architecture test;
