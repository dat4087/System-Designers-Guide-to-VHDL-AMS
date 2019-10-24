entity counter is

  generic ( tipd_reset,                   -- input prop delay on reset
            tipd_clk,                     -- input prop delay on clk
            topd_q : delay_length;        -- output prop delay on q
            tsetup_reset,                 -- setup: reset before clk
            thold_reset : delay_length ); -- hold time: reset after clk

  port ( reset,                           -- synchronous reset input
         clk : in bit;                    -- edge-triggered clock input
         q : out bit_vector );            -- counter output

end entity counter;


architecture detailed_timing of counter is

  signal reset_ipd,                   -- data input port delayed
         clk_ipd : bit;               -- clock input port delayed
  signal q_zd : bit_vector(q'range);  -- q output with zero delay

begin

  input_port_delay : block is
  begin
    reset_ipd <= reset after tipd_reset;
    clk_ipd <= clk after tipd_clk;
  end block input_port_delay;

  functionality : block is

    function increment ( bv : bit_vector ) return bit_vector is
      variable result : bit_vector(bv'range) := bv;
      variable carry : bit := '1';
    begin
      for index in result'reverse_range loop
        result(index) := bv(index) xor carry;
        carry :=  bv(index) and carry;
        exit when carry = '0';
      end loop;
      return result;
    end function increment;

    signal next_count : bit_vector(q'range);

  begin
    next_count <= increment(q_zd) when reset_ipd = '0' else
                  (others => '0');
    q_zd <= next_count when clk_ipd = '1' and clk_ipd'event;
  end block functionality;

  output_port_delay : block is
  begin
    q <= q_zd after topd_q;
  end block output_port_delay;

  timing_checks : block is
  begin
    -- check setup time: reset before clk
    -- . . .
    -- check hold time: reset after clk
    -- . . .
  end block timing_checks;

end architecture detailed_timing;
