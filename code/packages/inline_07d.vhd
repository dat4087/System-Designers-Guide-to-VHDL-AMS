library ieee;

entity inline_07d is

end entity inline_07d;


----------------------------------------------------------------


architecture test of inline_07d is
begin


  block_5_a : block is

    -- code from book

    type unsigned is array ( natural range <> ) of bit;
    type signed is array ( natural range <> ) of bit;

    signal head_position : signed ( 0 to 15 );

    subtype address is unsigned ( 31 downto 0 );
    signal next_PC : address;
    constant PC_increment : unsigned := X"4";

    -- end of code from book

  begin
  end block block_5_a;


  process_5_b : process is

    use ieee.std_logic_1164.all, ieee.numeric_std.all;

  begin

    -- code from book

    assert std_match('0', '0');
    assert std_match('1', '1');
    assert std_match('-', '1');
    assert std_match('-', '-');
    assert std_match('0', 'L');
    assert std_match('1', 'H');
    assert std_match('-', 'L');
    assert std_match('L', '0');
    assert std_match('H', '1');
    assert std_match('X', '-');
    assert std_match('L', 'L');
    assert std_match('H', 'H');
    assert std_match('U', '-');

    assert not std_match('0', '1');
    assert not std_match('1', '0');
    assert not std_match('U', '0');
    assert not std_match('0', 'H');
    assert not std_match('1', 'L');
    assert not std_match('X', '1');
    assert not std_match('H', '0');
    assert not std_match('L', '1');
    assert not std_match('L', 'W');
    assert not std_match('1', '0');
    assert not std_match('0', '1');
    assert not std_match('W', 'X');

    assert to_01( unsigned'("LLHH01") ) = "001101";
    assert to_01( unsigned'("00X11U") ) = "000110";

    assert to_01( signed'("100LLL"), 'X' ) = "100000";
    assert to_01( signed'("00W000"), 'X' ) = "XXXXXX";

    -- end of code from book

    wait;
  end process process_5_b;


end architecture test;
