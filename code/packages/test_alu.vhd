library ieee;

package alu_types is

  -- code from book (in text)

  use ieee.numeric_bit.all;
  subtype ALU_func is unsigned(3 downto 0);
  subtype data_word is unsigned(15 downto 0);
  -- . . .

  -- end code from book (in text)

end package alu_types;



use work.alu_types.all;

-- code from book (in text)

entity ALU is
  port ( a, b : in data_word;  func : in ALU_func;
         result : out data_word;  carry : out bit );
end entity ALU;

-- end code from book (in text)



architecture structural of ALU is
begin
end architecture structural;


entity test_ALU is
end entity test_ALU;



library ieee;
use work.alu_types.all;

-- code from book

architecture random_test of test_ALU is

  use ieee.numeric_bit.all;
  use ieee.math_real.uniform;

  signal a, b, result : data_word;
  signal func : ALU_func;
  signal carry : bit;

begin

  dut : entity work.ALU(structural)
    port map ( a, b, func, result, carry );

  stimulus : process is
    variable seed1, seed2 : positive := 1;
    variable a_real, b_real, func_real : real;
  begin
    wait for 100 ns;
    uniform ( seed1, seed2, a_real );
    uniform ( seed1, seed2, b_real );
    uniform ( seed1, seed2, func_real );
    a <= to_unsigned( natural(a_real * real(2**integer'(data_word'length)) - 0.5),
                      data_word'length );
    b <= to_unsigned( natural(b_real * real(2**integer'(data_word'length)) - 0.5),
                      data_word'length );
    func <= to_unsigned( natural(func_real
                                 * real(2**integer'(ALU_func'length)) - 0.5),
                         ALU_func'length );
  end process stimulus;

  -- . . .  --verification process to check result and carry

end architecture random_test;

-- end code from book

