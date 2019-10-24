library ieee;  use ieee.std_logic_1164.all;

entity buf is
  port ( a : in std_logic;  y : out std_logic );
end buf;


architecture basic of buf is
begin
  y <= a;
end basic;




library ieee;  use ieee.std_logic_1164.all;

entity fanout_tree is
  generic ( height : natural );
  port ( input : in std_logic;
         output : out std_logic_vector (0 to 2**height - 1) );
end fanout_tree;

--------------------------------------------------

architecture recursive of fanout_tree is

  component buf
    port ( a : in std_logic;  y : out std_logic );
  end component;

  component fanout_tree
    generic ( height : natural );
    port ( input : in std_logic;
           output : out std_logic_vector (0 to 2**height - 1) );
  end component;

  signal buffered_input_0, buffered_input_1 : std_logic;

begin

  degenerate_tree : if height = 0 generate
    output(0) <= input;
  end generate degenerate_tree;

  compound_tree : if height > 0 generate

    buf_0 : buf
      port map ( a => input, y => buffered_input_0 );

    -- code from book

    block_0 : block
      for subtree_0 : fanout_tree
        use entity work.fanout_tree(recursive);
    begin
      subtree_0 : fanout_tree
        generic map ( height => height - 1 )
        port map (  input => buffered_input_0,
        output => output(0 to 2**(height - 1) - 1) );
    end block block_0;

    -- end code from book

    buf_1 : buf
      port map ( a => input, y => buffered_input_1 );

    block_1 : block
      for subtree_1 : fanout_tree
        use entity work.fanout_tree(recursive);
    begin
      subtree_1 : fanout_tree
        generic map ( height => height - 1 )
        port map ( input => buffered_input_1,
                   output => output(2**(height - 1) to 2**height - 1) );
    end block block_1;

  end generate compound_tree;

end recursive;




library ieee;  use ieee.std_logic_1164.all;

entity inline_03d is
end inline_03d;


architecture test of inline_03d is

  component fanout_tree
    generic ( height : natural );
    port ( input : in std_logic;
           output : out std_logic_vector (0 to 2**height - 1) );
  end component;

  for clock_buffer_tree : fanout_tree
    use entity work.fanout_tree(recursive);

  signal unbuffered_clock : std_logic;
  signal buffered_clock_array : std_logic_vector(0 to 7);

begin

  clock_buffer_tree : fanout_tree
    generic map ( height => 3 )
    port map ( input => unbuffered_clock,
               output => buffered_clock_array );

  clock_gen : process
  begin
    unbuffered_clock <= '1' after 5 ns, '0' after 10 ns;
    wait for 10 ns;
  end process clock_gen;

end test;
