package cpu_types is

  constant word_size : positive := 16;

  subtype word is bit_vector(word_size - 1 downto 0);

  type status_value is ( halted, idle, fetch, mem_read, mem_write,
                         io_read, io_write, int_ack );

end package cpu_types;



package bit_vector_unsigned_arithmetic is

  function "+" ( bv1, bv2 : bit_vector ) return bit_vector;

end package bit_vector_unsigned_arithmetic;


package body bit_vector_unsigned_arithmetic is

  function "+" ( bv1, bv2 : bit_vector ) return bit_vector is

    alias norm1 : bit_vector(1 to bv1'length) is bv1;
    alias norm2 : bit_vector(1 to bv2'length) is bv2;

    variable result : bit_vector(1 to bv1'length);
    variable carry : bit := '0';

  begin
    if bv1'length /= bv2'length then
      report "arguments of different length" severity failure;
    else
      for index in norm1'reverse_range loop
        result(index) := norm1(index) xor norm2(index) xor carry;
        carry := ( norm1(index) and norm2(index) )
              or ( carry and ( norm1(index) or norm2(index) ) );
      end loop;
    end if;
    return result;
  end function "+";

end package body bit_vector_unsigned_arithmetic;




-- code from book

package DMA_controller_types_and_utilities is

  alias word is work.cpu_types.word;
  alias status_value is work.cpu_types.status_value;

  alias "+" is work.bit_vector_unsigned_arithmetic."+"
            [ bit_vector, bit_vector return bit_vector ];

  -- . . .

end package DMA_controller_types_and_utilities;

-- end code from book

