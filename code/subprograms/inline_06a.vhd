entity inline_06a is

  -- code from book:

  impure function now return delay_length;

  -- end of code from book

  impure function now return delay_length is
  begin
    return std.standard.now;
  end function now;

  -- code from book:

  impure function now return real;

  -- end of code from book

  impure function now return real is
  begin
    return std.standard.now;
  end function now;

end entity inline_06a;
