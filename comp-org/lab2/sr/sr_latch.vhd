library ieee;
use ieee.std_logic_1164.all;

entity sr_latch is
	port( S, R : in std_logic;
		  Q, NotQ : inout std_logic );
end sr_latch;


architecture arch of sr_latch is
begin	
	Q <= (not ( R or NotQ ));
	NotQ <= (not ( S or Q ));
	
end arch;