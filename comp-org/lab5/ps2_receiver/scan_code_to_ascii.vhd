library ieee;
use ieee.std_logic_1164.all;

entity scan_code_to_ascii is
	port(
		shift : in std_logic;
		scan_code : in std_logic_vector(7 downto 0);
		ascii : out std_logic_vector(7 downto 0)
		);
end scan_code_to_ascii;

architecture arch of scan_code_to_ascii is

begin
	process (scan_code, shift)
	begin
		-- E
		if(scan_code = X"24" and shift = '0') then
			ascii <= X"65";
		elsif (scan_code = X"24" and shift = '1') then
			ascii <= X"45";
		-- U
		elsif (scan_code = X"3C" and shift = '0') then
			ascii <= X"75";
		elsif (scan_code = X"3C" and shift = '1') then
			ascii <= X"55";
		-- D
		elsif (scan_code = X"23" and shift = '0') then
			ascii <= X"64";
		elsif (scan_code = X"23" and shift = '1') then
			ascii <= X"44";
			
		-- I
		elsif (scan_code = X"43" and shift = '0') then
			ascii <= X"69";
		elsif (scan_code = X"43" and shift = '1') then
			ascii <= X"49";
		
		-- S
		elsif (scan_code = X"1B" and shift = '0') then
			ascii <= X"73";
		elsif (scan_code = X"1B" and shift = '1') then
			ascii <= X"53";
			
		-- D
		elsif (scan_code = X"23" and shift = '0') then
			ascii <= X"64";
		elsif (scan_code = X"23" and shift = '1') then
			ascii <= X"44";
			
		-- U
		elsif (scan_code = X"3C" and shift = '0') then
			ascii <= X"75";
		elsif (scan_code = X"3C" and shift = '1') then
			ascii <= X"55";
			
		-- R
		elsif (scan_code = X"2D" and shift = '0') then
			ascii <= X"72";
		elsif (scan_code = X"2D" and shift = '1') then
			ascii <= X"52";
			
		-- A
		elsif (scan_code = X"1C" and shift = '0') then
			ascii <= X"61";
		elsif (scan_code = X"1C" and shift = '1') then
			ascii <= X"41";
			
		-- N
		elsif (scan_code = X"31" and shift = '0') then
			ascii <= X"6e";
		elsif (scan_code = X"31" and shift = '1') then
			ascii <= X"4e";
		end if;

	end process;

end arch;