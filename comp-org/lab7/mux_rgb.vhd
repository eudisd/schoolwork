library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity Mux_RGB is
	port
	(
	Object_1_On, Video_On: in std_logic;
	Backgroun_RGB, Object_1_RGB : in std_logic_vector(2 downto 0);
	RGB : out std_logic_vector(2 downto 0)
	);
end Mux_RGB;

architecture arch of Mux_RGB is
	signal r : std_logic_vector(2 downto 0);
begin
	--Enter your code here
	process(Object_1_On, Video_On)
	begin
		if(Video_On = '1') then
			if(Object_1_On = '1') then
				RGB <= Object_1_RGB;
			else
				RGB <= Backgroun_RGB;
			end if;
		else 
			RGB <= "000";
		end if;
	end process;
end arch;