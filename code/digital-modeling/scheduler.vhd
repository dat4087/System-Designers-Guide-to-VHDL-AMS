entity scheduler is
end entity scheduler;


architecture test of scheduler is

  constant scheduling_delay : delay_length := 5 ns;

  subtype request_type is natural range 0 to 20;
  type server_status_type is (ready, busy);

  signal first_priority_request,
         first_normal_request,
         reset_request : request_type := 0;
  signal functional_request, equivalent_request : request_type;
  signal priority_waiting : boolean := false;
  signal server_status : server_status_type := busy;

begin

  functional_scheduler : block is
    port ( request : out request_type );
    port map ( request => functional_request );
  begin

    -- code from book

    scheduler :
      request <= first_priority_request after scheduling_delay
                   when priority_waiting and server_status = ready else
                 first_normal_request after scheduling_delay
                   when not priority_waiting and server_status = ready else
                 unaffected
                   when server_status = busy else
                 reset_request after scheduling_delay;

    -- end code from book

  end block functional_scheduler;

  --------------------------------------------------

  equivalent_scheduler : block is
    port ( request : out request_type );
    port map ( request => equivalent_request );
  begin

    -- code from book

    scheduler : process is
    begin
      if priority_waiting and server_status = ready then
        request <= first_priority_request after scheduling_delay;
      elsif not priority_waiting and server_status = ready then
        request <= first_normal_request after scheduling_delay;
      elsif server_status = busy then
        null;
      else
        request <= reset_request after scheduling_delay;
      end if;
      wait on first_priority_request, priority_waiting, server_status,
              first_normal_request, reset_request;
    end process scheduler;

    -- end code from book

  end block equivalent_scheduler;

  --------------------------------------------------

  stimulus : process is
  begin
    first_priority_request <= 10;	wait for 20 ns;
    first_normal_request <= 5;		wait for 20 ns;
    server_status <= ready;		wait for 20 ns;
    server_status <= busy;		wait for 20 ns;
    priority_waiting <= true;		wait for 20 ns;
    server_status <= ready;		wait for 20 ns;
    first_normal_request <= 7;		wait for 20 ns;
    first_priority_request <= 12;	wait for 20 ns;

    wait;
  end process stimulus;

  verifier :
  assert functional_request = equivalent_request
    report "Functional and equivalent models give different results";

end architecture test;
