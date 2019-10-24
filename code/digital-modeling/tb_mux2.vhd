entity tb_mux2 is
end entity tb_mux2;

architecture test of tb_mux2 is

  signal a, b, sel, z : bit;

begin

  dut : entity work.mux2(behavioral)
    port map ( a => a, b => b, sel => sel, z => z );

  stimulus : process is
    subtype stim_vector_type is bit_vector(0 to 3);
    type stim_vector_array is array ( natural range <> ) of stim_vector_type;
    constant stim_vector : stim_vector_array
      := ( "0000",
           "0100",
           "1001",
           "1101",
	   "0010",
	   "0111",
	   "1010",
	   "1111" );
  begin
    for i in stim_vector'range loop
      (a, b, sel) <= stim_vector(i)(0 to 2);
      wait for 10 ns;
      assert z = stim_vector(i)(3);
    end loop;
    wait;
  end process stimulus;


end architecture test;
