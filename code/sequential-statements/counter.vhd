entity counter is
  port ( clk : in bit;  count : out natural );
end entity counter;

--------------------------------------------------

architecture behavior of counter is
begin

  incrementer : process is
    variable count_value : natural := 0;
  begin
    count <= count_value;
    loop
      wait until clk = '1';
      count_value := (count_value + 1) mod 16;
      count <= count_value;
    end loop;
  end process incrementer;

end architecture behavior;
