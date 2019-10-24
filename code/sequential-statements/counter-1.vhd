entity counter is
  port ( clk, reset : in bit;  count : out natural );
end entity counter;

--------------------------------------------------

architecture behavior of counter is
begin

  incrementer : process is
    variable count_value : natural := 0;
  begin
    count <= count_value;
    loop
      loop
        wait until clk = '1' or reset = '1';
        exit when reset = '1';
        count_value := (count_value + 1) mod 16;
        count <= count_value;
      end loop;
      -- at this point, reset = '1'
      count_value := 0;
      count <= count_value;
      wait until reset = '0';
    end loop;
  end process incrementer;

end architecture behavior;
