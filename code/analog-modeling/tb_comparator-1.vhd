library IEEE;
use IEEE.std_logic_1164.all;
library IEEE_proposed;
use IEEE_proposed.electrical_systems.all;

entity tb_comparator is
end tb_comparator;

architecture TB_comparator of tb_comparator is
    -- Component declarations
    -- Signal declarations
    terminal in_src : electrical;
    signal cmp_out : std_logic;
begin
    -- Signal assignments
    -- Component instances
    vio : entity work.v_sine(ideal)
        generic map(
            freq => 100.0,
            amplitude => 5.0
        )
        port map(
            pos => in_src,
            neg => ELECTRICAL_REF
        );
    C1 : entity work.comparator(hysteresis)
        port map(
            plus_in => in_src,
            minus_in => electrical_ref,
		output => cmp_out
        );
end TB_comparator;
