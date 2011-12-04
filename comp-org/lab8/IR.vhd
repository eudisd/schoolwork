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
	process(Clock)
	begin
		if(rising_edge(Clock)) then
			if(IR_in = '1') then
				DIN_out <= DIN_in;
			else
				DIN_out <= "UUUUUUUUU";
			end if;
		end if;
	end process;
end IR_arch;