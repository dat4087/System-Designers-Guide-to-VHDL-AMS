entity inline_05a is

end entity inline_05a;


architecture test of inline_05a is

  -- code from book

  type domain_type is (quiescent_domain, time_domain, frequency_domain);
  
  signal domain : domain_type := quiescent_domain;

  -- end code from book

begin

end architecture test;
