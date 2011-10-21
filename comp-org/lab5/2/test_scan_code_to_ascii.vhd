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
	
begin
	scan : scan_code_to_ascii port map(
		shift => shift,
		scan_code => scan_code,
		ascii => ascii
	);
	
	process 
	begin
	
	-- E
	shift <= '0';
	scan_code <= X"24";
	wait for 100 us;
	
	-- U
	shift <= '0';
	scan_code <= X"3C";
	wait for 100 us;
	
	-- D
	shift <= '0';
	scan_code <= X"23";
	wait for 100 us;
	
	-- I
	shift <= '0';
	scan_code <= X"43";
	wait for 100 us;
	
	-- S
	shift <= '0';
	scan_code <= X"1B";
	wait for 100 us;
	
	-- D
	shift <= '0';
	scan_code <= X"23";
	wait for 100 us;
	
	-- U
	shift <= '0';
	scan_code <= X"3C";
	wait for 100 us;
	
	-- R
	shift <= '0';
	scan_code <= X"2D";
	wait for 100 us;
	
	-- A
	shift <= '0';
	scan_code <= X"1C";
	wait for 100 us;
	
	-- N
	shift <= '0';
	scan_code <= X"31";
	wait for 100 us;
	
	report "Test Finished Successfully" severity failure;
	
	end process;


end test_arch;