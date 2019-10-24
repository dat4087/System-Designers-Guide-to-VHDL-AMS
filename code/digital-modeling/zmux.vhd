entity zmux is
end entity zmux;


library util;  use util.stimulus_generators.all;

architecture test of zmux is

  signal sel0, sel1, d0, d1, d2, d3 : bit := '0';
  signal functional_z, equivalent_z : bit;

begin

  functional_mux : block is
    port ( z : out bit );
    port map ( z => functional_z );
  begin

    -- code from book

    zmux : z <= d0 when sel1 = '0' and sel0 = '0' else
                d1 when sel1 = '0' and sel0 = '1' else
                d2 when sel1 = '1' and sel0 = '0' else
                d3 when sel1 = '1' and sel0 = '1';

    -- end code from book

  end block functional_mux;

  --------------------------------------------------

  equivalent_mux : block is
    port ( z : out bit );
    port map ( z => equivalent_z );
  begin

    -- code from book

    zmux : process is
    begin
      if sel1 = '0' and sel0 = '0' then
        z <= d0;
      elsif sel1 = '0' and sel0 = '1' then
        z <= d1;
      elsif sel1 = '1' and sel0 = '0' then
        z <= d2;
      elsif sel1 = '1' and sel0 = '1' then
        z <= d3;
      end if;
      wait on d0, d1, d2, d3, sel0, sel1;
    end process zmux;

    -- end code from book

  end block equivalent_mux;

  --------------------------------------------------

  stimulus :
    all_possible_values( bv(0) => sel0, bv(1) => sel1,
			 bv(2) => d0, bv(3) => d1,
			 bv(4) => d2, bv(5) => d3,
			 delay_between_values => 10 ns );

  verifier :
  assert functional_z = equivalent_z
    report "Functional and equivalent models give different results";

end architecture test;
