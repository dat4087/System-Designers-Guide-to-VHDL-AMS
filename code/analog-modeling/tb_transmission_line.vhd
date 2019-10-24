library IEEE_proposed;
use IEEE_proposed.electrical_systems.all;

entity tb_transmission_line is

end tb_transmission_line;

architecture TB_transmission_line of tb_transmission_line is
    quantity in_src, line_out : voltage;
    -- Component declarations
    -- Signal declarations
begin
    -- Signal assignments
    -- Component instances
    q1 : entity work.src_pulse(ideal)
        generic map(
            initial => 0.0,
            pulse => 1.0e1,
			ti2p => 1.0e-12,
			tp2i => 1.0e-12,
			delay => 1 ps,
			width => 20 ns,
			period => 50 ns
        )
        port map(
            output => in_src
        );
    
    T1 : entity work.transmission_line_wa(abstract)
        port map(
            vin => in_src,
            vout => line_out
        );
 
end TB_transmission_line;


