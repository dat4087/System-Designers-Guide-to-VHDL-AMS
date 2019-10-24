library ieee_proposed;  use ieee_proposed.electrical_systems.all;

entity MeasFreq is
  generic ( thres : real := 0.0 );
  port ( terminal input : electrical;
         signal f_out : out real := 0.0 );
end entity MeasFreq;

----------------------------------------------------------------

architecture ThresDetect of MeasFreq is

  quantity vin across input;

begin

  detect : process ( vin'above(thres) ) is
    variable t_old : real := real'low;
  begin
    if vin'above(thres) then
      f_out <= 1.0 / (now - t_old);
      t_old := now;
    end if;
  end process detect;

end ThresDetect;
