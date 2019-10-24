-- not in book

entity DMA_controller is
end entity DMA_controller;

-- end not in book



architecture behavioral of DMA_controller is

  use work.DMA_controller_types_and_utilities.all;

begin

  behavior : process is

    variable address_reg0, address_reg1 : word;
    variable count_reg0, count_reg1 : word;
    -- . . .

  begin
    -- . . .
    address_reg0 := address_reg0 + X"0000_0004";
    -- . . .
  end process behavior;

end architecture behavioral;
