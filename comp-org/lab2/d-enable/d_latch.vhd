library ieee;
use ieee.std_logic_1164.all;

entity d_latch is
	port ( C, D : in std_logic;
		   Q, QNot : inout std_logic);
end d_latch;


architecture arch of d_latch is
begin
	Q <= (D nand C) nand QNot;
	QNot <= ( (not D) nand C ) nand Q;
end arch;