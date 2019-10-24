entity lead_lag_ztf is
  
  generic ( a1 : real := 2.003140;
            a2 : real := -1.996860;
            b1 : real := 3.250000;
            b2 : real := -0.750000;
            k : real := 400.0;		 -- normalizing gain
            tsampl : real := 0.1e-3;	 -- sample period
            init_delay : real := 0.0 );  -- optional delay
        
  port ( quantity input : in real;
         quantity output : out real );
        
end entity lead_lag_ztf;

----------------------------------------------------------------

architecture simple of lead_lag_ztf is

  constant num: real_vector := (a1, a2);
  constant den: real_vector := (b1, b2);

begin

  output == k * input'ztf(num, den, tsampl, init_delay);  -- implement transfer function

end architecture simple;
