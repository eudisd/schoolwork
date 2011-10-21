library ieee;
use ieee.std_logic_1164.all;

entity test_Register_4_bit is
end test_Register_4_bit;

architecture test of test_Register_4_bit is

	component Register_Four_Bit
		port( Input : in std_logic_vector(3 downto 0);
			   En, Clock : in std_logic;
			   Output : out std_logic_vector(3 downto 0));
	end component;
	
	signal Input : std_logic_vector(3 downto 0);
	signal En, Clk : std_logic;
	signal Output : std_logic_vector(3 downto 0);
	signal error : std_logic := '0';
begin

	testing: Register_Four_Bit port map(Input=>Input,En=>En,Clock=>Clk,Output=>Output);
	process
	begin
		Input <= "0000";
		Clk <= '0';
		EN <= '1';
		wait for 100 ns;
		Clk <= Not Clk;
		wait for 1 ns;
		if (Output /= "0000") then
			error <= '1';
		end if;
		wait for 100 ns;
		Clk <= Not Clk;
		EN <= '1';
		Input <= "1010";
		wait for 100 ns;
		Clk <= Not Clk;
		wait for 1 ns;
		if (Output /= "1010") then
			error <= '1';
		end if;
		wait for 100 ns;
		Clk <= Not Clk;
		EN <= '0';
		Input <= "0000";
		wait for 100 ns;
		Clk <= Not Clk;
		wait for 1 ns;
		if (Output /= "1010") then
			error <= '1';
		end if;
		wait for 100 ns;
		Clk <= Not Clk;
		EN <= '1';
		Input <= "0101";
		wait for 100 ns;
		Clk <= Not Clk;
		wait for 1 ns;
		if (Output /= "0101") then
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