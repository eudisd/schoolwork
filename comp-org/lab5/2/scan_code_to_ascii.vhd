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
		if(scan_code = "00100100" and shift = '0') then
			ascii <= X"65";
		elsif (scan_code = "00100100" and shift = '1') then
			ascii <= X"45";
		-- U
		elsif (scan_code = "00111100" and shift = '0') then
			ascii <= X"75";
		elsif (scan_code = "00111100" and shift = '1') then
			ascii <= X"55";
		-- D
		elsif (scan_code = "00100011" and shift = '0') then
			ascii <= X"64";
		elsif (scan_code = "00100011" and shift = '1') then
			ascii <= X"44";
			
		-- I
		elsif (scan_code = "01000011" and shift = '0') then
			ascii <= X"69";
		elsif (scan_code = "01000011" and shift = '1') then
			ascii <= X"49";
		
		-- S
		elsif (scan_code = "00011011" and shift = '0') then
			ascii <= X"73";
		elsif (scan_code = "00011011" and shift = '1') then
			ascii <= X"53";
			
		-- D
		elsif (scan_code = "00100011" and shift = '0') then
			ascii <= X"64";
		elsif (scan_code = "00100011" and shift = '1') then
			ascii <= X"44";
			
		-- U
		elsif (scan_code = "00111100" and shift = '0') then
			ascii <= X"75";
		elsif (scan_code = "00111100" and shift = '1') then
			ascii <= X"55";
			
		-- R
		elsif (scan_code = "00101101" and shift = '0') then
			ascii <= X"72";
		elsif (scan_code = "00101101" and shift = '1') then
			ascii <= X"52";
			
		-- A
		elsif (scan_code = "00011100" and shift = '0') then
			ascii <= X"61";
		elsif (scan_code = "00011100" and shift = '1') then
			ascii <= X"41";
			
		-- N
		elsif (scan_code = "00110001" and shift = '0') then
			ascii <= X"6e";
		elsif (scan_code = "00110001" and shift = '1') then
			ascii <= X"4e";
			
		end if;
	end process;

end arch;