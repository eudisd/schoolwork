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
	
	signal myclock, myrun, myreset, mydone : std_logic;
	signal MYDIN : std_logic_vector(15 downto 0);
begin
	
	my_cpu : cpu port map(Clock => myclock,
						  Run => myrun,
						  Reset => myreset,
						  Done => mydone,
						  DIN => MYDIN
						  );
	process
	begin
		
	end process;
end test_arch;
