library ieee;
use ieee.std_logic_1164.all;

entity multiplexer4 is
		port ( i3: in std_logic_vector(3 downto 0);
			   i2: in std_logic_vector(3 downto 0);
			   i1: in std_logic_vector(3 downto 0);
			   i0: in std_logic_vector(3 downto 0);
			   s: in std_logic_vector(1 downto 0);
			   o: out std_logic_vector(3 downto 0));
end multiplexer4;

architecture arch of multiplexer4 is
begin
	process (s, i0, i1, i2, i3)
	begin
		if( (s(0) = '0') and (s(1) = '0')) then
			o <= i0;
		elsif ( (s(0) = '1') and (s(1) = '0')) then 
			o <= i1;
		elsif ( (s(0) = '0') and (s(1) = '1')) then
			o <= i2;
		elsif ( (s(0) = '1') and (s(1) = '1') ) then
			o <= i3;
		end if;
	end process;
end arch;