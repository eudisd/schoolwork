library ieee;
use ieee.std_logic_1164.all;

entity two_bit_adder is
	port (
		A0, A1, B0, B1 : in std_logic;
		Cin : in std_logic;
		S0, S1 : out std_logic;
		Cout : out std_logic
	);
end two_bit_adder;

architecture arch of two_bit_adder is
	component Full_Adder
		port (
			A, B, Cin : in std_logic;
			S, Cout : out std_logic
		);
	end component;

	signal TempCout: std_logic;

begin
	FA1: Full_Adder port map (
		A => A0,
		B => B0,
		Cin => Cin,
		S => S0,
		Cout => TempCout
	);

	FA2: Full_Adder port map (
		B => B1,
		A => A1,
		Cin => TempCout,
		S => S1,
		Cout => Cout
	);
End arch;