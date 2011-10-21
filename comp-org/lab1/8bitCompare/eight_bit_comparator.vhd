library ieee;
use ieee.std_logic_1164.all;

entity eight_bit_comparator is
port (
	InputA, InputB: in std_logic_vector(7 downto 0);
	AEqualsB    : out std_logic);
end eight_bit_comparator; 

architecture arch of eight_bit_comparator is
	 		

component one_bit_comparator
port (
	InputA, InputB: in std_logic;
	AEqualsB : out std_logic);
end component;

--we declare an internal signal because we cannot freely use our internal signals in port maps	
signal InternalAEqualsB: std_logic_vector(7 downto 0); 
	
begin 

	C1: one_bit_comparator 
		port map(InputA=>InputA(0), InputB=>InputB(0), AEqualsB=>InternalAEqualsB(0));
	C2: one_bit_comparator
		port map(InputA=>InputA(1), InputB=>InputB(1), AEqualsB=>InternalAEqualsB(1));
	C3: one_bit_comparator 
		port map(InputA=>InputA(2), InputB=>InputB(2), AEqualsB=>InternalAEqualsB(2));
	C4: one_bit_comparator
		port map(InputA=>InputA(3), InputB=>InputB(3), AEqualsB=>InternalAEqualsB(3));
	C5: one_bit_comparator 
		port map(InputA=>InputA(4), InputB=>InputB(4), AEqualsB=>InternalAEqualsB(4));
	C6: one_bit_comparator
		port map(InputA=>InputA(5), InputB=>InputB(5), AEqualsB=>InternalAEqualsB(5));
	C7: one_bit_comparator 
		port map(InputA=>InputA(6), InputB=>InputB(6), AEqualsB=>InternalAEqualsB(6));
	C8: one_bit_comparator
		port map(InputA=>InputA(7), InputB=>InputB(7), AEqualsB=>InternalAEqualsB(7));

	AEqualsB <= InternalAEqualsB(0) and InternalAEqualsB(1) and 
			InternalAEqualsB(2) and InternalAEqualsB(3) and 
			InternalAEqualsB(4) and InternalAEqualsB(5) and 
			InternalAEqualsB(6) and InternalAEqualsB(7); 

end arch; 
