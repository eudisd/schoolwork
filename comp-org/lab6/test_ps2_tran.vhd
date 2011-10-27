library ieee;
use ieee.std_logic_1164.all;

entity test_ps2_tran is
end test_ps2_tran;

architecture arch_test of test_ps2_tran is
	component ps2_tran
		port (clk ,reset: in std_logic;
			  ps2_data : inout std_logic;
			  ps2_clk : inout std_logic;
			  en : std_logic;
			  tran_done: out std_logic;
			  tran_idle: out std_logic;
			  din: in std_logic_vector( 7 downto 0));
	end component;
	
	signal clk: std_logic := '0';
	signal ps2_data, ps2_clk: std_logic;
	signal tran_done, tran_idle : std_logic;
	signal din: std_logic_vector(7 downto 0) := X"F4"; -- Initialization Code To Send To Mouse
	
	signal error : std_logic;
	
begin
	rec: ps2_tran port map(
				clk => clk,
				reset => '0', 
				ps2_data => ps2_data,
				ps2_clk => ps2_clk,
				en => '1',
				tran_done => tran_done, 
				tran_idle => tran_idle,
				din => din
				);
	process
	begin
		wait for 50 ns;
		clk <= not clk;
	end process;
	
	process
	begin
		
		clk <= not ps2_clk;
		wait for 50 ns;
		
		clk <= not ps2_clk;
		wait for 50 ns;
		
		clk <= not ps2_clk;
		wait for 50 ns;
		
		clk <= not ps2_clk;
		wait for 50 ns;
		
		clk <= not ps2_clk;
		wait for 50 ns;
		
		clk <= not ps2_clk;
		wait for 50 ns;
		
		clk <= not ps2_clk;
		wait for 50 ns;
		
		clk <= not ps2_clk;
		wait for 50 ns;
		
		clk <= not ps2_clk;
		wait for 50 ns;
		
		clk <= not ps2_clk;
		wait for 50 ns;
		
		clk <= not ps2_clk;
		wait for 50 ns;
		
		clk <= not ps2_clk;
		wait for 50 ns;
		
		clk <= not ps2_clk;
		wait for 50 ns;
		if ( error /= '0') then
			report "no error detected. simulation successful" severity failure;
		else
			report "error detected" severity failure;
		end if;
	end process;
end arch_test;