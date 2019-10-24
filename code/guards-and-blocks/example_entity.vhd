-- not in book

entity example_entity is
end entity example_entity;

-- end not in book


architecture contrived of example_entity is

  constant sig_width : positive := 16;
  signal s1, s2, s3 : bit_vector (0 to sig_width - 1);
  signal sel : bit;
  -- . . .

begin

  mux : block is
    generic ( width : positive );
    generic map ( width => sig_width );
    port ( d0, d1 : in bit_vector(0 to width - 1);
           y : out bit_vector(0 to width - 1);
           sel : in bit);
    port map ( d0 => s1, d1=> s2, y => s3, sel => sel );

    constant zero : bit_vector(0 to width - 1) := ( others => '0' );
    signal gated_d0, gated_d1 : bit_vector(0 to width - 1);

  begin
    gated_d0 <= d0 when sel = '0' else zero;
    gated_d1 <= d1 when sel = '1' else zero;
    y <= gated_d0 or gated_d1;
  end block mux;

  -- . . .

  -- not in book

  stimulus : process is
  begin
    s1 <= X"1111";  s2 <= X"2222";  sel <= '0';  wait for 10 ns;
    s1 <= X"0101";  wait for 10 ns;
    s2 <= X"0202";  wait for 10 ns;
    sel <= '1';  wait for 10 ns;
    s1 <= X"0001";  wait for 10 ns;
    s2 <= X"0002";  wait for 10 ns;

    wait;
  end process stimulus;

  -- end not in book

end architecture contrived;
