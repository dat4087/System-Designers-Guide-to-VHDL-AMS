library ieee_proposed; use ieee_proposed.electrical_systems.all;
                       
entity adc is
  port ( quantity gain : in voltage;
         terminal a : electrical;
         signal clk : in bit;
         signal d_out : out bit );
end entity adc;

architecture ideal of adc is
  
  constant ref : real := 5.0;
  quantity v_in across a;
  quantity v_amplified : voltage;
  
begin
  
  v_amplified == v_in * gain;
  
  adc_behavior: process is
    variable stored_d : bit;
  begin 
    if clk = '1' then
      if v_amplified > ref / 2.0 then
        stored_d := '1';
      else
        stored_d := '0';
      end if;
    end if;
    d_out <= stored_d after 5 ns;
    wait on clk;
  end process adc_behavior;
  
end architecture ideal;

architecture struct of adc is
  
  terminal a_amplified, ref, half_ref: electrical;
  quantity v_ref across i_ref through ref;
  signal d : bit;
  
begin
  
  res1 : entity work.resistor(ideal)
    port map ( ref, half_ref);
  
  res2 : entity work.resistor(ideal)
    port map ( half_ref, electrical_ref );
  
  amp : entity work.vc_amp(ideal)
    port map ( gain, a, a_amplified );
  
  comp : entity work.comparator(ideal)
    port map ( a_amplified, half_ref, d);
  
  ff : entity work.d_ff(basic)
    port map ( d, clk, d_out );
  
  v_ref == 5.0;
  
end architecture struct;
