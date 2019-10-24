library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity inverting_integrator is 
  port ( terminal input, output : electrical );
end entity inverting_integrator;

----------------------------------------------------------------

architecture structural of inverting_integrator is
  terminal internal : electrical;
begin
  
  r1 : entity work.resistor(ideal)
    port map ( node1 => input, node2 => internal ) ;
        
  c1 : entity work.capacitor(leakage)
    port map ( node1 => internal, node2 => output );
        
  amp : entity work.opamp(slew_limited)
    port map ( plus_in => electrical_ref, minus_in => internal,
               output => output );
        
end architecture structural;
