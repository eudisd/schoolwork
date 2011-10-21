library ieee;
use ieee.std_logic_1164.all;

entity decoder is
	port (i: in std_logic_vector(2 downto 0);
		  o: out std_logic_vector(7 downto 0));
end decoder;

architecture arch of decoder is
begin
	process (i)
	begin
		if(i = "000") then
			o <= "00000001";
		elsif (i = "001") then
			o <= "00000010";
		elsif (i = "010") then
			o <= "00000100";
		elsif (i = "011") then
			o <= "00001000";
		elsif (i = "100") then
			o <= "00010000";
		elsif (i = "101") then
			o <= "00100000";
		elsif (i = "110") then
			o <= "01000000";
		elsif (i = "111") then
			o <= "10000000";
		end if;
	end process;
end arch;