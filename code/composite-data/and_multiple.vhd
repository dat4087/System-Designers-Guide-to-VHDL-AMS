entity and_multiple is
  port ( i : in bit_vector;  y : out bit );
end entity and_multiple;

--------------------------------------------------

architecture behavioral of and_multiple is
begin

  and_reducer : process ( i ) is
    variable result : bit;
  begin
    result := '1';
    for index in i'range loop
      result := result and i(index);
    end loop;
    y <= result;
  end process and_reducer;

end architecture behavioral;
