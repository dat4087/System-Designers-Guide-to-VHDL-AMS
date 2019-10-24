use work.MVL4.all;

entity tri_state_buffer is
  port ( a, enable : in MVL4_ulogic;  y : out MVL4_ulogic );
end entity tri_state_buffer;

--------------------------------------------------

architecture behavioral of tri_state_buffer is
begin

  y <= 'Z' when enable = '0' else
       a   when enable = '1' and (a = '0' or a = '1') else
       'X';

end architecture behavioral;
