-- not in book:

package coeff_ram_types is

  subtype coeff_ram_address is integer range 0 to 63;

end package coeff_ram_types;



use work.coeff_ram_types.all;

-- end not in book


entity coeff_ram is
  port ( rd, wr : in bit;  addr : in coeff_ram_address;
         d_in : in real;  d_out : out real );
end entity coeff_ram;

--------------------------------------------------

architecture abstract of coeff_ram is
begin

  memory : process is
    type coeff_array is array (coeff_ram_address) of real;
    variable coeff : coeff_array;
  begin
    for index in coeff_ram_address loop
      coeff(index) := 0.0;
    end loop;
    loop
      wait on rd, wr, addr, d_in; 
      if rd = '1' then
        d_out <= coeff(addr);
      end if;
      if wr = '1' then
        coeff(addr) := d_in;
      end if;
    end loop;
  end process memory;

end architecture abstract;
