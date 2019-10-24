-- not in book

entity misc_logic is
end entity misc_logic;

-- end not in book



use work.MVL4.all;

architecture gate_level of misc_logic is

  signal src1, src1_enable : MVL4_ulogic;
  signal src2, src2_enable : MVL4_ulogic;
  signal selected_val : MVL4_logic;
  -- . . .

begin

  src1_buffer : entity work.tri_state_buffer(behavioral)
    port map ( a => src1, enable => src1_enable, y => selected_val );

  src2_buffer : entity work.tri_state_buffer(behavioral)
    port map ( a => src2, enable => src2_enable, y => selected_val );

  -- . . .

  -- not in book

  stimulus : process is
  begin
    wait for 10 ns;
    src1_enable <= '0';  src2_enable <= '0';  wait for 10 ns;
    src1 <= '0';         src2 <= '1';         wait for 10 ns;
    src1_enable <= '1';                       wait for 10 ns;
    src1 <= 'Z';                              wait for 10 ns;
    src1 <= '1';                              wait for 10 ns;
    src1_enable <= '0';                       wait for 10 ns;
                         src2_enable <= '1';  wait for 10 ns;
                         src2 <= 'Z';         wait for 10 ns;
                         src2 <= '0';         wait for 10 ns;
                         src2_enable <= '0';  wait for 10 ns;
    src1_enable <= '1';  src2_enable <= '1';  wait for 10 ns;
    src1 <= '0';                              wait for 10 ns;
    src1 <= 'X';                              wait for 10 ns;
    src1 <= '1';         src2 <= '1';         wait for 10 ns;

    wait;
  end process stimulus;

  -- end not in book

end architecture gate_level;
