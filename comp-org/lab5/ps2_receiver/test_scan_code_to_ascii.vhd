library ieee;
use ieee.std_logic_1164.all;

entity test_scan_code_to_ascii is

end test_scan_code_to_ascii;

architecture test_arch of test_scan_code_to_ascii is
	component scan_code_to_ascii
		port(
		shift : in std_logic;
		scan_code : in std_logic_vector(7 downto 0);
		ascii : out std_logic_vector(7 downto 0)
		);
	end component;
	
	signal shift : std_logic;
	signal scan_code : std_logic_vector(7 downto 0);
	signal ascii : std_logic_vector(7 downto 0);
	
	signal error : std_logic := '0';
	
begin
	scan : scan_code_to_ascii port map(
		shift => shift,
		scan_code => scan_code,
		ascii => ascii
	);
	
	process 
	begin
	
	-- e
	shift <= '0';
	scan_code <= X"24";
	wait for 100 us;
	
	if( ascii /= X"65") then
		error <= '1';
	end if;
	
	-- u
	shift <= '0';
	scan_code <= X"3C";
	wait for 100 us;
	
	if( ascii /= X"75") then
		error <= '1';
	end if;
	
	-- d
	shift <= '0';
	scan_code <= X"23";
	wait for 100 us;
	
	if( ascii /= X"64") then
		error <= '1';
	end if;
	
	-- i
	shift <= '0';
	scan_code <= X"43";
	wait for 100 us;
	
	if( ascii /= X"69") then
		error <= '1';
	end if;
	
	-- s
	shift <= '0';
	scan_code <= X"1B";
	wait for 100 us;
	
	if( ascii /= X"73") then
		error <= '1';
	end if;
	
	-- d
	shift <= '0';
	scan_code <= X"23";
	wait for 100 us;
	
	if( ascii /= X"64") then
		error <= '1';
	end if;
	
	-- u
	shift <= '0';
	scan_code <= X"3C";
	wait for 100 us;
	
	if( ascii /= X"75") then
		error <= '1';
	end if;
	
	-- r
	shift <= '0';
	scan_code <= X"2D";
	wait for 100 us;
	
	if( ascii /= X"72") then
		error <= '1';
	end if;
	
	-- a
	shift <= '0';
	scan_code <= X"1C";
	wait for 100 us;
	
	if( ascii /= X"61") then
		error <= '1';
	end if;
	
	-- n
	shift <= '0';
	scan_code <= X"31";
	wait for 100 us;
	
	if( ascii /= X"6E") then
		error <= '1';
	end if;
	
	-- Upper Case
	
	-- E
	shift <= '1';
	scan_code <= X"24";
	wait for 100 us;
	
	if( ascii /= X"45") then
		error <= '1';
	end if;
	
	-- U
	shift <= '1';
	scan_code <= X"3C";
	wait for 100 us;
	
	if( ascii /= X"55") then
		error <= '1';
	end if;
	
	-- D
	shift <= '1';
	scan_code <= X"23";
	wait for 100 us;
	
	if( ascii /= X"44") then
		error <= '1';
	end if;
	
	-- I
	shift <= '1';
	scan_code <= X"43";
	wait for 100 us;
	
	if( ascii /= X"49") then
		error <= '1';
	end if;
	
	-- S
	shift <= '1';
	scan_code <= X"1B";
	wait for 100 us;
	
	if( ascii /= X"53") then
		error <= '1';
	end if;
	
	-- D
	shift <= '1';
	scan_code <= X"23";
	wait for 100 us;
	
	if( ascii /= X"44") then
		error <= '1';
	end if;
	
	-- U
	shift <= '1';
	scan_code <= X"3C";
	wait for 100 us;
	
	if( ascii /= X"55") then
		error <= '1';
	end if;
	
	-- R
	shift <= '1';
	scan_code <= X"2D";
	wait for 100 us;
	
	if( ascii /= X"52") then
		error <= '1';
	end if;
	
	-- A
	shift <= '1';
	scan_code <= X"1C";
	wait for 100 us;
	
	if( ascii /= X"41") then
		error <= '1';
	end if;
	
	-- N
	shift <= '1';
	scan_code <= X"31";
	wait for 100 us;
	
	if( ascii /= X"4E") then
		error <= '1';
	end if;
	
	
	
	if(error = '0') then
		report "Success: all values matched" severity failure;
	else
		report "ERROR: ascii converter not working!" severity failure;
	end if;
	
	end process;


end test_arch;