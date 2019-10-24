library IEEE_proposed;
use IEEE_proposed.electrical_systems.all;
entity tb_triangle_waveform is
end tb_triangle_waveform;

architecture TB_triangle_waveform of tb_triangle_waveform is
    -- Component declarations
    -- Signal declarations
    terminal in_src : electrical;
begin
    -- Signal assignments
    -- Component instances
    vio : entity work.triangle_waveform_wa(ideal)
        port map(
            pos => in_src,
            neg => ELECTRICAL_REF
        );
    R1 : entity work.resistor(ideal)
        generic map(
            res => 10.0e9
        )
        port map(
            p1 => in_src,
            p2 => ELECTRICAL_REF
        );
end TB_triangle_waveform;
