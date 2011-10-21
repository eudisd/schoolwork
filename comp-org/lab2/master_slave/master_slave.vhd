library ieee;
use ieee.std_logic_1164.all;

entity master_slave is
	port ( Clock, D: in std_logic;
		   Q, QNot : inout std_logic);
end master_slave;


architecture arch of master_slave is
	component d_latch
		port( C, D : in std_logic;
		      Q, QNot : inout std_logic);
	end component;
	
	signal QtoD : std_logic;
begin

	master : d_latch port map(
		C => Clock,
		D => D,
		Q => QtoD
	);
	slave : d_latch port map(
		C => Clock,
	    D => QtoD,
		Q => Q,
		QNot => QNot
	);
	
	
	
end arch;