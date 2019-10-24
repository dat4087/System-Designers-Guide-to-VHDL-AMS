library IEEE;
use IEEE.std_logic_1164.all;

library IEEE_proposed;
use IEEE_proposed.electrical_systems.all;
use IEEE_proposed.mechanical_systems.all;

entity tb_CalcBuckParams is
end tb_CalcBuckParams;

architecture tb_CalcBuckParams of tb_CalcBuckParams is
    -- Component declarations
    -- Signal declarations
    quantity Cmin : capacitance;
    quantity freq_in : real;
    quantity Lmin : inductance;
begin
    -- Signal assignments
    -- Component instances
    src1 : entity work.src_pulse(ideal)
        generic map(
            initial => 25.0e3,
            pulse => 200.0e3,
            ti2p => 1ms,
            tp2i => 1ms,
            delay => 1ms,
            width => 100ms,
            period => 1000ms
        )
        port map(
            output => freq_in
        );
    CalcBuckParams1 : entity work.CalcBuckParams_wa(ideal)
        generic map(
            Vripple => 100.0e-3,
            Vin => 42.0,
            Vout => 4.8,
            Vd => 0.7,
            Imin => 15.0e-3,
            Resr => 50.0e-3
        )
        port map(
            Fsw => freq_in,
            Lmin => Lmin,
            Cmin => Cmin
        );
end tb_CalcBuckParams;
