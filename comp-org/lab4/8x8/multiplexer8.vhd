library ieee;
use ieee.std_logic_1164.all;

entity multiplexer8 is
		port ( i7: in std_logic_vector(7 downto 0);
			   i6: in std_logic_vector(7 downto 0);
			   i5: in std_logic_vector(7 downto 0);
			   i4: in std_logic_vector(7 downto 0);
			   i3: in std_logic_vector(7 downto 0);
			   i2: in std_logic_vector(7 downto 0);
			   i1: in std_logic_vector(7 downto 0);
			   i0: in std_logic_vector(7 downto 0);
			   s: in std_logic_vector(2 downto 0);
			   o: out std_logic_vector(7 downto 0));
end multiplexer8;

architecture arch of multiplexer8 is
begin
	process (s, i0, i1, i2, i3, i4, i5, i6, i7)
	begin
		if( (s(2) = '0') and (s(1) = '0') and (s(0) = '0')) then
			o <= i0;
		elsif ( (s(2) = '0') and (s(1) = '0') and (s(0) = '1')) then 
			o <= i1;
		elsif ( (s(2) = '0') and (s(1) = '1') and (s(0) = '0')) then
			o <= i2;
		elsif ( (s(2) = '0') and (s(1) = '1') and (s(0) = '1')) then
			o <= i3;
		elsif ( (s(2) = '1') and (s(1) = '0') and (s(0) = '0')) then 
			o <= i4;
		elsif ( (s(2) = '1') and (s(1) = '0') and (s(0) = '1')) then
			o <= i5;
		elsif ( (s(2) = '1') and (s(1) = '1') and (s(0) = '0')) then
			o <= i6;
		elsif ( (s(2) = '1') and (s(1) = '1') and (s(0) = '1')) then
			o <= i7;
		end if;
	end process;
end arch;