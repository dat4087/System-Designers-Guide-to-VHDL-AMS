entity inline_04a is

end entity inline_04a;


architecture test of inline_04a is
  
  -- code from book
  
  function vector_multiply ( p : real_vector;  r : real ) return real_vector is 
    variable result : real_vector(p'range);
  begin
    for index in p'range loop
      result(index) := p(index) * r;
    end loop;
    return result;
  end function vector_multiply;
        
  --
  
  quantity scale_factor : real;
  quantity source_position, scaled_position : real_vector(1 to 3);

  -- end code from book
  
begin

  -- code from book
  
  scaled_position == vector_multiply ( source_position, scale_factor );

  -- end code from book
  
end architecture test;
