entity S_R_flipflop is
  port ( s, r : in bit;  q, q_n : out bit );
end entity S_R_flipflop;

--------------------------------------------------

architecture functional of S_R_flipflop is

begin

  q <= '1' when s = '1' else
       '0' when r = '1';

  q_n <= '0' when s = '1' else
         '1' when r = '1';

  check : assert not (s = '1' and r = '1')
            report "Incorrect use of S_R_flip_flop: s and r both '1'";

end architecture functional;
