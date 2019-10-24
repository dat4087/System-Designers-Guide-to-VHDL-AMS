entity and2 is
  port ( a, b : in bit;  y : out bit );
end and2;

architecture basic of and2 is
begin

  and2_behavior : process is
  begin
    y <= a and b after 2 ns;
    wait on a, b;
  end process and2_behavior;

end architecture basic;
