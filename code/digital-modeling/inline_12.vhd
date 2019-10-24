entity inline_12 is

end entity inline_12;


----------------------------------------------------------------


architecture test of inline_12 is

  signal top_a, bottom_a : bit := '0';
  signal top_y, bottom_y : bit;

begin


  block_3_m : block is
    port ( a : in bit;  y : out bit := '1' );
    port map ( a => top_a, y => top_y );

  begin

    -- code from book:

    inv : process (a) is
    begin
      y <= inertial not a after 3 ns;
    end process inv;

    -- end of code from book

  end block block_3_m;


  ----------------


  block_3_n : block is
    port ( a : in bit;  y : out bit := '1' );
    port map ( a => bottom_a, y => bottom_y);

  begin

    -- code from book:

    inv : process (a) is
    begin
      y <= reject 2 ns inertial not a after 3 ns;
    end process inv;

    -- end of code from book

  end block block_3_n;


  ----------------


  stimulus_3_m_n : process is
  begin
    top_a <= '1' after 1 ns,
             '0' after 6 ns,
             '1' after 8 ns;
    bottom_a <= '1' after 1 ns,
                '0' after 6 ns,
                '1' after 9 ns,
                '0' after 11.5 ns,
                '1' after 16 ns,
                '0' after 18 ns,
                '1' after 19 ns,
                '0' after 20 ns;

    wait;
  end process stimulus_3_m_n;


end architecture test;
