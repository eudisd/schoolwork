library ieee;
use ieee.std_logic_1164.all;

entity decoder is
	port (i: in std_logic_vector(1 downto 0);
		  o: out std_logic_vector(3 downto 0));
end decoder;

architecture arch of decoder is
begin
	with i select 
	o <= "0001" when "00", 
	     "0010" when "01", 
		 "0100" when "10", 
		 "1000" when "11", 
		 "0000" when others; 
end arch;