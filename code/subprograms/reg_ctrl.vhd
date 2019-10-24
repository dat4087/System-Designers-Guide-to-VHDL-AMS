library ieee;  use ieee.std_logic_1164.all;

entity reg_ctrl is
  port ( reg_addr_decoded, rd, wr, io_en, cpu_clk : in std_ulogic;
         reg_rd, reg_wr : out std_ulogic );
end entity reg_ctrl;

--------------------------------------------------

architecture bool_eqn of reg_ctrl is
begin

  rd_ctrl : reg_rd <= reg_addr_decoded and rd and io_en;

  rw_ctrl : reg_wr <= reg_addr_decoded and wr and io_en
                      and not cpu_clk;

end architecture bool_eqn;
