Library ieee;
Use ieee.std_logic_1164.all;

Entity two_bit_comparator is
Port (
	InputA, InputB: in std_logic_vector(1 downto 0);
	AEqualsB    : out std_logic);
End two_bit_comparator; 

Architecture arch of two_bit_comparator is

Signal p0, p1,p2,p3 : std_logic;
begin
	AEqualsB <= P0 or P1 or P2 or P3;
	P0 <= (Not InputA(1) and Not InputB(1)) and (Not InputA(0) and Not InputB(0)) ;
	P1 <= (Not InputA(1) and Not InputB(1)) and (InputA(0) and  InputB(0)) ;
	P2 <= (InputA(1) and InputB(1)) and (Not InputA(0) and Not InputB(0)) ;
	P3 <=(InputA(1) and  InputB(1)) and (InputA(0) and  InputB(0)) ;	
End arch;
