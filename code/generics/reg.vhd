entity reg is
  generic ( width : positive );
  port ( d :  in  bit_vector(0 to width - 1);
         q :  out  bit_vector(0 to width - 1);
         clk, reset : in bit );
end entity reg;

--------------------------------------------------

architecture behavioral of reg is
begin

  behavior : process (clk, reset) is
    constant zero : bit_vector(0 to width - 1) := (others => '0');
  begin
    if reset = '1' then
      q <= zero;
    elsif clk'event and clk = '1' then
      q <= d;
    end if;
  end process behavior;

end architecture behavioral;
