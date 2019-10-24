entity circuit is
  generic ( inpad_delay, outpad_delay : delay_length );
  port ( in1, in2, in3 : in bit;  out1, out2 : out bit );
end entity circuit;

--------------------------------------------------

architecture with_pad_delays of circuit is

  component subcircuit is
    port ( a, b : in bit;  y1, y2 : out bit );
  end component subcircuit;

  signal delayed_in1, delayed_in2, delayed_in3 : bit;
  signal undelayed_out1, undelayed_out2 : bit;

begin

  input_delays : block is
  begin
    delayed_in1 <= in1 after inpad_delay;
    delayed_in2 <= in2 after inpad_delay;
    delayed_in3 <= in3 after inpad_delay;
  end block input_delays;

  functionality : block is
    signal intermediate : bit;
  begin
    cell1 : component subcircuit
      port map ( delayed_in1, delayed_in2, undelayed_out1, intermediate );
    cell2 : component subcircuit
      port map ( intermediate, delayed_in3, undelayed_out2, open );
  end block functionality;

  output_delays : block is
  begin
    out1 <= undelayed_out1 after outpad_delay;
    out2 <= undelayed_out2 after outpad_delay;
  end block output_delays;

end architecture with_pad_delays;
