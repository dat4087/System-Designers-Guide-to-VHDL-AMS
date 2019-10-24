package inline_10 is

  -- code from book

  attribute foreign : string;

  -- end code from book

end package inline_10;



entity and2 is
end entity and2;


-- code from book

architecture accelerated of and2 is
  attribute foreign of accelerated : architecture is
    "accelerate/function:and_2in/nocheck";
begin
end architecture accelerated;

-- end code from book
