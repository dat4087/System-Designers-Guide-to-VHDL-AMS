use work.resolve.all;

-- code from book (in text)

entity tri_state_reg is
  port ( d : in resolved_byte;
         q : out resolved_byte bus;
         clock, out_enable : in bit );
end entity tri_state_reg;

-- end code from book



-- code from book

architecture behavioral of tri_state_reg is
begin

  reg_behavior : process (d, clock, out_enable) is
    variable stored_byte : byte;
  begin
    if clock'event and clock = '1' then
      stored_byte := d;
    end if;
    if out_enable = '1' then
      q <= stored_byte;
    else
      q <= null;
    end if;
  end process reg_behavior;

end architecture behavioral;

-- end code from book
