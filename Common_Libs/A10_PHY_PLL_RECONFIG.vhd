library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;

entity A10_PHY_PLL_RECONFIG is
	port (
		Clk					: in std_logic;
		Reset					: in std_logic;
		
		Speed_Req			: in std_logic;
		Speed					: in std_logic;
		Rcfg_Done			: out std_logic;
		
		phy_address			: out std_logic_vector(9 downto 0);
		phy_write			: out std_logic := '0';
		phy_writedata		: out std_logic_vector(31 downto 0);  
		phy_read				: out std_logic := '0';
		phy_readdata		: in std_logic_vector(31 downto 0);
		phy_waitrequest	: in std_logic;
		
		pll_address			: out std_logic_vector(9 downto 0);
		pll_write			: out std_logic := '0';
		pll_writedata		: out std_logic_vector(31 downto 0);  
		pll_read				: out std_logic := '0';
		pll_readdata		: in std_logic_vector(31 downto 0);
		pll_waitrequest	: in std_logic
	);
end entity;

architecture behavioral of A10_PHY_PLL_RECONFIG is

type States	is (IDLE, WRITE_PLL, WAIT_PLL_WRITE_ACCEPTED, READ_PLL, WAIT_PLL_READY, WRITE_PHY, WAIT_PHY_WRITE_ACCEPTED, READ_PHY, WAIT_PHY_READY);
signal State : States := IDLE;

signal Speed_Loc	: std_logic := '0';

signal dphy_waitrequest : std_logic := '0';
signal dpll_waitrequest : std_logic := '0';

signal phy_req_accepted	: std_logic := '0';
signal pll_req_accepted	: std_logic := '0';

begin

	Speed_Loc <= Speed when Rising_Edge(Clk) and Speed_Req = '1';
	phy_req_accepted	<= '1' when phy_waitrequest = '0' and dphy_waitrequest = '1' else '0';
	pll_req_accepted	<= '1' when pll_waitrequest = '0' and dpll_waitrequest = '1' else '0';
	
	process(Clk) begin
		if Rising_Edge(Clk) then
			dphy_waitrequest	<= phy_waitrequest;
			dpll_waitrequest	<= pll_waitrequest;
			if Reset = '1' then
				State 		<= IDLE;
				phy_write	<= '0';
				phy_read		<= '0';
				pll_write	<= '0';
				pll_read		<= '0';
			else
				case State is
					when IDLE =>
						phy_write	<= '0';
						phy_read		<= '0';
						pll_write	<= '0';
						pll_read		<= '0';
						Rcfg_Done	<= '0';
						if Speed_Req = '1' then
							State <= WRITE_PLL;
						else
							State <= IDLE;
						end if;
					when WRITE_PLL =>
						State 			<= WAIT_PLL_WRITE_ACCEPTED;
						pll_write		<= '1';
						pll_address		<= "1101000000";
						pll_writedata	<= x"000000" & '1' & "000000" & Speed_Loc;
					when WAIT_PLL_WRITE_ACCEPTED =>
						if pll_req_accepted = '1' or pll_waitrequest = '0' then
							State <= READ_PLL;
							pll_write	<= '0';
						else
							State 	<= WAIT_PLL_WRITE_ACCEPTED;
						end if;
					when READ_PLL =>
						State			<= WAIT_PLL_READY;
						pll_read 	<= '1';
						pll_address	<= "1101000001";
					when WAIT_PLL_READY =>
						if pll_req_accepted = '1' then
							pll_read	<= '0';
							if pll_readdata(0) = '0' then
								State <= WRITE_PHY;
							else
								State <= READ_PLL;
							end if;
						else
							State <= WAIT_PLL_READY;
						end if;
					when WRITE_PHY =>
						State				<= WAIT_PHY_WRITE_ACCEPTED;
						phy_write		<= '1';
						phy_address		<= "1101000000";
						phy_writedata	<= x"000000" & '1' & "000000" & Speed_Loc;
					when WAIT_PHY_WRITE_ACCEPTED =>
						if phy_req_accepted = '1' or phy_waitrequest = '0' then
							phy_write	<= '0';
							State <= READ_PHY;
						else
							State 		<= WAIT_PHY_WRITE_ACCEPTED;
						end if;
					when READ_PHY =>
						State			<= WAIT_PHY_READY;
						phy_read 	<= '1';
						phy_address	<= "1101000001";
					when WAIT_PHY_READY =>
						if phy_req_accepted = '1' then
							phy_read	<= '0';
							if phy_readdata(0) = '0' then
								State 		<= IDLE;
								Rcfg_Done	<= '1';
							else
								State <= READ_PHY;
							end if;
						else
							State <= WAIT_PHY_READY;
						end if;
					when others =>
						NULL;
				end case;
			end if;
		end if;
	end process;
		
end architecture;
