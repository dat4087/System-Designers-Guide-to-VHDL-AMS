library IEEE_proposed;
use IEEE_proposed.electrical_systems.all;

entity tb_freq_detect is

end tb_freq_detect;

architecture TB_freq_detect of tb_freq_detect is
    terminal in_src, freq_out : electrical;
    -- Component declarations
    -- Signal declarations
begin
    -- Signal assignments
    -- Component instances
    vio : entity work.v_sine(ideal)
        generic map(
            freq => 200.0,
            amplitude => 5.0
        )
    	port map(
            pos => in_src,
            neg => ELECTRICAL_REF
        );

    freq1 : entity work.freq_detect(threshold_crossing)
        port map(
            input => in_src,
            freq_out => freq_out
        );
end TB_freq_detect;


