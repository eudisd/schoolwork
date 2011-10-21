library ieee;
use ieee.std_logic_1164.all;

entity test_shift_detector is
end test_shift_detector;

architecture test_arch of test_shift_detector is
	component shift_detector
		port(
			clk : in std_logic;
			done : in std_logic;
			hex : in std_logic_vector(7 downto 0);
			shift : out std_logic
			);
	end component;
	
	signal clk : std_logic := '1';
	signal done, shift : std_logic;
	signal hex : std_logic_vector(7 downto 0);
begin

	s: shift_detector port map(
		clk => clk,
		done => done,
		hex => hex,
		shift => shift
	);
	
	
	process
	begin

		clk <= not clk;
		wait for 35 ns;
		
		-- No Reaction
		shift <= '0';
		hex <= X"59";

		clk <= not clk;
		wait for 35 ns;
		
		
		clk <= not clk;
		wait for 35 ns;
		
		-- No Reaction
		shift <= '0';
		hex <= X"59";
		
		clk <= not clk;
		wait for 35 ns;
		
		clk <= not clk;
		wait for 35 ns;
		-- Press L-Shift
		shift <= '0';
		hex <= X"12";
		
		clk <= not clk;
		wait for 35 ns;
		
		clk <= not clk;
		wait for 35 ns;
		
		shift <= '0'; -- Press R-Shift
		hex <= X"59";
		
		clk <= not clk;
		wait for 35 ns;
		
		clk <= not clk;
		wait for 35 ns;
		
		-- Begin to let go of the key (Break)
		
		shift <= '0';
		hex <= X"F0";
		clk <= not clk;
		wait for 35 ns;
		
		clk <= not clk;
		wait for 35 ns;
		
		-- Let go of the key, it is now on the up state
		
		shift <= '0';
		hex <= X"59";
		
		clk <= not clk;
		wait for 35 ns;
		clk <= not clk;
		wait for 35 ns;
		done <= '1';
		report "Test Ended successfully" severity failure;
		
	end process;
end test_arch;