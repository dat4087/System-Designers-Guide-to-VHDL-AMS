library cell_lib;

configuration identical_cells of register_tristate is

  for cell_level

    for cell_array

      for cell_storage : D_flipflop
        use entity cell_lib.D_flipflop(synthesized);
      end for;

      for cell_buffer : tristate_buffer
        use entity cell_lib.tristate_buffer(synthesized);
      end for;

    end for;

  end for;

end configuration identical_cells;
