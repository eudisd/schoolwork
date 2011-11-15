library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Object is
	port
	(
	Init_X, Init_Y: in std_logic_vector(9 downto 0);
	Pixel_X, Pixel_Y: in std_logic_vector(9 downto 0);
	RGB : out std_logic_vector(2 downto 0);
	Object_On: out std_logic
	);
end Object;

architecture arch of Object is
	Constant W : unsigned(9 downto 0):= "0011010000"; --208
	Constant H : unsigned(9 downto 0):= "0001000000"; --64
	signal Color : std_logic_vector(2 downto 0):= "010"; --Green (You can change this if you like)
begin
	process(Pixel_X, Pixel_Y)
	begin
		if(unsigned(Pixel_X) < W and 
		   unsigned(Pixel_X) >= unsigned(Init_X) and
	       unsigned(Pixel_Y) < H and
	       unsigned(Pixel_Y) >= unsigned(Init_Y)) then
		
			RGB <= Color;
			Object_On <= '1';
			
		end if;
	end process;
end arch;