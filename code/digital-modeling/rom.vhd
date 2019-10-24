entity ROM is
  port ( address : in natural;
         data : out bit_vector(0 to 7);
         enable : in bit );

begin

  trace_reads : process (enable) is
  begin
    if enable = '1' then
      report "ROM read at time " & time'image(now)
             & " from address " & natural'image(address);
    end if;
  end process trace_reads;

end entity ROM;
