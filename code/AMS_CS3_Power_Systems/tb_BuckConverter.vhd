library ieee;  use ieee.std_logic_1164.all;
library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity tb_BuckConverter is
  port ( ctrl : std_logic );
end tb_BuckConverter;

----------------------------------------------------------------

architecture tb_BuckConverter of tb_BuckConverter is

  terminal vin : electrical;
  terminal vmid : electrical;
  terminal vout : electrical;
    
begin

  L1 : entity work.inductor(ideal)
    generic map ( ind => 6.5e-3 )
    port map ( p1 => vmid, p2 => vout );
  
  C1 : entity work.capacitor(ideal)
    generic map ( cap => 1.5e-6 )
    port map ( p1 => vout, p2 => electrical_ref );
  
  VinDC : entity work.v_constant(ideal)
    generic map ( level => 42.0 )
    port map ( pos => vin, neg => electrical_ref );
  
  RLoad : entity work.resistor(ideal)
    generic map ( res => 2.4 )
    port map ( p1 => vout, p2 => electrical_ref );
  
  D1 : entity work.diode(ideal)
    port map ( p => electrical_ref, n => vmid );
  
  sw1 : entity work.switch_dig(ideal)
    port map ( sw_state => ctrl, p2 => vmid, p1 => vin );

end architecture tb_BuckConverter;
