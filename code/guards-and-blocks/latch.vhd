entity latch is
  generic ( width : positive );
  port ( enable : in bit;
         d : in bit_vector(0 to width - 1);
         q : out bit_vector(0 to width - 1) );
end entity latch;

--------------------------------------------------

architecture behavioral of latch is
begin

  transfer_control : block ( enable = '1' ) is
  begin
    q <= guarded d;
  end block transfer_control;

end architecture behavioral;
