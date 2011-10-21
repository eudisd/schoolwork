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
		clk <= not clk;
		wait for 35 ns;
		
		-- No Reaction Start
		
		hex <= X"99";
		done <= '1';
		
		clk <= not clk;
		wait for 35 ns;
		clk <= not clk;
		wait for 35 ns;
		
		hex <= X"35";
		
		clk <= not clk;
		wait for 35 ns;
		 
		clk <= not clk;
		wait for 35 ns;
		
		hex <= X"55";
		
		clk <= not clk;
		wait for 35 ns;
		clk <= not clk;
		wait for 35 ns;
		
		hex <= X"00";
		
		clk <= not clk;
		wait for 35 ns;
		clk <= not clk;
		wait for 35 ns;
		
		hex <= X"89";
		
		clk <= not clk;
		wait for 35 ns;
		clk <= not clk;
		wait for 35 ns;
		-- End No Reaction
		
		-- Two Shift Keys Pressed In Tandem
		
		-- Press L-Shift

		hex <= X"12";
		
		clk <= not clk;
		wait for 35 ns;
		clk <= not clk;
		wait for 35 ns;
		
		 -- Press R-Shift
		hex <= X"59";
		
		clk <= not clk;
		wait for 35 ns;
		clk <= not clk;
		wait for 35 ns;
		
		-- Begin to let go of the key (Break)
		
		hex <= X"F0";
		
		clk <= not clk;
		wait for 35 ns;
		clk <= not clk;
		wait for 35 ns;
	
		hex <= X"59"; -- Let go of the R-Shift
		
		clk <= not clk;
		wait for 35 ns;
		clk <= not clk;
		wait for 35 ns;
		
		-- Send out 0 here
	
		-- Begin to let go of the key (Break)
		hex <= X"F0";
		
		clk <= not clk;
		wait for 35 ns;
		clk <= not clk;
		wait for 35 ns;
		
		-- Let go of the key, it is now on the up state
		
		hex <= X"12";
		
		
		clk <= not clk;
		wait for 35 ns;
		clk <= not clk;
		wait for 35 ns;
		
		hex <= X"00";
		
		clk <= not clk;
		wait for 35 ns;
		clk <= not clk;
		wait for 35 ns;
		
		clk <= not clk;
		wait for 35 ns;
		clk <= not clk;
		wait for 35 ns;
		
		
		report "Test Ended successfully" severity failure;
		
	end process;
end test_arch;