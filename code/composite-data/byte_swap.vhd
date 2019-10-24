-- not in book:

package byte_swap_types is

  subtype halfword is bit_vector(0 to 15);

end package byte_swap_types;


use work.byte_swap_types.all;

-- end not in book:


entity byte_swap is
  port (input : in halfword;  output : out halfword);
end entity byte_swap;

--------------------------------------------------

architecture behavior of byte_swap is

begin

  swap : process (input)
  begin
    output(8 to 15) <= input(0 to 7);
    output(0 to 7) <= input(8 to 15);
  end process swap;

end architecture behavior;
