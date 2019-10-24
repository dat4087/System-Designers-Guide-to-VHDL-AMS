library IEEE_proposed;
use IEEE_proposed.electrical_systems.all;

entity tb_inv_integrator is
end tb_inv_integrator;

architecture TB_inv_integrator of tb_inv_integrator is
    -- Component declarations
    -- Signal declarations
    terminal vin : electrical;
    terminal vout : electrical;
begin
    -- Signal assignments
    -- Component instances
    v1 : entity work.v_sine(ideal)
        generic map(
            amplitude => 0.2,
            freq => 1.0e3
        )
        port map(
            pos => vin,
            neg => ELECTRICAL_REF
        );
    inverting_integ1 : entity work.inverting_integrator(structural)
        port map(
            output => vout,
            input => vin
        );
    RLoad : entity work.load_res(ideal)
        generic map(
            R => 100.0
        )
        port map(
            node1 => vout,
            node2 => ELECTRICAL_REF
        );
end TB_inv_integrator;
