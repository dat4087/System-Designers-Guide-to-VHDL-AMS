library IEEE;
use IEEE.std_logic_1164.all;
library IEEE_proposed;
use IEEE_proposed.electrical_systems.all;

entity tb_lpf_dot_ltf_ztf is
end tb_lpf_dot_ltf_ztf;

architecture TB_lpf_dot_ltf_ztf of tb_lpf_dot_ltf_ztf is
    -- Component declarations
    -- Signal declarations
    terminal in_src : electrical;
    terminal out_dot, out_ltf, out_ztf1, out_ztf2, out_ztf3, out_ztf4, out_RC : electrical;
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
	RC1 : entity work.lowpass(RC)
        generic map(
            gain => 1.0,
            fp => 1.0e1,
		Fsmp => 10.0e3
        )
		port map(
            input => in_src,
		output => out_RC
        );
	dot1 : entity work.lowpass(dot)
        generic map(
            gain => 1.0,
            fp => 1.0e1,
		Fsmp => 10.0e3
        )
		port map(
            input => in_src,
		output => out_dot
        );
    ltf1 : entity work.lowpass(ltf)
        generic map(
            gain => 1.0,
            fp => 1.0e1,
		Fsmp => 10.0e3
        )
    	port map(
            input => in_src,
		output => out_ltf
        );
    ztf1 : entity work.lowpass(ztf)
        generic map(
            gain => 1.0,
            fp => 1.0e1,
		Fsmp => 10.0e3
        )
    	port map(
            input => in_src,
		output => out_ztf1
        );
    ztf2 : entity work.lowpass(ztf)
        generic map(
            gain => 1.0,
            fp => 1.0e1,
		Fsmp => 1000.0
        )
    	port map(
            input => in_src,
		output => out_ztf2
        );
    ztf3 : entity work.lowpass(ztf)
        generic map(
            gain => 1.0,
            fp => 1.0e1,
		Fsmp => 100.0
        )
    	port map(
            input => in_src,
		output => out_ztf3
        );
    ztf4 : entity work.lowpass(z_minus_1)
        generic map(
            gain => 1.0,
            fp => 1.0e1,
		Fsmp => 10.0e3
        )
    	port map(
            input => in_src,
		output => out_ztf4
        );
end TB_lpf_dot_ltf_ztf;
