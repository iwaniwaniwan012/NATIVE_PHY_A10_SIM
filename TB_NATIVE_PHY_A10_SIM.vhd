library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity TB_NATIVE_PHY_A10_SIM is
end entity;

architecture behavioral of TB_NATIVE_PHY_A10_SIM is

constant T 				: time := 8 ns;
constant T_Rcfg		: time := 8 ns;

signal Clk 				: std_logic := '0';
signal Clk_Rcfg		: std_logic := '0';
signal Reset			: std_logic := '1';
signal Rcfg_Reset		: std_logic := '0';

signal wire_phy_reconfig_write					: std_logic_vector(0 downto 0)   := (others => '0');
signal wire_phy_reconfig_read						: std_logic_vector(0 downto 0)   := (others => '0');
signal wire_phy_reconfig_address					: std_logic_vector(9 downto 0)   := (others => '0');
signal wire_phy_reconfig_writedata				: std_logic_vector(31 downto 0)  := (others => '0');
signal wire_phy_reconfig_readdata				: std_logic_vector(31 downto 0)	:= (others => '0');
signal wire_phy_reconfig_waitrequest			: std_logic_vector(0 downto 0)	:= (others => '0');
signal wire_phy_reconfig_clk						: std_logic_vector(0 downto 0)   := (others => '0');
signal wire_phy_reconfig_reset					: std_logic_vector(0 downto 0)   := (others => '0');
signal wire_phy_rx_analogreset					: std_logic_vector(0 downto 0)   := (others => '0');
signal wire_phy_rx_cal_busy						: std_logic_vector(0 downto 0)	:= (others => '0');
signal wire_phy_rx_cdr_refclk0					: std_logic                      := '0';
signal wire_phy_rx_clkout							: std_logic_vector(0 downto 0)	:= (others => '0');
signal wire_phy_rx_coreclkin						: std_logic_vector(0 downto 0)   := (others => '0');
signal wire_phy_rx_digitalreset					: std_logic_vector(0 downto 0)   := (others => '0');
signal wire_phy_rx_is_lockedtodata				: std_logic_vector(0 downto 0)	:= (others => '0');
signal wire_phy_rx_is_lockedtoref				: std_logic_vector(0 downto 0)	:= (others => '0');
signal wire_phy_rx_parallel_data					: std_logic_vector(19 downto 0)	:= (others => '0');
signal wire_phy_rx_serial_data					: std_logic_vector(0 downto 0)   := (others => '0');
signal wire_phy_tx_analogreset					: std_logic_vector(0 downto 0)   := (others => '0');
signal wire_phy_tx_cal_busy						: std_logic_vector(0 downto 0)	:= (others => '0');
signal wire_phy_tx_clkout							: std_logic_vector(0 downto 0)	:= (others => '0');
signal wire_phy_tx_coreclkin						: std_logic_vector(0 downto 0)   := (others => '0');
signal wire_phy_tx_digitalreset					: std_logic_vector(0 downto 0)   := (others => '0');
signal wire_phy_tx_parallel_data					: std_logic_vector(19 downto 0)  := "10101010101010101010";--(others => '0');
signal wire_phy_tx_serial_clk0					: std_logic_vector(0 downto 0)   := (others => '0');
signal wire_phy_tx_serial_data					: std_logic_vector(0 downto 0)	:= (others => '0');
signal wire_phy_unused_rx_parallel_data		: std_logic_vector(107 downto 0)	:= (others => '0');
signal wire_phy_unused_tx_parallel_data		: std_logic_vector(107 downto 0)	:= (others => '0');

signal wire_atx_pll_cal_busy						: std_logic								:= '0';
signal wire_atx_pll_locked							: std_logic                    	:= '0';
signal wire_atx_pll_powerdown						: std_logic                     	:= '0';
signal wire_atx_pll_refclk0						: std_logic                     	:= '0';
signal wire_atx_reconfig_write0					: std_logic                     	:= '0';
signal wire_atx_reconfig_read0					: std_logic                    	:= '0';
signal wire_atx_reconfig_address0				: std_logic_vector(9 downto 0)  	:= (others => '0');
signal wire_atx_reconfig_writedata0				: std_logic_vector(31 downto 0) 	:= (others => '0');
signal wire_atx_reconfig_readdata0				: std_logic_vector(31 downto 0)	:= (others => '0');
signal wire_atx_reconfig_waitrequest0			: std_logic                  		:= '0';
signal wire_atx_reconfig_clk0						: std_logic                     	:= '0';
signal wire_atx_reconfig_reset0					: std_logic                     	:= '0';
signal wire_atx_tx_serial_clk						: std_logic                      := '0';

signal wire_phy_reset_clock						: std_logic                    	:= '0';
signal wire_phy_reset_pll_locked					: std_logic_vector(0 downto 0) 	:= (others => '0');
signal wire_phy_reset_pll_powerdown				: std_logic_vector(0 downto 0)	:= (others => '0');
signal wire_phy_reset_pll_select					: std_logic_vector(0 downto 0) 	:= (others => '0');
signal wire_phy_reset_reset						: std_logic                    	:= '0';
signal wire_phy_reset_rx_analogreset			: std_logic_vector(0 downto 0)	:= (others => '0');
signal wire_phy_reset_rx_cal_busy				: std_logic_vector(0 downto 0) 	:= (others => '0');
signal wire_phy_reset_rx_digitalreset			: std_logic_vector(0 downto 0)	:= (others => '0');
signal wire_phy_reset_rx_is_lockedtodata		: std_logic_vector(0 downto 0) 	:= (others => '0');
signal wire_phy_reset_rx_ready					: std_logic_vector(0 downto 0)	:= (others => '0');
signal wire_phy_reset_tx_analogreset			: std_logic_vector(0 downto 0)	:= (others => '0');
signal wire_phy_reset_tx_cal_busy				: std_logic_vector(0 downto 0) 	:= (others => '0');
signal wire_phy_reset_tx_digitalreset			: std_logic_vector(0 downto 0)	:= (others => '0');
signal wire_phy_reset_tx_ready					: std_logic_vector(0 downto 0)	:= (others => '0');


signal wire_rcfg_clk					: std_logic := '0';
signal wire_rcfg_reset				: std_logic := '0';
signal wire_rcfg_Speed_Req			: std_logic := '0';
signal wire_rcfg_Speed				: std_logic := '0';
signal wire_rcfg_Rcfg_Done			: std_logic := '0';
signal wire_rcfg_phy_write			: std_logic := '0';
signal wire_rcfg_phy_read			: std_logic := '0';
signal wire_rcfg_phy_address		: std_logic_vector(9 downto 0) := (others => '0');
signal wire_rcfg_phy_writedata	: std_logic_vector(31 downto 0) := (others => '0');
signal wire_rcfg_phy_readdata		: std_logic_vector(31 downto 0) := (others => '0');
signal wire_rcfg_phy_waitrequest	: std_logic := '0';
signal wire_rcfg_atx_write			: std_logic := '0';
signal wire_rcfg_atx_read			: std_logic := '0';
signal wire_rcfg_atx_address		: std_logic_vector(9 downto 0) := (others => '0');
signal wire_rcfg_atx_writedata	: std_logic_vector(31 downto 0) := (others => '0');
signal wire_rcfg_atx_readdata		: std_logic_vector(31 downto 0) := (others => '0');
signal wire_rcfg_atx_waitrequest	: std_logic := '0';

signal wire_prbs_gen_clk				: std_logic := '0';
signal wire_prbs_gen_reset				: std_logic	:= '0';
signal wire_prbs_gen_data_out			: std_logic_vector(19 downto 0) := (others => '0');

signal wire_prbs_check_clk				: std_logic := '0';
signal wire_prbs_check_reset			: std_logic := '0';
signal wire_prbs_check_data_in		: std_logic_vector(19 downto 0) := (others => '0');
signal wire_prbs_check_data_err 		: std_logic := '0';

signal Counter_Rcfg		: std_logic_vector(15 downto 0) := (others => '0');
signal Wait_4_Reconfig	: std_logic := '0';

begin

Clk 			<= not Clk after T/2;
Clk_Rcfg 	<= not Clk_Rcfg after T_Rcfg/2;
Reset 		<= '1', '0' after T*10;

	m_NATIVE_PHY_A10: entity work.NATIVE_PHY_A10
		port map (
			reconfig_write          	=> wire_phy_reconfig_write,					--: in  std_logic_vector(0 downto 0)
			reconfig_read           	=> wire_phy_reconfig_read,						--: in  std_logic_vector(0 downto 0)
			reconfig_address        	=> wire_phy_reconfig_address,					--: in  std_logic_vector(9 downto 0)
			reconfig_writedata      	=> wire_phy_reconfig_writedata,				--: in  std_logic_vector(31 downto 0)
			reconfig_readdata       	=> wire_phy_reconfig_readdata,				--: out std_logic_vector(31 downto 0)
			reconfig_waitrequest   		=> wire_phy_reconfig_waitrequest,			--: out std_logic_vector(0 downto 0)
			reconfig_clk            	=> wire_phy_reconfig_clk,						--: in  std_logic_vector(0 downto 0)
			reconfig_reset          	=> wire_phy_reconfig_reset,					--: in  std_logic_vector(0 downto 0)
			rx_analogreset          	=> wire_phy_rx_analogreset,					--: in  std_logic_vector(0 downto 0)
			rx_cal_busy             	=> wire_phy_rx_cal_busy,						--: out std_logic_vector(0 downto 0)
			rx_cdr_refclk0          	=> wire_phy_rx_cdr_refclk0,					--: in  std_logic
			rx_clkout               	=> wire_phy_rx_clkout,							--: out std_logic_vector(0 downto 0)
			rx_coreclkin            	=> wire_phy_rx_coreclkin,						--: in  std_logic_vector(0 downto 0)
			rx_digitalreset         	=> wire_phy_rx_digitalreset,					--: in  std_logic_vector(0 downto 0)
			rx_is_lockedtodata      	=> wire_phy_rx_is_lockedtodata,				--: out std_logic_vector(0 downto 0)
			rx_is_lockedtoref       	=> wire_phy_rx_is_lockedtoref,				--: out std_logic_vector(0 downto 0)
			rx_parallel_data        	=> wire_phy_rx_parallel_data,					--: out std_logic_vector(19 downto 0)
			rx_serial_data          	=> wire_phy_rx_serial_data,					--: in  std_logic_vector(0 downto 0)
			tx_analogreset          	=> wire_phy_tx_analogreset,					--: in  std_logic_vector(0 downto 0)
			tx_cal_busy             	=> wire_phy_tx_cal_busy,						--: out std_logic_vector(0 downto 0)
			tx_clkout               	=> wire_phy_tx_clkout,							--: out std_logic_vector(0 downto 0)
			tx_coreclkin            	=> wire_phy_tx_coreclkin,						--: in  std_logic_vector(0 downto 0)
			tx_digitalreset         	=> wire_phy_tx_digitalreset,					--: in  std_logic_vector(0 downto 0)
			tx_parallel_data        	=> wire_phy_tx_parallel_data,					--: in  std_logic_vector(19 downto 0)
			tx_serial_clk0          	=> wire_phy_tx_serial_clk0,					--: in  std_logic_vector(0 downto 0)
			tx_serial_data          	=> wire_phy_tx_serial_data,					--: out std_logic_vector(0 downto 0)
			unused_rx_parallel_data 	=> wire_phy_unused_rx_parallel_data,		--: out std_logic_vector(107 downto 0)
			unused_tx_parallel_data 	=> wire_phy_unused_tx_parallel_data			--: in  std_logic_vector(107 downto 0)
		);
	
	wire_phy_reconfig_write(0)		<= wire_rcfg_phy_write;
	wire_phy_reconfig_read(0)		<= wire_rcfg_phy_read;
	wire_phy_reconfig_address		<= wire_rcfg_phy_address;
	wire_phy_reconfig_writedata	<= wire_rcfg_phy_writedata;
	wire_phy_reconfig_clk(0)		<= Clk_Rcfg;
	wire_phy_reconfig_reset(0)		<= Reset;
	wire_phy_rx_analogreset			<= wire_phy_reset_rx_analogreset;
	wire_phy_rx_cdr_refclk0			<= Clk;
	wire_phy_rx_coreclkin			<= wire_phy_rx_clkout;
	wire_phy_rx_digitalreset		<= wire_phy_reset_rx_digitalreset;
	wire_phy_rx_serial_data			<= wire_phy_tx_serial_data;
	wire_phy_tx_analogreset			<= wire_phy_reset_tx_analogreset;
	wire_phy_tx_coreclkin			<= wire_phy_tx_clkout;
	wire_phy_tx_digitalreset		<= wire_phy_reset_tx_digitalreset;
	wire_phy_tx_parallel_data		<= wire_prbs_gen_data_out;
	wire_phy_tx_serial_clk0(0)		<= wire_atx_tx_serial_clk;
	
	m_ATX_PLL_PHY: entity work.ATX_PLL_PHY
		port map (
			pll_cal_busy          		=> wire_atx_pll_cal_busy,						--: out std_logic
			pll_locked            		=> wire_atx_pll_locked,							--: out std_logic
			pll_powerdown         		=> wire_atx_pll_powerdown,						--: in  std_logic
			pll_refclk0           		=> wire_atx_pll_refclk0,						--: in  std_logic
			reconfig_write0       		=> wire_atx_reconfig_write0,					--: in  std_logic
			reconfig_read0        		=> wire_atx_reconfig_read0,					--: in  std_logic
			reconfig_address0     		=> wire_atx_reconfig_address0,				--: in  std_logic_vector(9 downto 0)
			reconfig_writedata0   		=> wire_atx_reconfig_writedata0,				--: in  std_logic_vector(31 downto 0)
			reconfig_readdata0    		=> wire_atx_reconfig_readdata0,				--: out std_logic_vector(31 downto 0)
			reconfig_waitrequest0 		=> wire_atx_reconfig_waitrequest0,			--: out std_logic
			reconfig_clk0         		=> wire_atx_reconfig_clk0,						--: in  std_logic
			reconfig_reset0       		=> wire_atx_reconfig_reset0,					--: in  std_logic
			tx_serial_clk         		=> wire_atx_tx_serial_clk						--: out std_logic
		);
		
	wire_atx_pll_powerdown				<= wire_phy_reset_pll_powerdown(0);
	wire_atx_pll_refclk0					<= Clk;
	wire_atx_reconfig_write0			<= wire_rcfg_atx_write;
	wire_atx_reconfig_read0				<= wire_rcfg_atx_read;
	wire_atx_reconfig_address0			<= wire_rcfg_atx_address;
	wire_atx_reconfig_writedata0		<= wire_rcfg_atx_writedata;
	wire_atx_reconfig_clk0				<= Clk_Rcfg;
	wire_atx_reconfig_reset0			<= Reset;
		
	m_NATIVE_PHY_RESET: entity work.NATIVE_PHY_RESET
		port map (
			clock              			=> wire_phy_reset_clock,						--: in  std_logic
			pll_locked         			=> wire_phy_reset_pll_locked,					--: in  std_logic_vector(0 downto 0)
			pll_powerdown      			=> wire_phy_reset_pll_powerdown,				--: out std_logic_vector(0 downto 0)
			pll_select         			=> wire_phy_reset_pll_select,					--: in  std_logic_vector(0 downto 0)
			reset              			=> wire_phy_reset_reset,						--: in  std_logic
			rx_analogreset     			=> wire_phy_reset_rx_analogreset,			--: out std_logic_vector(0 downto 0)
			rx_cal_busy        			=> wire_phy_reset_rx_cal_busy,				--: in  std_logic_vector(0 downto 0)
			rx_digitalreset    			=> wire_phy_reset_rx_digitalreset,			--: out std_logic_vector(0 downto 0)
			rx_is_lockedtodata 			=> wire_phy_reset_rx_is_lockedtodata,		--: in  std_logic_vector(0 downto 0)
			rx_ready           			=> wire_phy_reset_rx_ready,					--: out std_logic_vector(0 downto 0)
			tx_analogreset     			=> wire_phy_reset_tx_analogreset,			--: out std_logic_vector(0 downto 0)
			tx_cal_busy        			=> wire_phy_reset_tx_cal_busy,				--: in  std_logic_vector(0 downto 0)
			tx_digitalreset    			=> wire_phy_reset_tx_digitalreset,			--: out std_logic_vector(0 downto 0)
			tx_ready           			=> wire_phy_reset_tx_ready						--: out std_logic_vector(0 downto 0)
		);
	
	wire_phy_reset_clock						<= Clk_Rcfg;
	wire_phy_reset_pll_locked(0)			<= wire_atx_pll_locked;
	wire_phy_reset_pll_select				<= (others => '0');
	wire_phy_reset_reset						<= Reset or Rcfg_Reset;
	wire_phy_reset_rx_cal_busy				<= wire_phy_rx_cal_busy;
	wire_phy_reset_rx_is_lockedtodata	<= wire_phy_rx_is_lockedtodata;
	wire_phy_reset_tx_cal_busy				<= wire_phy_tx_cal_busy;
	
	m_A10_PHY_PLL_RECONFIG: entity work.A10_PHY_PLL_RECONFIG
		port map (
			Clk						=> wire_rcfg_clk,					--: in std_logic;
			Reset						=> wire_rcfg_Reset,				--: in std_logic;
			Speed_Req				=> wire_rcfg_Speed_Req,			--: in std_logic;
			Speed						=> wire_rcfg_Speed,				--: in std_logic;
			Rcfg_Done				=> wire_rcfg_Rcfg_Done,			--: out std_logic;
			phy_address				=> wire_rcfg_phy_address,		--: out std_logic_vector(9 downto 0);
			phy_write				=> wire_rcfg_phy_write,			--: out std_logic := '0';
			phy_writedata			=> wire_rcfg_phy_writedata,	--: out std_logic_vector(31 downto 0);  
			phy_read					=> wire_rcfg_phy_read,			--: out std_logic := '0';
			phy_readdata			=> wire_rcfg_phy_readdata,		--: in std_logic_vector(31 downto 0);
			phy_waitrequest		=> wire_rcfg_phy_waitrequest,	--: in std_logic;
			pll_address				=> wire_rcfg_atx_address,		--: out std_logic_vector(9 downto 0);
			pll_write				=> wire_rcfg_atx_write,			--: out std_logic := '0';
			pll_writedata			=> wire_rcfg_atx_writedata,	--: out std_logic_vector(31 downto 0);  
			pll_read					=> wire_rcfg_atx_read,			--: out std_logic := '0';
			pll_readdata			=> wire_rcfg_atx_readdata,		--: in std_logic_vector(31 downto 0);
			pll_waitrequest		=> wire_rcfg_atx_waitrequest	--: in std_logic
		);
	
	wire_rcfg_clk					<= Clk_Rcfg;
	wire_rcfg_phy_readdata		<= wire_phy_reconfig_readdata;
	wire_rcfg_phy_waitrequest	<= wire_phy_reconfig_waitrequest(0);
	wire_rcfg_atx_readdata		<= wire_atx_reconfig_readdata0;
	wire_rcfg_atx_waitrequest	<= wire_atx_reconfig_waitrequest0;
	
	m_PRBS9_Generator: entity work.PRBS9_Generator
		port map (
			Clk			=> wire_prbs_gen_clk,		--: in std_logic;
			Reset			=> wire_prbs_gen_reset,		--: in std_logic;
			DataOut		=> wire_prbs_gen_data_out	--: out std_logic_vector(19 downto 0)
		);
		
	wire_prbs_gen_clk 			<= wire_phy_tx_clkout(0);
	wire_prbs_gen_reset			<= Reset or Rcfg_Reset;-- or (not wire_phy_pll_locked(0));-- or Wait_4_Rcfg;
		
	m_PRBS9_Checker: entity work.PRBS9_Checker
		port map (
			Clk			=> wire_prbs_check_clk, 		--: in std_logic;
			Reset			=> wire_prbs_check_reset, 		--: in std_logic;
			DataIn		=> wire_prbs_check_data_in, 	--: in std_logic_vector(19 downto 0);
			DataError	=> wire_prbs_check_data_err 	--: out std_logic
		);
	wire_prbs_check_clk 		<= wire_phy_rx_clkout(0);
	wire_prbs_check_reset	<= Reset or Rcfg_Reset;-- or (not wire_phy_rx_is_lockedtodata(0));
	wire_prbs_check_data_in	<= wire_phy_rx_parallel_data;
	
	process(Clk_Rcfg) begin
		if Rising_Edge(Clk_Rcfg) then
			if Reset = '1' then
				Counter_Rcfg 			<= (others => '0');
				Rcfg_Reset 				<= '0';
				Wait_4_Reconfig		<= '0';
				wire_rcfg_Speed_Req 	<= '0';
			else
				if Wait_4_Reconfig = '0' then
					if Counter_Rcfg = x"3FFF" then
						Wait_4_Reconfig 		<= '1';
						wire_rcfg_Speed_Req 	<= '1';
						wire_rcfg_Speed 		<= not wire_rcfg_Speed;
						Rcfg_Reset				<= '1';
					else
						Counter_Rcfg <= Counter_Rcfg + '1';
					end if;
				else
					wire_rcfg_Speed_Req 	<= '0';
					if wire_rcfg_Rcfg_Done = '1' then
						Rcfg_Reset 			<= '0';
						Wait_4_Reconfig 	<= '0';
						Counter_Rcfg		<= (others => '0');
					end if;
				end if;
			end if;
		end if;
	end process;
	
end architecture; 
