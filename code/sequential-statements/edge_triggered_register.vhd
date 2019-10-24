entity edge_triggered_register is
  port ( clock : in bit; 
         d_in : in real;  d_out : out real );
end entity edge_triggered_register;

--------------------------------------------------

architecture check_timing of edge_triggered_register is
begin

  store_and_check : process (clock) is
    variable stored_value : real;
    variable pulse_start : time;
  begin
    case clock is
      when '1' =>
        pulse_start := now;
        stored_value := d_in;
        d_out <= stored_value;
      when '0' =>
        assert now = 0 ns or (now - pulse_start) >= 5 ns
          report "clock pulse too short"; 
    end case;
  end process store_and_check;

end architecture check_timing;
