entity real_subcircuit is
  port ( a, b : in bit;  y1, y2 : out bit );
end entity real_subcircuit;


architecture basic of real_subcircuit is
begin
  y1 <= a and b after 10 ns;
  y2 <= a nand b after 10 ns;
end architecture basic;



-- code from book

configuration full of circuit is

  for with_pad_delays  -- configure the architecture

    for functionality    -- configure the block

      for all : subcircuit
        use entity work.real_subcircuit(basic);
      end for;

    end for;

  end for;

end configuration full;

-- end code from book
