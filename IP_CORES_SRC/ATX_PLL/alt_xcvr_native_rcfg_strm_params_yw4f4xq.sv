// Parameters for embedded reconfiguration streamer

package alt_xcvr_native_rcfg_strm_params_yw4f4xq;

  localparam rom_data_width = 26; // ROM data width 
  localparam rom_depth = 4; // Depth of reconfiguration rom
  localparam rcfg_cfg_depths = "2,2"; // Depths of individual configuration profiles in rom

  // Reconfiguration rom containing all profiles in order
  localparam reg [25:0] config_rom [0:3] = '{
    26'h1080704,
    26'h3FFFFFF,
    26'h1080703,
    26'h3FFFFFF
  };
endpackage