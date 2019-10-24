package inline_09_defs is

  attribute attr : integer;

end package inline_09_defs;



use work.inline_09_defs.all;

entity e is
  port ( p : in bit );
  attribute attr of p : signal is 1;
end entity e;


architecture arch of e is
begin

  assert false report integer'image(p'attr);

end architecture arch;



use work.inline_09_defs.all;

entity inline_09 is
end entity inline_09;



architecture test of inline_09 is

  signal s : bit;

  attribute attr of s : signal is 2;

begin

  -- code from book

  c1 : entity work.e(arch)
    port map ( p => s );

  -- end code from book

end architecture test;
