library ieee;
use ieee.std_logic_1164.all;

entity test_control_unit is
end test_control_unit;

architecture test_arch of test_control_unit is

component control_unit 
	port( Run : in std_logic;
	      Reset : in std_logic;
		  Clock : in std_logic;
		  IR : in std_logic_vector(8 downto 0);  -- 9 bits
		  
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

	signal Run : in std_logic;
	signal Reset : in std_logic;
	signal Clock : in std_logic;
	signal IR : in std_logic_vector(8 downto 0);  -- 9 bits
		  
	signal IR_in : out std_logic;
	signal R_out : out std_logic_vector(7 downto 0);
	signal G_out : out std_logic;
	signal DIN_out : out std_logic;
	signal R_in : out std_logic_vector(7 downto 0);
	signal A_in : out std_logic;
	signal G_in : out std_logic;
	signal AddSub : out std_logic;
	signal Done : out std_logic;
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

end test_arch;

