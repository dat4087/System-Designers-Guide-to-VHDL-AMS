library IEEE_proposed;
use IEEE_proposed.electrical_systems.all;

entity tb_v_source is

end tb_v_source ;

architecture TB_v_source of tb_v_source is
    terminal in_src, out_flt : electrical;
    -- Component declarations
    -- Signal declarations
begin
    -- Signal assignments
    -- Component instances
    vio : entity work.v_source(source_sine)
        port map(
            p => in_src,
            m => ELECTRICAL_REF
        );

    R1 : entity work.resistor(ideal)
        generic map(
            res => 10.0e3
        )
        port map(
            p1 => in_src,
            p2 => electrical_ref
        );
end TB_v_source ;


