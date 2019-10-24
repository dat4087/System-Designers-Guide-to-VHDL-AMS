entity reg is
  port ( d : in bit_vector(7 downto 0);
         q : out bit_vector(7 downto 0);
         clk : in bit );
end entity reg;

--------------------------------------------------

-- not in book

entity microprocessor is
end entity microprocessor;

-- end not in book

architecture RTL of microprocessor is

  signal interrupt_req : bit;
  signal interrupt_level : bit_vector(2 downto 0);
  signal carry_flag, negative_flag, overflow_flag, zero_flag : bit;
  signal program_status : bit_vector(7 downto 0);
  signal clk_PSR : bit;
  -- . . .

begin

  PSR : entity work.reg
    port map ( d(7) => interrupt_req,
               d(6 downto 4) => interrupt_level,
               d(3) => carry_flag,     d(2) => negative_flag,
               d(1) => overflow_flag,  d(0) => zero_flag,
               q => program_status,
               clk => clk_PSR );
  -- . . .

end architecture RTL;
