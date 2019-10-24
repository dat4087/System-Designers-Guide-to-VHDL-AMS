entity S_R_flipflop is
  port ( s, r : in bit;  q, q_n : out bit );

begin

  check : assert not (s = '1' and r = '1')
            report "Incorrect use of S_R_flip_flop: s and r both '1'";

end entity S_R_flipflop;
