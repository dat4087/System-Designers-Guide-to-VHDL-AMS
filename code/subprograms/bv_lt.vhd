entity bv_lt is
end entity bv_lt;



architecture test of bv_lt is

  -- code from book

  procedure bv_lt ( bv1, bv2 : in bit_vector;  result : out boolean ) is
    variable tmp1 : bit_vector(bv1'range) := bv1;
    variable tmp2 : bit_vector(bv2'range) := bv2;
  begin
    tmp1(tmp1'left) := not tmp1(tmp1'left);
    tmp2(tmp2'left) := not tmp2(tmp2'left);
    result :=  tmp1 < tmp2;
  end procedure bv_lt;

  -- end code from book

begin

  stimulus : process is

    subtype byte is bit_vector(0 to 7);
    variable result : boolean;

  begin
    bv_lt( byte'(X"02"), byte'(X"04"), result );
    assert result;

    bv_lt( byte'(X"02"), byte'(X"02"), result );
    assert not result;

    bv_lt( byte'(X"02"), byte'(X"02"), result );
    assert not result;

    bv_lt( byte'(X"FC"), byte'(X"04"), result );
    assert result;

    bv_lt( byte'(X"04"), byte'(X"FC"), result );
    assert not result;

    bv_lt( byte'(X"FC"), byte'(X"FC"), result );
    assert not result;

    bv_lt( byte'(X"FC"), byte'(X"FE"), result );
    assert result;

    bv_lt( byte'(X"FE"), byte'(X"FC"), result );
    assert not result;

    wait;
  end process stimulus;

end architecture test;
