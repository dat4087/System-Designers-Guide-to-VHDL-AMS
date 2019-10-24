library device_lib;

configuration last_pass_spice of carry_chain is

  for device_level

    for bit_array ( 0 to n - 1 )

      for bit_0
        for all : nmos
          use entity device_lib.nmos(ideal);
        end for;
        for all : pmos
          use entity device_lib.pmos(ideal);
        end for;
      end for;

      for middle_bit
        for all : nmos
          use entity device_lib.nmos(ideal);
        end for;
        for all : pmos
          use entity device_lib.pmos(ideal);
        end for;
      end for;

    end for;

    for bit_array ( n )

      for bit_n
        for p_pass : nmos
          use entity device_lib.nmos(spice_equivalent);
        end for;
        for others : nmos
          use entity device_lib.nmos(ideal);
        end for;
        for all : pmos
          use entity device_lib.pmos(ideal);
        end for;
      end for;

    end for;

  end for;

end configuration last_pass_spice;
