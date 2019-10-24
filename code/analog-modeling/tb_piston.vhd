library IEEE_proposed;
use IEEE_proposed.mechanical_systems.all;

entity tb_piston is
end tb_piston;

architecture TB_piston of tb_piston is
    -- Component declarations
    -- Signal declarations
    terminal n1, n2 : translational;
begin
    -- Signal assignments
    -- Component instances
    Force1 : entity work.ForcePulse_t(ideal)
        generic map(
            initial => 0.0,
            pulse => 20.0e-3,
            ti2p => 1 ms,
            tp2i => 1 ms,
            delay => 1 ms,
            width => 1 sec,
            period => 3 sec
        )
        port map(
            trans_pos => n1,
            trans_neg => TRANSLATIONAL_REF
        );
    mass1 : entity work.piston(simple)
        port map(
            motion => n1
        );
    Force2 : entity work.ForcePulse_t(ideal)
        generic map(
            initial => 0.0,
            pulse => 20.0e-3,
            ti2p => 1 ms,
            tp2i => 1 ms,
            delay => 1 ms,
            width => 1 sec,
            period => 3 sec
        )
        port map(
            trans_pos => n2,
            trans_neg => TRANSLATIONAL_REF
        );
    mass2 : entity work.mass_t(ideal)
        generic map(
            m => 10.0
        )
        port map(
            trans1 => n2
        );
end TB_piston;
