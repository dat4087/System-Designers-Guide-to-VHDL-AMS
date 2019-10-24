entity data_logger is
end entity data_logger;


-- code from book

architecture high_level of data_logger is

  subtype byte is bit_vector(7 downto 0);

  type byte_array is array (integer range <>) of byte;

  function resolver ( bytes : byte_array ) return byte is
  begin
    if bytes'length > 0 then
      return bytes( bytes'left );
    else
      return X"00";
    end if;
  end function resolver;

  subtype resolved_byte is resolver byte;

  procedure reg ( signal clock, out_enable : in bit;
                  signal d : in byte;
                  signal q : out resolved_byte ) is
    variable stored_byte : byte;
  begin
    loop
      if clock = '1' then
        stored_byte := d;
      end if;
      if out_enable = '1' then
        q <= stored_byte;
      else
        q <= null;
      end if;
      wait on clock, out_enable, d;
    end loop;
  end procedure reg;

  signal data_bus : resolved_byte bus;
  -- . . .

  -- not in book
  signal a_reg_clk, b_reg_clk, a_reg_read, b_reg_read : bit := '0';
  signal port_a, port_b : byte := X"00";
  -- end not in book

begin

  a_reg : reg (a_reg_clk, a_reg_read, port_a, data_bus);

  b_reg : reg (b_reg_clk, b_reg_read, port_b, data_bus);

  -- . . .

  -- not in book

  stimulus : process is
  begin
    port_a <= X"11";  a_reg_clk <= '1', '0' after 5 ns;  wait for 10 ns;
    a_reg_read <= '1', '0' after 5 ns;  wait for 10 ns;
    port_b <= X"21";  b_reg_clk <= '1', '0' after 5 ns;  wait for 10 ns;
    b_reg_read <= '1', '0' after 5 ns;  wait for 10 ns;
    a_reg_read <= '1', '0' after 5 ns;
    b_reg_read <= '1', '0' after 5 ns;

    wait;
  end process stimulus;

  -- end not in book

end architecture high_level;

-- end code from book
