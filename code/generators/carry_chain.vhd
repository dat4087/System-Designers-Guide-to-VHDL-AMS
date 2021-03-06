library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity nmos is
  port ( terminal gate, source, drain : electrical );
end entity nmos;

architecture ideal of nmos is
begin
end architecture ideal;

architecture spice_equivalent of nmos is
begin
end architecture spice_equivalent;


library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity pmos is
  port ( terminal gate, source, drain : electrical );
end entity pmos;

architecture ideal of pmos is
begin
end architecture ideal;



-- code from book

library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity carry_chain is
  generic ( n : positive );
  port ( terminal clk, c_in, c_out, vdd, vss : electrical;
         terminal p, g : electrical_vector (1 to n) );
end entity carry_chain;

----------------------------------------------------------------

architecture device_level of carry_chain is

  component nmos is
    port ( terminal gate, source, drain : electrical );
  end component nmos;

  component pmos is
    port ( terminal gate, source, drain : electrical );
  end component pmos;

  terminal c_neg : electrical_vector(0 to n-1);

begin

  bit_array : for index in 0 to n generate
    terminal clk_pulldown_drain : electrical;
  begin

    clk_pulldown : component nmos
      port map ( clk, vss, clk_pulldown_drain );

    bit_0 : if index = 0 generate
    begin
      clk_precharge : component pmos
        port map ( clk, c_neg(index), vdd );
      g_pulldown : component nmos
        port map ( c_in, clk_pulldown_drain, c_neg(index) );
    end generate bit_0;

    middle_bit : if index /= 0 and index /= n generate
    begin
      clk_precharge : component pmos
        port map ( clk, c_neg(index), vdd );
      g_pulldown : component nmos
        port map ( g(index), clk_pulldown_drain, c_neg(index) );
      p_pass : component nmos
        port map ( p(index), c_neg(index - 1), c_neg(index) );
    end generate middle_bit;

    bit_n : if index = n generate
    begin
      clk_precharge : component pmos
        port map ( clk, c_out, vdd );
      g_pulldown : component nmos
        port map ( g(index), clk_pulldown_drain, c_out );
      p_pass : component nmos
        port map ( p(index), c_neg(index - 1), c_out );
    end generate bit_n;

  end generate bit_array;

end architecture device_level;

-- end code from book
