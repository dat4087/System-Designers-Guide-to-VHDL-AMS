package display_interface is

  -- . . .

  -- not in book
  type status_type is (t1, t2, t3);
  -- end not in book

  procedure create_window ( size_x, size_y : natural;
                            status : out status_type );

  attribute foreign of create_window : procedure is
    "language Ada;  with window_operations;" &
    "bind to window_operations.create_window;" &
    "parameter size_x maps to size_x : in natural;" &
    "parameter size_y maps to size_y : in natural;" &
    "parameter status maps to status : out window_operations.status_type;" &
    "others map to default";

  -- . . .

end package display_interface;
