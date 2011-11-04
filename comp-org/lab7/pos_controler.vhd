library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity Pos_Controler is
	port
	(
	L, R, U, D, Move, Reset: in std_logic;
	Init_X, Init_Y: out std_logic_vector(9 downto 0)
	);
end Pos_Controler;

architecture arch of Pos_Controler is
	signal x, y: unsigned(9 downto 0):= "0011001000";
begin
	Init_X <= std_logic_vector(x);
	Init_Y <= std_logic_vector(Y);
	Process(Move, reset)
	begin
		--Enter your code here
	end process;
end arch;