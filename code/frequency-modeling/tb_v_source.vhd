library IEEE_proposed;
use IEEE_proposed.electrical_systems.all;

entity tb_v_source is

end tb_v_source ;

architecture TB_v_source of tb_v_source is
    terminal sin_out1, sin_out2 : electrical;
    -- Component declarations
    -- Signal declarations
begin
    -- Signal assignments
    -- Component instances
    v1 : entity work.v_source(behavior)
        port map(
            pos => sin_out1,
            neg => ELECTRICAL_REF
        );

    R1 : entity work.resistor(ideal)
        generic map(
            res => 10.0e3
        )
        port map(
            p1 => sin_out1,
            p2 => electrical_ref
        );
    v2 : entity work.v_constant(ideal)
        generic map(
            level => 1.0
        )
   		port map(
            pos => sin_out2,
            neg => ELECTRICAL_REF
        );

    R2 : entity work.resistor(ideal)
        generic map(
            res => 10.0e3
        )
        port map(
            p1 => sin_out2,
           p2 => electrical_ref
        );
end TB_v_source ;


