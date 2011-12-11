library ieee;
use ieee.std_logic_1164.all;

entity test_cpu is
end test_cpu;

architecture test_arch of test_cpu is
	component cpu 
	port( Clock, Run, Reset : in std_logic;
		  DIN : in std_logic_vector(15 downto 0);
		  cpu_bus : inout std_logic_vector(15 downto 0);
		  Done : out std_logic;
		  display: out std_logic_vector(55 downto 0) 
 		  );
	end component;
	
	signal clock, run, reset, done : std_logic;
	signal display : std_logic_vector(55 downto 0);
	signal DIN : std_logic_vector(15 downto 0);
begin
	
	my_cpu : cpu port map(Clock => clock,
						  Run => run,
						  Reset => reset,
						  Done => done,
						  DIN => DIN,
						  display => display
						  );
	process
	begin
		run <= '1';
		reset <= '0';
		clock <= '0';
		-- Movi test (movi R0, 1)
		DIN <= "0010000000000001";
		
		wait for 100 ns;
		
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		 
		-- Mov test  (mov R1, R0)
		DIN <= "0000010000000000";
		
		wait for 100 ns;
		
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		
		
		-- add  (add R0, R1)
		DIN <= "0100000010000000";
		
		wait for 100 ns;
		
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		
		
		-- Sub test  (sub R0, R1)
		DIN <= "0110000000000000";
		
		wait for 100 ns;
		
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		clock <= not clock;
		wait for 50 ns;
		
		report "Test successful!" severity failure;
		
	end process;
end test_arch;
