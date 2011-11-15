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
	
	variable disp : integer := 4;
	
	begin
		if (Move = '1') then
			if(L = '1' and R = '0' and U = '0' and D = '0') then
				x <= x - disp;
			elsif(L = '0' and R = '1' and U = '0' and D = '0') then
				x <= x + disp;
			elsif(L = '0' and R = '0' and U = '1' and D = '0') then
				y <= y - disp;
			elsif(L = '0' and R = '0' and U = '0' and D = '1') then
				y <= y + disp;
				
			elsif(L = '1' and R = '0' and U = '1' and D = '0') then
				x <= x - disp;
				y <= y - disp;
				
			elsif(L = '1' and R = '1' and U = '0' and D = '1') then
				x <= x - disp;
				y <= y + disp;
				
			elsif(L = '0' and R = '1' and U = '1' and D = '0') then
				x <= x + disp;
				y <= y - disp;
				
			elsif(L = '0' and R = '1' and U = '0' and D = '1') then
				x <= x + disp;
				y <= y + disp;
				
			end if;
		end if;
	end process;
end arch;