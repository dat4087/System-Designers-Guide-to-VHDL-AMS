-- not in book

entity cpu is
end entity cpu;

-- end not in book




architecture behavioral of cpu is
begin

  interpreter : process is

    use work.cpu_types.all;

    variable instr_reg : word;
    variable instr_opcode : opcode;

  begin
    -- . . .    -- initialize
    loop
      -- . . .    -- fetch instruction
      instr_opcode := extract_opcode ( instr_reg );
      case instr_opcode is
        when op_nop => null;
        when op_breq => -- . . .
        -- . . .
        -- not in book
        when others => null;
        -- end not in book
      end case;
    end loop;
  end process interpreter;

end architecture behavioral;
