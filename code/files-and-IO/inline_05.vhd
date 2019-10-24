entity inline_05 is

end entity inline_05;


----------------------------------------------------------------


architecture test of inline_05 is

  type log_file is file of string;

  -- code from book:

  file log_info : log_file open write_mode is "logfile";

  -- end of code from book

begin


  process is
  begin
    write(log_info, string'("AAAA"));
    wait for 1 ns;
    write(log_info, string'("BBBB"));
    wait;
  end process;


  process is
  begin
    write(log_info, string'("CCCC"));
    wait for 1 ns;
    write(log_info, string'("DDDD"));
    wait;
  end process;


end architecture test;	  
