entity network_driver is
end entity network_driver;


architecture test of network_driver is

  constant target_host_id : natural := 10;
  constant my_host_id : natural := 5;
  type pkt_types is (control_pkt, other_pkt);
  type pkt_header is record
      dest, src : natural;
      pkt_type : pkt_types;
      seq : natural;
    end record;

begin

  -- code from book

  network_driver : process is

    constant seq_modulo : natural := 2**5;
    subtype seq_number is natural range 0 to seq_modulo-1;
    variable next_seq_number : seq_number := 0;
    -- . . .
    -- not in book
    variable new_header : pkt_header;
    -- end not in book

    impure function generate_seq_number return seq_number is
      variable number : seq_number;
    begin
      number := next_seq_number;
      next_seq_number := (next_seq_number + 1) mod seq_modulo;
      return number;
    end function generate_seq_number;

  begin  -- network_driver
    -- not in book
    wait for 10 ns;
    -- end not in book
    -- . . .
    new_header := pkt_header'( dest => target_host_id,
                               src => my_host_id,
                               pkt_type => control_pkt,
                               seq => generate_seq_number );
    -- . . .
  end process network_driver;

  -- end code from book

end architecture test;
