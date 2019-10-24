entity full_adder is
  port ( a, b, c_in : bit;  s, c_out : out bit );
end entity full_adder;


architecture truth_table of full_adder is
begin

  with bit_vector'(a, b, c_in) select
    (c_out, s) <= bit_vector'("00") when "000",
                  bit_vector'("01") when "001",
                  bit_vector'("01") when "010",
                  bit_vector'("10") when "011",
                  bit_vector'("01") when "100",
                  bit_vector'("10") when "101",
                  bit_vector'("10") when "110",
                  bit_vector'("11") when "111";

end architecture truth_table;
