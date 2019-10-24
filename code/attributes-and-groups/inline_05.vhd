entity inline_05 is

end entity inline_05;


----------------------------------------------------------------


architecture test of inline_05 is

  type stimulus_list is array (natural range <>) of integer;


  -- code from book:

  function "&" ( a, b : stimulus_list ) return stimulus_list;

  attribute debug : string;
  attribute debug of
    "&" [ stimulus_list, stimulus_list return stimulus_list ] : function is
    "source_statement_step";


  type mvl is ('X', '0', '1', 'Z');
  type mvl_vector is array ( integer range <>) of mvl;
  function resolve_mvl ( drivers : mvl_vector ) return mvl;

  subtype resolved_mvl is resolve_mvl mvl;


  type builtin_types is (builtin_bit, builtin_mvl, builtin_integer);
  attribute builtin : builtin_types;
  
  attribute builtin of resolved_mvl : subtype is builtin_mvl;

  -- end of code from book

  function "&" ( a, b : stimulus_list ) return stimulus_list is
  begin
    return stimulus_list'(1 to 0 => 0);
  end function "&";

  function resolve_mvl ( drivers : mvl_vector ) return mvl is
  begin
    return drivers(drivers'left);
  end function resolve_mvl;

begin
end architecture test;
