library ieee;
use ieee.std_logic_1164.all;

entity IR is
	port(Clock : in std_logic;
		 IR_in : in std_logic;
		 DIN_in : in std_logic_vector(8 downto 0);
		 DIN_out : out std_logic_vector(8 downto 0));
end IR;

architecture IR_arch of IR is
begin

end IR_arch;