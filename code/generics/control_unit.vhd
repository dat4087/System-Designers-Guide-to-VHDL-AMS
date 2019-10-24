-- code from book

entity control_unit is

  generic ( Tpd_clk_out, Tpw_clk : delay_length;
            debug : boolean := false );

  port ( clk : in bit;
         ready : in bit;
         control1, control2 : out bit );

end entity control_unit;

-- end code from book



architecture test of control_unit is
begin
end architecture test;
