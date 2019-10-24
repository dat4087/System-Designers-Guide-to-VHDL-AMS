entity control_sequencer is
end entity control_sequencer;



architecture test of control_sequencer is

  signal phase1, phase2, reg_file_write_en,
         A_reg_out_en, B_reg_out_en, C_reg_load_en : bit := '0';

begin

  -- code from book

  control_sequencer : process is

    procedure control_write_back is
    begin
      wait until phase1 = '1';
      reg_file_write_en <= '1';
      wait until phase2 = '0';
      reg_file_write_en <= '0';
    end procedure control_write_back;

    procedure control_arith_op is
    begin
      wait until phase1 = '1';
      A_reg_out_en <= '1';
      B_reg_out_en <= '1';
      wait until phase1 = '0';
      A_reg_out_en <= '0';
      B_reg_out_en <= '0';
      wait until phase2 = '1';
      C_reg_load_en <= '1';
      wait until phase2 = '0';
      C_reg_load_en <= '0';
      control_write_back;        -- call procedure
    end procedure control_arith_op;

    -- . . .

  begin
    -- . . .
    control_arith_op;          -- call procedure
    -- . . .
    -- not in book
    wait;
    -- end not in book
  end process control_sequencer;

  -- end code from book


  clock_gen : process is
  begin
    phase1 <= '1' after 10 ns, '0' after 20 ns;
    phase2 <= '1' after 30 ns, '0' after 40 ns;
    wait for 40 ns;
  end process clock_gen;

end architecture test;
