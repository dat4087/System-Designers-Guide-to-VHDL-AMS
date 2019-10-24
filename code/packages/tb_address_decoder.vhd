entity tb_address_decoder is
end entity tb_address_decoder;


architecture test of tb_address_decoder is

  use work.cpu_types.all;

  signal addr : address := X"000000";
  signal status : status_value := idle;
  signal mem_sel, int_sel, io_sel : bit;

begin

  dut : entity work.address_decoder
    port map ( addr => addr, status => status,
               mem_sel => mem_sel, int_sel => int_sel, io_sel => io_sel );

  stimulus : process is
  begin
    wait for 10 ns;

    status <= fetch;      wait for 10 ns;
    status <= mem_read;   wait for 10 ns;
    status <= mem_write;  wait for 10 ns;
    status <= io_read;    wait for 10 ns;
    status <= io_write;   wait for 10 ns;
    status <= int_ack;    wait for 10 ns;
    status <= idle;       wait for 10 ns;

    addr <= X"EFFFFF";    wait for 10 ns;
    status <= fetch;      wait for 10 ns;
    status <= mem_read;   wait for 10 ns;
    status <= mem_write;  wait for 10 ns;
    status <= io_read;    wait for 10 ns;
    status <= io_write;   wait for 10 ns;
    status <= int_ack;    wait for 10 ns;
    status <= idle;       wait for 10 ns;

    addr <= X"F00000";    wait for 10 ns;
    status <= fetch;      wait for 10 ns;
    status <= mem_read;   wait for 10 ns;
    status <= mem_write;  wait for 10 ns;
    status <= io_read;    wait for 10 ns;
    status <= io_write;   wait for 10 ns;
    status <= int_ack;    wait for 10 ns;
    status <= idle;       wait for 10 ns;

    addr <= X"FFFFFF";    wait for 10 ns;
    status <= fetch;      wait for 10 ns;
    status <= mem_read;   wait for 10 ns;
    status <= mem_write;  wait for 10 ns;
    status <= io_read;    wait for 10 ns;
    status <= io_write;   wait for 10 ns;
    status <= int_ack;    wait for 10 ns;
    status <= idle;       wait for 10 ns;

    wait;
  end process stimulus;

end architecture test;
