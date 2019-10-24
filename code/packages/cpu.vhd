-- not in book

entity cpu is
end entity cpu;

-- end not in book




architecture behavioral of cpu is
begin

  interpreter : process is

    variable instr_reg : work.cpu_types.word;
    variable instr_opcode : work.cpu_types.opcode;

  begin
    -- . . .    -- initialize
    loop
      -- . . .    -- fetch instruction
      instr_opcode := work.cpu_types.extract_opcode ( instr_reg );
      case instr_opcode is
        when work.cpu_types.op_nop => null;
        when work.cpu_types.op_breq => -- . . .
        -- . . .
        -- not in book
        when others => null;
        -- end not in book
      end case;
    end loop;
  end process interpreter;

end architecture behavioral;
