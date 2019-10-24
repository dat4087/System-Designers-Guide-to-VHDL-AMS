entity multiplier is
  port ( clk, reset : in bit;
         multiplicand, multiplier : in integer;
         product : out integer );
end entity multiplier;

--------------------------------------------------

architecture mixed of multiplier is

  signal partial_product, full_product : integer;
  signal arith_control, result_en, mult_bit, mult_load : bit;

begin -- mixed

  arith_unit : entity work.shift_adder(behavior)
    port map ( addend => multiplicand, augend => full_product,
               sum => partial_product,
               add_control => arith_control);

  result : entity work.reg(behavior)
    port map ( d => partial_product, q => full_product,
               en => result_en, reset => reset);

  multiplier_sr : entity work.shift_reg(behavior)
    port map ( d => multiplier, q => mult_bit,
               load => mult_load, clk => clk);

  product <= full_product;

  control_section : process is
    -- variable declarations for control_section
    -- . . .
  begin -- control section
    -- sequential statements to assign values to control signals
    -- . . .
    wait on clk, reset;
  end process control_section;

end architecture mixed;
