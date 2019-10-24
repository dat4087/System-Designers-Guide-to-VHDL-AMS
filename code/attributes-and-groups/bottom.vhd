entity bottom is
  port ( -- . . . );
    --
      port_name : in bit := '0' );
    --
end entity bottom;

--------------------------------------------------

architecture bottom_arch of bottom is

  signal bot_sig : -- . . .;          -- 5
    --
    bit;
    --

  procedure proc ( -- . . . ) is
    --
    param_name : in bit := '0' ) is
    --
    variable v : -- . . .;            -- 6
    --
    bit;
    --
  begin
    -- . . .
    --
    report "--6: " & v'path_name;
    report "--6: " & v'instance_name;
    --
  end procedure proc;

begin

  delays : block is
    constant d : integer := 1;      -- 7
  begin
    -- . . .
    --
    assert false report "--7: " & d'path_name;
    assert false report "--7: " & d'instance_name;
    --
  end block delays;

  func : block is
  begin

    process is
      variable v : -- . . .;          -- 8
      --
      bit;
      --
    begin
      -- . . .
      --
      report "--5: " & bot_sig'path_name;
      report "--5: " & bot_sig'instance_name;
      report "--8: " & v'path_name;
      report "--8: " & v'instance_name;
      proc(param_name => open);
      wait;
      --
      --
    end process;

  end block func;

end architecture bottom_arch;
