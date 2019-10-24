entity SR_flipflop is
  port ( S, R : in bit;  Q : out bit );
end entity SR_flipflop;

--------------------------------------------------

architecture checking of SR_flipflop is
begin

    set_reset : process (S, R) is
    begin
      assert S = '1' nand R = '1';
      if S = '1' then
        Q <= '1';
      end if;
      if R = '1' then
        Q <= '0';
      end if;
    end process set_reset;

end architecture checking;
