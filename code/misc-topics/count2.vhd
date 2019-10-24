entity D_flipflop is
  port ( clk, d : in bit;  q : out bit );
end entity D_flipflop;


architecture behavioral of D_flipflop is
begin
  q <= d when clk'event and clk = '1';
end architecture behavioral;



entity inverter is
  port ( a : in bit;  y : out bit );
end entity inverter;


architecture behavioral of inverter is
begin
  y <= not a;
end architecture behavioral;



-- code from book

entity count2 is
  port ( clk : in bit;  q0, q1 : buffer bit );
end entity count2;

--------------------------------------------------

architecture buffered_outputs of count2 is

  component D_flipflop is
    port ( clk, d : in bit;  q : out bit );
  end component D_flipflop;

  component inverter is
    port ( a : in bit;  y : out bit );
  end component inverter;

  signal q0_n, q1_n : bit;

begin

  bit0 : component D_flipflop
    port map ( clk => clk, d => q0_n, q => q0 );

  inv0 : component inverter
    port map ( a => q0, y => q0_n );

  bit1 : component D_flipflop
    port map ( clk => q0_n, d => q1_n, q => q1 );

  inv1 : component inverter
    port map ( a => q1, y => q1_n );

end architecture buffered_outputs;

-- end code from book
