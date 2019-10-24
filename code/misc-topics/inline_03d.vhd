entity inline_03d is

end entity inline_03d;


----------------------------------------------------------------


architecture test of inline_03d is
begin

  process is
    variable counter : integer := 0;
  begin
    -- code from book
    counter := counter + 1;
    -- end code from book
    wait;
  end process;


  b1 : block

    -- code from book

    type shared_counter is protected
      procedure reset;
      procedure increment ( by : integer := 1 );
      impure function value return integer;
    end protected shared_counter;

    --

    type shared_counter is protected body
    
      variable count : integer := 0;
    
      procedure reset is
      begin
        count := 0;
      end procedure reset;
    
      procedure increment ( by : integer := 1 ) is
      begin
        count := count + by;
      end procedure increment;
    
      impure function value return integer is
      begin
        return count;
      end function value;
    
    end protected body shared_counter;

    --

    shared variable event_counter : shared_counter;

    -- end code from book

  begin

    process is
    begin
      wait for 10 ns;
      
      -- code from book

      event_counter.reset;
      event_counter.increment (2);
      assert event_counter.value > 0;
      
      -- end code from book

      wait;
    end process;

  end block b1;

  --

  b2 : block
   
    type shared_counter is protected
      procedure reset;
      procedure increment ( by : integer := 1 );
      impure function value return integer;

      -- code from book

      procedure copy ( variable from : in shared_counter );

      -- end code from book

    end protected shared_counter;

    type shared_counter is protected body
    
      variable count : integer := 0;
    
      procedure reset is
      begin
        count := 0;
      end procedure reset;
    
      procedure increment ( by : integer := 1 ) is
      begin
        count := count + by;
      end procedure increment;
    
      impure function value return integer is
      begin
        return count;
      end function value;
    
      -- code from book

      procedure copy ( variable from : in shared_counter ) is
      begin
        count := from.value;
      end procedure copy;
    
      -- end code from book

    end protected body shared_counter;

    -- code from book

    shared variable a, b : shared_counter;

    -- end code from book

  begin

    process is
    begin
      wait for 10 ns;

      -- code from book

      a.copy(b);

      -- end code from book

      wait;
    end process;

    process is
    begin
      wait for 10 ns;

      -- code from book

      b.copy(a);

      -- end code from book

      wait;
    end process;

  end block b2;

end architecture test;
