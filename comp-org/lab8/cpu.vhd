library ieee;
use ieee.std_logic_1164.all;

entity cpu is
	port( Clock, Run, Reset : in std_logic;
		  DIN : in std_logic_vector(15 downto 0);
		  Bus : out std_logic_vector(15 downto 0);
		  Done : out std_logic
 		  );
end cpu;


architecture cpu_arch of cpu is

begin

end cpu_arch;
