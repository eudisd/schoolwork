library ieee;
use ieee.std_logic_1164.all;

entity test_control_unit is
end test_control_unit;

architecture test_arch of test_control_unit is

component control_unit 
	port( Run : in std_logic;
	      Reset : in std_logic;
		  Clock : in std_logic;
		  IR : in std_logic_vector(8 downto 0);  
		  
		  IR_in : out std_logic;
		  R_out : out std_logic_vector(7 downto 0);
		  G_out : out std_logic;
		  DIN_out : out std_logic;
		  R_in : out std_logic_vector(7 downto 0);
		  A_in : out std_logic;
		  G_in : out std_logic;
		  AddSub : out std_logic;
		  Done : out std_logic
	);
end component;

	signal error : std_logic := '0';
	
	signal Run : std_logic;
	signal Reset : std_logic;
	signal Clock : std_logic;
	signal IR : std_logic_vector(8 downto 0); 
	signal IR_in : std_logic;
	signal R_out : std_logic_vector(7 downto 0);
	signal G_out : std_logic;
	signal DIN_out : std_logic;
	signal R_in : std_logic_vector(7 downto 0);
	signal A_in : std_logic;
	signal G_in : std_logic;
	signal AddSub : std_logic;
	signal Done : std_logic;
begin
	cu : control_unit port map(Run => Run,
							   Reset => Reset,
							   Clock => Clock,
							   IR => IR,
							   IR_in => IR_in,
							   R_out => R_out,
							   G_out => G_out,
							   DIN_out => DIN_out,
							   R_in => R_in,
							   A_in => A_in, 
							   AddSub => AddSub,
							   Done => Done);
							 
	process
	begin
		-- mov
		IR <= "000000000";
		IR_in <= '1';
		
		-- movi
		IR <= "001000000";
		IR_in <= '1';
		
		-- add
		IR <= "010000000";
		IR_in <= '1';
		
		-- sub
		IR <= "011000000";
		IR_in <= '1';
		
		
		if (signal = '1') then
			report "FAILURE" severity failure;
		elsif (signal = '0') then
			report "SUCCESS" severity failure;
		end if;
		
	end process;

end test_arch;

