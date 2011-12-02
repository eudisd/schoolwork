library ieee;
use ieee.std_logic_1164.all;

entity master_slave is
	port ( clock, d: in std_logic;
		   q, qnot : inout std_logic);
end master_slave;


architecture arch of master_slave is
	component d_latch
		port( c, d : in std_logic;
		      q, qnot : inout std_logic);
	end component;
	
	signal qtod : std_logic;
	
begin
	
	master : d_latch port map(
		c => clock,
		d => d,
		q => qtod
	);
	slave : d_latch port map(
		c => clock,
	    d => qtod,
		q => q,
		qnot => qnot
	);
	
	
	
end arch;