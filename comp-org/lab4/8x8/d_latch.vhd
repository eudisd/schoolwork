library ieee;
use ieee.std_logic_1164.all;

entity d_latch is
	port ( c, d : in std_logic;
		   q, qnot : inout std_logic);
end d_latch;


architecture arch of d_latch is
begin
	q <= (d nand c) nand qnot;
	qnot <= ( (not d) nand c ) nand q;
end arch;