library ieee;
use ieee.std_logic_1164.all;

entity test_adder is
end test_adder;

architecture arch_adder of test_adder is
	component adder 
		port (
		clock_50_mhz :in std_logic;
		en :in std_logic;
		data_registerfile : in std_logic_vector(7 downto 0);
		read_address: out std_logic_vector(2 downto 0);
		output : out std_logic_vector(11 downto 0));
	end component;
	
	signal clock, e : std_logic := '0';
	signal data : std_logic_vector(7 downto 0);
	signal raddr : std_logic_vector(2 downto 0);
	signal o : std_logic_vector(11 downto 0);
	
begin
	a: adder port map(
		clock_50_mhz => clock,
		en => e,
		data_registerfile => data,
		read_address => raddr,
		output => o
	);
	
	process 
	begin
	
	wait for 5 ns;
	clock <= not clock;
	wait for 50 ns;
	
	e <= '1';
	data <= "00000001";
	
	
	wait for 5 ns;
	clock <= not clock;
	wait for 50 ns;
	
	wait for 5 ns;
	clock <= not clock;
	wait for 50 ns;
	
	wait for 5 ns;
	clock <= not clock;
	wait for 50 ns;
	
	wait for 5 ns;
	clock <= not clock;
	wait for 50 ns;
	
	
	wait for 5 ns;
	clock <= not clock;
	wait for 50 ns;
	
	wait for 5 ns;
	clock <= not clock;
	wait for 50 ns;
	
	wait for 5 ns;
	clock <= not clock;
	wait for 50 ns;
	
	wait for 5 ns;
	clock <= not clock;
	wait for 50 ns;
	
	wait for 5 ns;
	clock <= not clock;
	wait for 50 ns;
	
	wait for 5 ns;
	clock <= not clock;
	wait for 50 ns;
	
	
	

	
	
	
	
	end process;
end arch_adder;