library ieee;
use ieee.std_logic_1164.all;

entity sr_c_latch is
	port ( C, S, R : in std_logic;
		   Q, NotQ : inout std_logic);
end sr_c_latch;

architecture arch of sr_c_latch is
begin
	Q <= ( S nand C ) nand NotQ ;
	NotQ <= ( R nand C ) nand Q ;
end arch;