-- to be analyzed into resource library cell_lib


library ieee;  use ieee.std_logic_1164.all;

entity D_flipflop is
  port ( clk : in std_logic;  d : in std_logic;
         q : out std_logic );
end entity D_flipflop;


architecture synthesized of D_flipflop is
begin
  q <= d when not clk'stable and (To_X01(clk) = '1') and 
                                 (To_X01(clk'last_value) = '0');
end architecture synthesized;


library ieee;  use ieee.std_logic_1164.all;

entity tristate_buffer is
  port ( a : in std_logic;
         en : in std_logic;
         y : out std_logic );
end entity tristate_buffer;


architecture synthesized of tristate_buffer is
begin
  y <= 'X' when is_X(en) else
        a  when To_X01(en) = '1' else
       'Z';
end architecture synthesized;



-- code from book

library ieee;  use ieee.std_logic_1164.all;

entity register_tristate is
  generic ( width : positive );
  port ( clock : in std_logic;
         out_enable : in std_logic;
         data_in : in std_logic_vector(0 to width - 1);
         data_out : out std_logic_vector(0 to width - 1) );
end entity register_tristate;

--------------------------------------------------

architecture cell_level of register_tristate is

  component D_flipflop is
    port ( clk : in std_logic;  d : in std_logic;
           q : out std_logic );
  end component D_flipflop;

  component tristate_buffer is
    port ( a : in std_logic;
           en : in std_logic;
           y : out std_logic );
  end component tristate_buffer;

begin

  cell_array : for bit_index in 0 to width - 1 generate

    signal data_unbuffered : std_logic;

  begin

    cell_storage : component D_flipflop
      port map ( clk => clock, d => data_in(bit_index),
                 q => data_unbuffered );

    cell_buffer : component tristate_buffer
      port map ( a => data_unbuffered, en => out_enable,
                 y => data_out(bit_index) );

  end generate cell_array;

end architecture cell_level;

-- end code from book
