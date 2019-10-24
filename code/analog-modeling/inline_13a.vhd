library ieee_proposed;  use ieee_proposed.electrical_systems.all;
                        
entity inline_13a is

end entity inline_13a;


architecture test of inline_13a is

  -- code from book

  quantity v : voltage;
  -- ...

  -- end code from book

begin

  -- code from book

  if v'above(0.0) and not v'above(0.6) use
    -- ...
  elsif v'above(0.6) and not v'above(2.7) use
    -- ...
  else
    -- ...
  end use;

  --

  case v use -- illegal
    when 0.0 to 0.6 =>
      -- ...;
    when 0.6 to 2.7 =>
      --...;
    when others =>
      --...;
  end case;

  -- end code from book

end architecture test;
