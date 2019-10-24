use work.words.all;

entity cpu is
  port ( address : out uword;  data : inout uword;  -- . . . );
  -- not in book
         other_port : in X01Z := 'Z' );
  -- end not in book
end entity cpu;


-- not in book

architecture behavioral of cpu is
begin
end architecture behavioral;

-- end not in book


--------------------------------------------------

use work.words.all;

entity memory is
  port ( address : in uword;  data : inout uword; -- . . . );
  -- not in book
         other_port : in X01Z := 'Z' );
  -- end not in book
end entity memory;


-- not in book

architecture behavioral of memory is
begin
end architecture behavioral;

-- end not in book


--------------------------------------------------


-- not in book

use work.words.all;

entity ROM is
  port ( a : in uword;  d : out ubyte;  other_port : in X01Z := 'Z' );
end entity ROM;


architecture behavioral of ROM is
begin
end architecture behavioral;


entity computer_system is
end entity computer_system;

-- end not in book



architecture top_level of computer_system is

  use work.words.all;

  signal address : uword;
  signal data : word;
  -- . . .

begin

  the_cpu : entity work.cpu(behavioral)
    port map ( address, data, -- . . . );
    -- not in book
               open );
    -- end not in book

  the_memory : entity work.memory(behavioral)
    port map ( address, data, -- . . . );
    -- not in book
               open );
    -- end not in book

  -- . . .

  -- code from book (in text)

--   boot_rom : entity work.ROM(behavioral)
--     port map ( a => address, d => data(24 to 31), -- . . . );  -- illegal
--     -- not in book
--                other_port => open );
--     -- end not in book

  -- end code from book

end architecture top_level;
