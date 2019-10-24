entity max3 is
  port ( a, b, c : in integer;  z : out integer );
end entity max3;

--------------------------------------------------

architecture check_error of max3 is
begin

    maximizer : process (a, b, c)
      variable result : integer;
    begin
      if a > b then
        if a > c then
          result := a;
        else
          result := a;  -- Oops!  Should be: result := c;
        end if;
      elsif  b > c then
        result := b;
      else
        result := c;
      end if;
      assert result >= a and result >= b and result >= c
        report "inconsistent result for maximum"
        severity failure;
      z <= result;
    end process maximizer;

end architecture check_error;
