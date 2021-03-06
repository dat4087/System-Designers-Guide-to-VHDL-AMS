library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity triangle_waveform is
  port ( terminal pos, neg : electrical );
end entity triangle_waveform;

----------------------------------------------------------------

architecture ideal of triangle_waveform is
  
  constant freq : real := 10_000.0;  -- in Hz
  constant period : real := 1.0 / freq;
  constant amplitude : voltage := 5.0;
  constant offset : voltage := 0.0;
  signal square_wave : real := 0.0;
  quantity v across i through pos to neg;
  limit v : voltage with period / 10.0;
        
begin
  
  process is
    variable state : bit := '0';
  begin
    if state = '1' then
      square_wave <= 1.0;
    else
      square_wave <= 0.0;
    end if;
    state := not state;
    wait for period / 2.0;
  end process;
        
  v == offset + amplitude * square_wave'ramp(period / 2.0);
        
end architecture ideal;
