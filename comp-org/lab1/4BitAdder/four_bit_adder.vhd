library ieee;
use ieee.std_logic_1164.all;
entity Four_Bit_Adder is
	port( I0,I1 : in STD_LOGIC_VECTOR(3 downto 0);
		  Cin : in STD_LOGIC;
		  S : out STD_LOGIC_VECTOR(3 downto 0);
		  Cout : out STD_LOGIC);
end Four_Bit_Adder;

architecture arch of Four_Bit_Adder is
	component Full_Adder
		port( A, B,Cin: in std_logic;
			  S, Cout : out std_logic);
	end component ;

	signal TempCout: STD_LOGIC_VECTOR(2 downto 0);

begin
	FA1: Full_Adder port map ( A => I0(0), B => I1(0), Cin => Cin, S => S(0), Cout => TempCout(0) );

	FA2: Full_Adder port map ( A => I0(1), B => I1(1), Cin => TempCout(0), S => S(1), Cout => TempCout(1));

	FA3: Full_Adder port map ( A => I0(2), B => I1(2), Cin => TempCout(1), S => S(2), Cout => TempCout(2));

	FA4: Full_Adder port map ( A => I0(3), B => I1(3), Cin => TempCout(2), S => S(3), Cout => Cout);
	
End arch;