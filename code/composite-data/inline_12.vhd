entity inline_12 is

end entity inline_12;


----------------------------------------------------------------


architecture test of inline_12 is
begin


  process_3_a : process is

    -- code from book:

    subtype pixel_row is bit_vector (0 to 15);
    variable current_row, mask : pixel_row;

    -- end of code from book

  begin

    current_row := "0000000011111111";
    mask := "0000111111110000";

    -- code from book:

    current_row := current_row and not mask;
    current_row := current_row xor X"FFFF";

    -- end of code from book

    -- code from book (conditions only):

    assert B"10001010" sll 3  =  B"01010000";
    assert B"10001010" sll -2  =  B"00100010";

    assert B"10010111" srl 2  = B"00100101";
    assert B"10010111" srl -6  =  B"11000000";

    assert B"01001011" sra 3  =  B"00001001";
    assert B"10010111" sra 3  =  B"11110010";
    assert B"00001100" sla 2  =  B"00110000";
    assert B"00010001" sla 2  =  B"01000111";

    assert B"00010001" sra -2  =  B"01000111";
    assert B"00110000" sla -2  =  B"00001100";

    assert B"10010011" rol 1  =  B"00100111";
    assert B"10010011" ror 1  =  B"11001001";

    assert "abc" & 'd'  =  "abcd";
    assert 'w' & "xyz"  =  "wxyz";
    assert 'a' & 'b'  =  "ab";

    -- end of code from book

    wait;
  end process process_3_a;


end architecture test;
