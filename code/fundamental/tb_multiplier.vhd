entity shift_adder is
  port ( addend : in integer;  augend : in integer;
         sum : out integer;
         add_control : in bit );
end entity shift_adder;

----------------------------------------------------------------

architecture behavior of shift_adder is
begin
end architecture behavior;

----------------------------------------------------------------

entity reg is
  port ( d : in integer;  q : out integer;
         en : in bit;  reset : in bit );
end entity reg;

----------------------------------------------------------------

architecture behavior of reg is
begin
end architecture behavior;

----------------------------------------------------------------

entity shift_reg is
  port ( d : in integer;  q : out bit;
         load : in bit;  clk : in bit );
end entity shift_reg;

----------------------------------------------------------------

architecture behavior of shift_reg is
begin
end architecture behavior;
