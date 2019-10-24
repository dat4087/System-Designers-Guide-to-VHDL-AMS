library IEEE;
use IEEE.std_logic_1164.all;
library IEEE_proposed;
use IEEE_proposed.electrical_systems.all;
entity tb_variable_comparator is
end tb_variable_comparator;

architecture TB_variable_comparator of tb_variable_comparator is
    -- Component declarations
    -- Signal declarations
    terminal in_src, v_ref : electrical;
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
    C1 : entity work.variable_comparator(ideal)
        port map(
            a => in_src,
			ref => electrical_ref,
            d => cmp_out
        );
end TB_variable_comparator;
