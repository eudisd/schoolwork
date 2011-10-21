library ieee;
use ieee.std_logic_1164.all;
entity test_DFF_With_Enable is
end test_DFF_With_Enable;

architecture test of test_DFF_With_Enable is
	component D_Flip_Flop_En	
		port ( D, En, Clock : in std_logic;
			   Q, NotQ : inout std_logic );
	end component;
		
	signal D, Clk, EN : std_logic;
	signal Q, notQ : std_logic;
	signal error : std_logic := '0';

begin
	testing: D_Flip_Flop_En port map (D=>D, Clock=>Clk, EN=>EN, Q=>Q, notQ=>NotQ);
	process
	begin
		D <= '0';
		Clk <= '0';
		EN <= '1';
		wait for 100 ns;
		Clk <= Not Clk;
		wait for 1 ns;
		if (Q /= '0') then
			error <= '1';
		end if;
		wait for 100 ns;
		Clk <= Not Clk;
		EN <= '1';
		D <= '1';
		wait for 100 ns;
		Clk <= Not Clk;
		wait for 1 ns;
		if (Q /= '1') then
			error <= '1';
		end if;
		wait for 100 ns;
		Clk <= Not Clk;
		EN <= '0';
		D <= '0';
		wait for 100 ns;
		Clk <= Not Clk;
		wait for 1 ns;
		if (Q /= '1') then
			error <= '1';
		end if;
		wait for 100 ns;
		Clk <= Not Clk;
		EN <= '1';
		D <= '0';
		wait for 100 ns;
		Clk <= Not Clk;
		wait for 1 ns;
		if (Q /= '0') then
			error <= '1';
		end if;
		wait for 100 ns;
		if (error = '0') then
			report "No errors detected. Simulation successful" severity failure;
		else
			report "Error detected" severity failure;
		end if;
	end process;
end test;