entity SR_flipflop is
  port ( s_n, r_n : in bit;  q, q_n : inout bit );

begin

  postponed process (q, q_n) is
  begin
    assert now = 0 fs or q = not q_n
      report "implementation error: q /= not q_n";
  end postponed process;

end entity SR_flipflop;

--------------------------------------------------

architecture dataflow of SR_flipflop is
begin

  gate_1 : q <= s_n nand q_n;
  gate_2 : q_n <= r_n nand q;

end architecture dataflow;
