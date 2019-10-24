configuration architectural of computer_system is

  for block_level

    -- . . .    -- component configurations for cpu and memory, etc

    for instrumentation

      for cpu_bus_monitor : bus_monitor_pkg.bus_monitor
        use entity work.bus_monitor(general_purpose)
        generic map ( verbose => true, dump_stats => true );
      end for;

    end for;

  end for;

end configuration architectural;
