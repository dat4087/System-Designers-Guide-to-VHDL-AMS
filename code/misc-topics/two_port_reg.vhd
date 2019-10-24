entity two_port_reg is
  generic ( width : natural );
  port ( read_clk : in bit;
      read_data : out bit_vector(0 to width-1);
      write_clk : in bit;
      write_data : in bit_vector(0 to width-1) );
end entity two_port_reg;

----------------------------------------------------------------

architecture behavioral of two_port_reg is

  subtype word is bit_vector(0 to width-1);

  type protected_reg is protected
    impure function get return word;
    procedure set ( new_value : word );
  end protected protected_reg;

  type protected_reg is protected body

    variable reg : word;

    impure function get return word is
    begin
      return reg;
    end function get;

    procedure set ( new_value : word ) is
    begin
      reg := new_value;
    end procedure set;

  end protected body protected_reg;

  shared variable reg_store : protected_reg;

begin
  reader : process ( read_clk ) is
  begin
    if read_clk = '1' then          -- on rising edge
      read_data <= reg_store.get;  -- read current value
    end if;
  end process reader;
  writer : process ( write_clk ) is
  begin
    if write_clk = '1' then          -- on rising edge
      reg_store.set ( write_data );  -- set to new value
    end if;
  end process writer;
end architecture behavioral;
