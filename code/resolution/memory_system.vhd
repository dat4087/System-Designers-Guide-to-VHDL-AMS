use work.MVL4.all;

entity ROM is
  port ( a : in MVL4_ulogic_vector(15 downto 0);
         d : inout MVL4_logic_vector(7 downto 0);
         rd : in MVL4_ulogic );
end entity ROM;

-- not in book
architecture behavioral of ROM is
begin
end architecture behavioral;
-- end not in book

--------------------------------------------------

use work.MVL4.all;

entity SIMM is
  port ( a : in MVL4_ulogic_vector(9 downto 0);
         d : inout MVL4_logic_vector(31 downto 0);
         ras, cas, we, cs : in MVL4_ulogic );
end entity SIMM;

-- not in book
architecture behavioral of SIMM is
begin
end architecture behavioral;
-- end not in book

--------------------------------------------------

-- not in book

use work.MVL4.all;

entity memory_subsystem is
end entity memory_subsystem;

-- end not in book

architecture detailed of memory_subsystem is

  signal internal_data : MVL4_logic_vector(31 downto 0);
  -- . . .

  -- not in book
  signal internal_addr : MVL4_ulogic_vector(31 downto 0);
  signal main_mem_addr : MVL4_ulogic_vector(9 downto 0);
  signal ROM_select : MVL4_ulogic;
  -- end not in book

begin

  boot_ROM : entity work.ROM(behavioral)
    port map ( a => internal_addr(15 downto 0),
               d => internal_data(7 downto 0),
               rd => ROM_select );

  main_mem : entity work.SIMM(behavioral)
    port map ( a => main_mem_addr, d => internal_data, -- . . . );
    -- not in book
               ras => '0', cas => '0', we => '0', cs => '0' );
    -- end not in book

  -- . . .

end architecture detailed;
