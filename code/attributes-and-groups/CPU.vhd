package cell_attributes is

  type length is range 0 to integer'high
    units nm;
      um = 1000 nm;
      mm = 1000 um;
      mil = 25400 nm;
    end units length;

  type coordinate is record
      x, y : length;
    end record coordinate;

  attribute cell_position : coordinate;

end package cell_attributes;



entity CPU is
end entity CPU;


-- code from book

architecture cell_based of CPU is

  component fpu is
    port ( -- . . . );
    -- not in book
    port_name : bit := '0' );
    -- end not in book
  end component;

  use work.cell_attributes.all;

  attribute cell_position of the_fpu : label is ( 540 um, 1200 um );

  -- . . .

begin

  the_fpu : component fpu
    port map ( -- . . . );
    -- not in book
    port_name => open );
    -- end not in book

  -- . . .

end architecture cell_based;

-- end code from book
