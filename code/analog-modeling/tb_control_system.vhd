library IEEE_proposed;

entity tb_control_system is
end tb_control_system;

architecture TB_control_system of tb_control_system is
    -- Component declarations
    -- Signal declarations
    quantity in_src, fb : real;
    quantity output : real;
begin
    -- Signal assignments
    -- Component instances
    src3 : entity work.src_sine(ideal)
        generic map(
            freq => 100.0,
            amplitude => 1.0
        )
        port map(
            output => in_src
        );
    XCMP12 : entity work.control_system(simple_feedback)
        port map(
            target => in_src,
            output => output,
		feedback => fb
        );
	 gain1 : entity work.gain(simple)
        generic map(
            k => 1.0
        )
	  port map (
		input => output,
		output => fb
		);
end TB_control_system;
