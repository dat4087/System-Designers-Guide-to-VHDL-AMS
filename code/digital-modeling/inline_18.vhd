-- code from book:

entity DRAM_controller is
  port ( rd, wr, mem : in bit;
         ras, cas, we, ready : out bit  );
end entity DRAM_controller;

-- end of code from book


----------------------------------------------------------------


architecture fpld of DRAM_controller is
begin
end architecture fpld;


----------------------------------------------------------------


entity inline_18 is

end entity inline_18;


----------------------------------------------------------------


architecture test of inline_18 is



begin


  block_4_a : block is
    signal cpu_rd, cpu_wr, cpu_mem,
           mem_ras, mem_cas, mem_we, cpu_rdy : bit;
  begin

    -- code from book:

    main_mem_controller : entity work.DRAM_controller(fpld)
      port map ( cpu_rd, cpu_wr, cpu_mem,
                 mem_ras, mem_cas, mem_we, cpu_rdy );

    -- end of code from book

  end block block_4_a;


  ----------------


  block_4_b : block is
    signal cpu_rd, cpu_wr, cpu_mem,
           mem_ras, mem_cas, mem_we, cpu_rdy : bit;
  begin

    -- code from book:

    main_mem_controller : entity work.DRAM_controller(fpld)
      port map ( rd => cpu_rd, wr => cpu_wr,
                 mem => cpu_mem, ready => cpu_rdy,
                 ras => mem_ras, cas => mem_cas, we => mem_we );

    -- end of code from book

  end block block_4_b;


end architecture test;
