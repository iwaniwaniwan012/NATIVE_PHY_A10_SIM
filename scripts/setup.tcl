if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "/home/dev/intelFPGA/20.1/quartus/"
}

proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }

ensure_lib     ./work/
vmap work      ./work/
ensure_lib     ./work_lib/
vmap work_lib  ./work_lib/
ensure_lib 		./hw_libs/

if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
  ensure_lib                   ./hw_libs/altera_ver/       
  vmap       altera_ver        ./hw_libs/altera_ver/       
  ensure_lib                   ./hw_libs/lpm_ver/          
  vmap       lpm_ver           ./hw_libs/lpm_ver/          
  ensure_lib                   ./hw_libs/sgate_ver/        
  vmap       sgate_ver         ./hw_libs/sgate_ver/        
  ensure_lib                   ./hw_libs/altera_mf_ver/    
  vmap       altera_mf_ver     ./hw_libs/altera_mf_ver/    
  ensure_lib                   ./hw_libs/altera_lnsim_ver/ 
  vmap       altera_lnsim_ver  ./hw_libs/altera_lnsim_ver/ 
  ensure_lib                   ./hw_libs/twentynm_ver/     
  vmap       twentynm_ver      ./hw_libs/twentynm_ver/     
  ensure_lib                   ./hw_libs/twentynm_hssi_ver/
  vmap       twentynm_hssi_ver ./hw_libs/twentynm_hssi_ver/
  ensure_lib                   ./hw_libs/twentynm_hip_ver/ 
  vmap       twentynm_hip_ver  ./hw_libs/twentynm_hip_ver/ 
  ensure_lib                   ./hw_libs/altera/           
  vmap       altera            ./hw_libs/altera/           
  ensure_lib                   ./hw_libs/lpm/              
  vmap       lpm               ./hw_libs/lpm/              
  ensure_lib                   ./hw_libs/sgate/            
  vmap       sgate             ./hw_libs/sgate/            
  ensure_lib                   ./hw_libs/altera_mf/        
  vmap       altera_mf         ./hw_libs/altera_mf/        
  ensure_lib                   ./hw_libs/altera_lnsim/     
  vmap       altera_lnsim      ./hw_libs/altera_lnsim/     
  ensure_lib                   ./hw_libs/twentynm/         
  vmap       twentynm          ./hw_libs/twentynm/         
  ensure_lib                   ./hw_libs/twentynm_hssi/    
  vmap       twentynm_hssi     ./hw_libs/twentynm_hssi/    
  ensure_lib                   ./hw_libs/twentynm_hip/     
  vmap       twentynm_hip      ./hw_libs/twentynm_hip/     
}
ensure_lib																 ./ip_cores/
ensure_lib                                           		 ./ip_cores/altera_common_sv_packages/                
vmap       altera_common_sv_packages                 		 ./ip_cores/altera_common_sv_packages/
   
ensure_lib                                           		 ./ip_cores/NATIVE_PHY_A10_altera_xcvr_native_a10_201/
vmap       NATIVE_PHY_A10_altera_xcvr_native_a10_201 		 ./ip_cores/NATIVE_PHY_A10_altera_xcvr_native_a10_201/
ensure_lib                                           		 ./ip_cores/ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201/
vmap       ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201   		 ./ip_cores/ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201/
ensure_lib                                                ./ip_cores/NATIVE_PHY_RESET_altera_xcvr_reset_control_201/
vmap       NATIVE_PHY_RESET_altera_xcvr_reset_control_201 ./ip_cores/NATIVE_PHY_RESET_altera_xcvr_reset_control_201/


if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
    eval  vlog   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                 -work altera_ver       
    eval  vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                          -work lpm_ver          
    eval  vlog   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                             -work sgate_ver        
    eval  vlog   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                         -work altera_mf_ver    
    eval  vlog -sv "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                     -work altera_lnsim_ver 
    eval  vlog   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_atoms.v"                    -work twentynm_ver     
    eval  vlog   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/twentynm_atoms_ncrypt.v"      -work twentynm_ver     
    eval  vlog  	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/twentynm_hssi_atoms_ncrypt.v" -work twentynm_hssi_ver
    eval  vlog   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hssi_atoms.v"               -work twentynm_hssi_ver
    eval  vlog   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/twentynm_hip_atoms_ncrypt.v"  -work twentynm_hip_ver 
    eval  vlog   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hip_atoms.v"                -work twentynm_hip_ver 
    eval  vcom   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_syn_attributes.vhd"           -work altera           
    eval  vcom   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_standard_functions.vhd"       -work altera           
    eval  vcom   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/alt_dspbuilder_package.vhd"          -work altera           
    eval  vcom   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_europa_support_lib.vhd"       -work altera           
    eval  vcom   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives_components.vhd"    -work altera           
    eval  vcom   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.vhd"               -work altera           
    eval  vcom   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/220pack.vhd"                         -work lpm              
    eval  vcom   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.vhd"                        -work lpm              
    eval  vcom   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate_pack.vhd"                      -work sgate            
    eval  vcom   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.vhd"                           -work sgate            
    eval  vcom   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf_components.vhd"            -work altera_mf        
    eval  vcom   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.vhd"                       -work altera_mf        
    eval  vlog -sv "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/altera_lnsim_for_vhdl.sv"     -work altera_lnsim     
    eval  vcom   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim_components.vhd"         -work altera_lnsim     
    eval  vlog   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/twentynm_atoms_ncrypt.v"      -work twentynm         
    eval  vcom   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_atoms.vhd"                  -work twentynm         
    eval  vcom   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_components.vhd"             -work twentynm         
    eval  vlog   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/twentynm_hssi_atoms_ncrypt.v" -work twentynm_hssi    
    eval  vcom   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hssi_components.vhd"        -work twentynm_hssi    
    eval  vcom   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hssi_atoms.vhd"             -work twentynm_hssi    
    eval  vlog   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/twentynm_hip_atoms_ncrypt.v"  -work twentynm_hip     
    eval  vcom   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hip_components.vhd"         -work twentynm_hip     
    eval  vcom   	 "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hip_atoms.vhd"              -work twentynm_hip     
  }

  #Native PHY Files Compilation IP_CORES_SRC/NATIVE_PHY/
	
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/altera_xcvr_native_a10_functions_h.sv"                                             -work altera_common_sv_packages                
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/alt_xcvr_resync.sv"                                   -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/alt_xcvr_arbiter.sv"                                  -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/mentor/alt_xcvr_resync.sv"                            -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/mentor/alt_xcvr_arbiter.sv"                           -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/twentynm_pcs.sv"                                      -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/twentynm_pma.sv"                                      -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/twentynm_xcvr_avmm.sv"                                -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/twentynm_xcvr_native.sv"                              -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/mentor/twentynm_pcs.sv"                               -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/mentor/twentynm_pma.sv"                               -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/mentor/twentynm_xcvr_avmm.sv"                         -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/mentor/twentynm_xcvr_native.sv"                       -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/a10_avmm_h.sv"                                        -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/alt_xcvr_native_pipe_retry.sv"                        -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/alt_xcvr_native_avmm_csr.sv"                          -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/alt_xcvr_native_prbs_accum.sv"                        -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/alt_xcvr_native_odi_accel.sv"                         -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/alt_xcvr_native_rcfg_arb.sv"                          -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/altera_xcvr_native_pcie_dfe_params_h.sv"              -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/pcie_mgmt_commands_h.sv"                              -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/pcie_mgmt_functions_h.sv"                             -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/pcie_mgmt_program.sv"                                 -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/pcie_mgmt_cpu.sv"                                     -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/pcie_mgmt_master.sv"                                  -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/altera_xcvr_native_pcie_dfe_ip.sv"                    -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/alt_xcvr_native_rcfg_strm_params_4bodisq.sv"          -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/alt_xcvr_native_rcfg_strm_functions.sv"               -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/alt_xcvr_native_rcfg_strm_ctrl.sv"                    -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/NATIVE_PHY_A10_altera_xcvr_native_a10_201_4bodisq.sv" -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/alt_xcvr_native_rcfg_strm_rom_4bodisq.sv"             -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/alt_xcvr_native_rcfg_strm_top_4bodisq.sv"             -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vlog -sv "./IP_CORES_SRC/NATIVE_PHY/alt_xcvr_native_rcfg_opt_logic_4bodisq.sv"            -L altera_common_sv_packages -work NATIVE_PHY_A10_altera_xcvr_native_a10_201
  eval  vcom 	  "./IP_CORES_SRC/NATIVE_PHY/NATIVE_PHY_A10.vhd"                                                                                                                                                 

  #ATX PLL Files Compilation IP_CORES_SRC/ATX_PLL/
  
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/altera_xcvr_native_a10_functions_h.sv"                                           -work altera_common_sv_packages              
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/twentynm_xcvr_avmm.sv"                              -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/mentor/twentynm_xcvr_avmm.sv"                       -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/alt_xcvr_resync.sv"                                 -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/alt_xcvr_arbiter.sv"                                -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/mentor/alt_xcvr_resync.sv"                          -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/mentor/alt_xcvr_arbiter.sv"                         -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/a10_avmm_h.sv"                                      -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/alt_xcvr_atx_pll_rcfg_arb.sv"                       -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/a10_xcvr_atx_pll.sv"                                -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/alt_xcvr_pll_embedded_debug.sv"                     -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/alt_xcvr_pll_avmm_csr.sv"                           -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/mentor/alt_xcvr_atx_pll_rcfg_arb.sv"                -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/mentor/a10_xcvr_atx_pll.sv"                         -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/mentor/alt_xcvr_pll_embedded_debug.sv"              -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/mentor/alt_xcvr_pll_avmm_csr.sv"                    -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/alt_xcvr_native_rcfg_strm_params_yw4f4xq.sv"        -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/alt_xcvr_native_rcfg_strm_functions.sv"             -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/alt_xcvr_native_rcfg_strm_ctrl.sv"                  -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201_yw4f4xq.sv" -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/alt_xcvr_native_rcfg_strm_rom_yw4f4xq.sv"           -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/alt_xcvr_native_rcfg_strm_top_yw4f4xq.sv"           -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vlog -sv "./IP_CORES_SRC/ATX_PLL/alt_xcvr_atx_pll_rcfg_opt_logic_yw4f4xq.sv"         -L altera_common_sv_packages -work ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201
  eval  vcom     "./IP_CORES_SRC/ATX_PLL/ATX_PLL_PHY.vhd"

  #Reset PHY compilation files
  
  eval  vlog -sv "./IP_CORES_SRC/RESET_PHY/altera_xcvr_functions.sv"            -work NATIVE_PHY_RESET_altera_xcvr_reset_control_201
  eval  vlog -sv "./IP_CORES_SRC/RESET_PHY/mentor/altera_xcvr_functions.sv"     -work NATIVE_PHY_RESET_altera_xcvr_reset_control_201
  eval  vlog -sv "./IP_CORES_SRC/RESET_PHY/alt_xcvr_resync.sv"                  -work NATIVE_PHY_RESET_altera_xcvr_reset_control_201
  eval  vlog -sv "./IP_CORES_SRC/RESET_PHY/mentor/alt_xcvr_resync.sv"           -work NATIVE_PHY_RESET_altera_xcvr_reset_control_201
  eval  vlog -sv "./IP_CORES_SRC/RESET_PHY/altera_xcvr_reset_control.sv"        -work NATIVE_PHY_RESET_altera_xcvr_reset_control_201
  eval  vlog -sv "./IP_CORES_SRC/RESET_PHY/alt_xcvr_reset_counter.sv"           -work NATIVE_PHY_RESET_altera_xcvr_reset_control_201
  eval  vlog -sv "./IP_CORES_SRC/RESET_PHY/mentor/altera_xcvr_reset_control.sv" -work NATIVE_PHY_RESET_altera_xcvr_reset_control_201
  eval  vlog -sv "./IP_CORES_SRC/RESET_PHY/mentor/alt_xcvr_reset_counter.sv"    -work NATIVE_PHY_RESET_altera_xcvr_reset_control_201
  eval  vcom 	  "./IP_CORES_SRC/RESET_PHY/NATIVE_PHY_RESET.vhd"
  
vcom -2008 ./Common_Libs/PRBS9_Generator.vhd
vcom -2008 ./Common_Libs/PRBS9_Checker.vhd
vcom -2008 ./Common_Libs/A10_PHY_PLL_RECONFIG.vhd
vcom -2008 ./TB_NATIVE_PHY_A10_SIM.vhd
  
eval vsim -voptargs=+acc -t ps -L work -L work_lib -L altera_common_sv_packages -L ATX_PLL_PHY_altera_xcvr_atx_pll_a10_201 -L NATIVE_PHY_A10_altera_xcvr_native_a10_201 -L NATIVE_PHY_RESET_altera_xcvr_reset_control_201 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L twentynm_ver -L twentynm_hssi_ver -L twentynm_hip_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L twentynm -L twentynm_hssi -L twentynm_hip  TB_NATIVE_PHY_A10_SIM

add wave -position insertpoint  \
sim:/tb_native_phy_a10_sim/Clk \
sim:/tb_native_phy_a10_sim/Clk_Rcfg \
sim:/tb_native_phy_a10_sim/Reset \
sim:/tb_native_phy_a10_sim/Rcfg_Reset \
sim:/tb_native_phy_a10_sim/wire_phy_reconfig_write \
sim:/tb_native_phy_a10_sim/wire_phy_reconfig_read \
sim:/tb_native_phy_a10_sim/wire_phy_reconfig_address \
sim:/tb_native_phy_a10_sim/wire_phy_reconfig_writedata \
sim:/tb_native_phy_a10_sim/wire_phy_reconfig_readdata \
sim:/tb_native_phy_a10_sim/wire_phy_reconfig_waitrequest \
sim:/tb_native_phy_a10_sim/wire_phy_reconfig_clk \
sim:/tb_native_phy_a10_sim/wire_phy_reconfig_reset \
sim:/tb_native_phy_a10_sim/wire_phy_rx_analogreset \
sim:/tb_native_phy_a10_sim/wire_phy_rx_cal_busy \
sim:/tb_native_phy_a10_sim/wire_phy_rx_cdr_refclk0 \
sim:/tb_native_phy_a10_sim/wire_phy_rx_clkout \
sim:/tb_native_phy_a10_sim/wire_phy_rx_coreclkin \
sim:/tb_native_phy_a10_sim/wire_phy_rx_digitalreset \
sim:/tb_native_phy_a10_sim/wire_phy_rx_is_lockedtodata \
sim:/tb_native_phy_a10_sim/wire_phy_rx_is_lockedtoref \
sim:/tb_native_phy_a10_sim/wire_phy_rx_parallel_data \
sim:/tb_native_phy_a10_sim/wire_phy_rx_serial_data \
sim:/tb_native_phy_a10_sim/wire_phy_tx_analogreset \
sim:/tb_native_phy_a10_sim/wire_phy_tx_cal_busy \
sim:/tb_native_phy_a10_sim/wire_phy_tx_clkout \
sim:/tb_native_phy_a10_sim/wire_phy_tx_coreclkin \
sim:/tb_native_phy_a10_sim/wire_phy_tx_digitalreset \
sim:/tb_native_phy_a10_sim/wire_phy_tx_parallel_data \
sim:/tb_native_phy_a10_sim/wire_phy_tx_serial_clk0 \
sim:/tb_native_phy_a10_sim/wire_phy_tx_serial_data \
sim:/tb_native_phy_a10_sim/wire_phy_unused_rx_parallel_data \
sim:/tb_native_phy_a10_sim/wire_phy_unused_tx_parallel_data \
sim:/tb_native_phy_a10_sim/wire_atx_pll_cal_busy \
sim:/tb_native_phy_a10_sim/wire_atx_pll_locked \
sim:/tb_native_phy_a10_sim/wire_atx_pll_powerdown \
sim:/tb_native_phy_a10_sim/wire_atx_pll_refclk0 \
sim:/tb_native_phy_a10_sim/wire_atx_reconfig_write0 \
sim:/tb_native_phy_a10_sim/wire_atx_reconfig_read0 \
sim:/tb_native_phy_a10_sim/wire_atx_reconfig_address0 \
sim:/tb_native_phy_a10_sim/wire_atx_reconfig_writedata0 \
sim:/tb_native_phy_a10_sim/wire_atx_reconfig_readdata0 \
sim:/tb_native_phy_a10_sim/wire_atx_reconfig_waitrequest0 \
sim:/tb_native_phy_a10_sim/wire_atx_reconfig_clk0 \
sim:/tb_native_phy_a10_sim/wire_atx_reconfig_reset0 \
sim:/tb_native_phy_a10_sim/wire_atx_tx_serial_clk \
sim:/tb_native_phy_a10_sim/wire_phy_reset_clock \
sim:/tb_native_phy_a10_sim/wire_phy_reset_pll_locked \
sim:/tb_native_phy_a10_sim/wire_phy_reset_pll_powerdown \
sim:/tb_native_phy_a10_sim/wire_phy_reset_pll_select \
sim:/tb_native_phy_a10_sim/wire_phy_reset_reset \
sim:/tb_native_phy_a10_sim/wire_phy_reset_rx_analogreset \
sim:/tb_native_phy_a10_sim/wire_phy_reset_rx_cal_busy \
sim:/tb_native_phy_a10_sim/wire_phy_reset_rx_digitalreset \
sim:/tb_native_phy_a10_sim/wire_phy_reset_rx_is_lockedtodata \
sim:/tb_native_phy_a10_sim/wire_phy_reset_rx_ready \
sim:/tb_native_phy_a10_sim/wire_phy_reset_tx_analogreset \
sim:/tb_native_phy_a10_sim/wire_phy_reset_tx_cal_busy \
sim:/tb_native_phy_a10_sim/wire_phy_reset_tx_digitalreset \
sim:/tb_native_phy_a10_sim/wire_phy_reset_tx_ready \
sim:/tb_native_phy_a10_sim/wire_rcfg_clk \
sim:/tb_native_phy_a10_sim/wire_rcfg_reset \
sim:/tb_native_phy_a10_sim/wire_rcfg_Speed_Req \
sim:/tb_native_phy_a10_sim/wire_rcfg_Speed \
sim:/tb_native_phy_a10_sim/wire_rcfg_Rcfg_Done \
sim:/tb_native_phy_a10_sim/wire_rcfg_phy_write \
sim:/tb_native_phy_a10_sim/wire_rcfg_phy_read \
sim:/tb_native_phy_a10_sim/wire_rcfg_phy_address \
sim:/tb_native_phy_a10_sim/wire_rcfg_phy_writedata \
sim:/tb_native_phy_a10_sim/wire_rcfg_phy_readdata \
sim:/tb_native_phy_a10_sim/wire_rcfg_phy_waitrequest \
sim:/tb_native_phy_a10_sim/wire_rcfg_atx_write \
sim:/tb_native_phy_a10_sim/wire_rcfg_atx_read \
sim:/tb_native_phy_a10_sim/wire_rcfg_atx_address \
sim:/tb_native_phy_a10_sim/wire_rcfg_atx_writedata \
sim:/tb_native_phy_a10_sim/wire_rcfg_atx_readdata \
sim:/tb_native_phy_a10_sim/wire_rcfg_atx_waitrequest \
sim:/tb_native_phy_a10_sim/wire_prbs_gen_clk \
sim:/tb_native_phy_a10_sim/wire_prbs_gen_reset \
sim:/tb_native_phy_a10_sim/wire_prbs_gen_data_out \
sim:/tb_native_phy_a10_sim/wire_prbs_check_clk \
sim:/tb_native_phy_a10_sim/wire_prbs_check_reset \
sim:/tb_native_phy_a10_sim/wire_prbs_check_data_in \
sim:/tb_native_phy_a10_sim/wire_prbs_check_data_err \
sim:/tb_native_phy_a10_sim/Counter_Rcfg \
sim:/tb_native_phy_a10_sim/Wait_4_Reconfig \
sim:/tb_native_phy_a10_sim/T \
sim:/tb_native_phy_a10_sim/T_Rcfg

run -all
