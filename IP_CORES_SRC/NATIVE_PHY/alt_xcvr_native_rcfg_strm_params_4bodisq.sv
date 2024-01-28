// Parameters for embedded reconfiguration streamer

package alt_xcvr_native_rcfg_strm_params_4bodisq;

  localparam rom_data_width = 26; // ROM data width 
  localparam rom_depth = 6; // Depth of reconfiguration rom
  localparam rcfg_cfg_depths = "3,3"; // Depths of individual configuration profiles in rom

  // Reconfiguration rom containing all profiles in order
  localparam reg [25:0] config_rom [0:5] = '{
    26'h1350C00,
    26'h13A3828,
    26'h3FFFFFF,
    26'h1350C0C,
    26'h13A3820,
    26'h3FFFFFF
  };
endpackage