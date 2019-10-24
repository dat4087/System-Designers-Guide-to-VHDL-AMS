entity mux2 is
  port ( a, b, sel : in bit;
         z : out bit );
end entity mux2;

--------------------------------------------------

architecture behavioral of mux2 is

  constant prop_delay : time := 2 ns;

begin

  slick_mux : process is
  begin
    case sel is
      when '0' =>
        z <= a after prop_delay;
        wait on sel, a;
      when '1' =>
        z <= b after prop_delay;
        wait on sel, b;
    end case;
  end process slick_mux;

end architecture behavioral;
