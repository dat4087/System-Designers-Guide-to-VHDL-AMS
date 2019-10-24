-- not in book

package adder_types is

  subtype word is integer;

end package adder_types;


use work.adder_types.all;

-- end not in book

entity adder is
  port ( a, b : in word;
         sum : out word );
end entity adder;
