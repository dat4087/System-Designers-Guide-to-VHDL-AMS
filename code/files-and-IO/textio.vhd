package textio is

  type line is access string;

  type text is file of string;

  type side is (right, left);

  subtype width is natural;

  file input : text open read_mode is "std_input";
  file output : text open write_mode is "std_output";

  -- use this declaration for VHDL-2001
  procedure readline(file f: text; l: inout line);

  -- use this declaration for VHDL-AMS
  procedure readline(file f: text; l: out line);

  procedure read ( L : inout line;  value: out bit;  good : out boolean );
  procedure read ( L : inout line;  value: out bit );

  procedure read ( L : inout line;  value: out bit_vector;  good : out boolean );
  procedure read ( L : inout line;  value: out bit_vector );

  procedure read ( L : inout line;  value: out boolean;  good : out boolean );
  procedure read ( L : inout line;  value: out boolean );

  procedure read ( L : inout line;  value: out character;  good : out boolean );
  procedure read ( L : inout line;  value: out character );

  procedure read ( L : inout line;  value: out integer;  good : out boolean );
  procedure read ( L : inout line;  value: out integer );

  procedure read ( L : inout line;  value: out real;  good : out boolean );
  procedure read ( L : inout line;  value: out real );

  procedure read ( L : inout line;  value: out string;  good : out boolean );
  procedure read ( L : inout line;  value: out string );

  procedure read ( L : inout line;  value: out time;  good : out boolean );
  procedure read ( L : inout line;  value: out time );

  procedure writeline ( file f : text;  L : inout line );

  procedure write ( L : inout line;  value : in bit;
                    justified: in side := right;  field: in width := 0 );

  procedure write ( L : inout line;  value : in bit_vector;
                    justified: in side := right;  field: in width := 0 );

  procedure write ( L : inout line;  value : in boolean;
                    justified: in side := right;  field: in width := 0 );

  procedure write ( L : inout line;  value : in character;
                    justified: in side := right;  field: in width := 0 );

  procedure write ( L : inout line;  value : in integer;
                    justified: in side := right;  field: in width := 0 );

  procedure write ( L : inout line;  value : in real;
                    justified: in side := right;  field: in width := 0;
                    digits: in natural := 0 );

  procedure write ( L : inout line;  value : in string;
                    justified: in side := right;  field: in width := 0 );

  procedure write ( L : inout line;  value : in time;
                    justified: in side := right;  field: in width := 0;
                    unit: in time := ns );

end package textio;
