library ieee;
use ieee.std_logic_1164.all;

entity control_unit is
	port( Run : in std_logic;
	      Reset : in std_logic;
		  Clock : in std_logic;
		  IR : in std_logic_vector(8 downto 0);  -- 9 bits
		  
		  IR_in : out : std_logic;
		  R_out : out std_logic_vector(7 downto 0);
		  G_out : out std_logic;
		  DIN_out : out std_logic;
		  R_in : out std_logic_vector(7 downto 0);
		  A_in : out std_logic;
		  G_in : out std_logic;
		  AddSub : out std_logic;
		  Dont : out std_logic;
	);
end control_unit;

architecture control_arch of control_unit is

begin

end contro_arch;
