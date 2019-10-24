entity inline_06d is

  -- code from book:

  pure function now return delay_length;

  -- end of code from book

  pure function now return delay_length is
  begin
    return std.standard.now;
  end function now;

end entity inline_06d;
