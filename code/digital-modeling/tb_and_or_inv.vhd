entity tb_and_or_inv is
end entity tb_and_or_inv;


architecture test of tb_and_or_inv is

  signal a1, a2, b1, b2, y : bit;

begin

  dut : entity work.and_or_inv(primitive)
    port map ( a1 => a1, a2 => a2, b1 => b1, b2 => b2,
	       y => y );

  stimulus : process is
    subtype stim_vector_type is bit_vector(0 to 3);
    type stim_vector_array is array ( natural range <> ) of stim_vector_type;
    constant stim_vector : stim_vector_array
      := ( "0000",
	   "0001",
	   "0010",
	   "0011",
           "0100",
	   "0101",
	   "0110",
	   "0111",
           "1000",
	   "1001",
	   "1010",
	   "1011",
           "1100",
	   "1101",
	   "1110",
	   "1111" );
  begin
    for i in stim_vector'range loop
      (a1, a2, b1, b2) <= stim_vector(i);
      wait for 10 ns;
      assert y = not ( (stim_vector(i)(0) and stim_vector(i)(1))
	               or (stim_vector(i)(2) and stim_vector(i)(3)) );
    end loop;
    wait;
  end process stimulus;

end architecture test;
