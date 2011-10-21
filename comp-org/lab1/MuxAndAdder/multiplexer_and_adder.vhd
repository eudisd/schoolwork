library ieee;
use ieee.std_logic_1164.all;

entity Multiplexer_4_to_1_four_bit is
port ( I0, I1, I2, I3 : in std_logic_vector(3 downto 0);
	   S : in std_logic_vector(1 downto 0);
	   Output : out std_logic_vector(3 downto 0));
end Multiplexer_4_to_1_four_bit;

architecture behav of Multiplexer_4_to_1_four_bit is
begin
	process (S)
	begin
		If (S(1) = '0' and S(0) = '0') then
			Output <= I0;
		elsif(S(1) = '0' and S(0) = '1') then
			Output <= I1;
		elsif(S(1) = '1' and S(0) = '0') then
			Output <= I2;
		elsif(S(1) = '1' and S(0) = '1') then
			Output <= I3;
		end if;
	end process;
end behav;

library ieee;
use ieee.std_logic_1164.all;

entity Multiplexer_and_Adder is
	port (A0, A1, A2, A3, B0, B1, B2, B3: in std_logic_vector(3 downto 0);
		  SA, SB : in std_logic_vector(1 downto 0);
		  S : out std_logic_vector(3 downto 0);
		  Cout : out std_logic);
end Multiplexer_and_Adder;

architecture arch of Multiplexer_and_Adder is
	component Multiplexer_4_to_1_four_bit
		port ( I0, I1, I2, I3 : in std_logic_vector(3 downto 0);
			   S : in std_logic_vector(1 downto 0);
		       Output : out std_logic_vector(3 downto 0));
	end component;
	component Four_Bit_Adder
		port (I0, I1 : in std_logic_vector(3 downto 0);
			  Cin : in std_logic;
			  S : out std_logic_vector(3 downto 0);
			  Cout : out std_logic);
	end component;
	signal AdderInput0, AdderInput1 : std_logic_vector(3 downto 0);
begin
	Mux1: Multiplexer_4_to_1_four_bit port map (
		I0 => A0,
		I1 => A1,
		I2 => A2,
		I3 => A3,
		S => SA,
		Output => AdderInput0);
	Mux2: Multiplexer_4_to_1_four_bit port map (
		I0 => B0,
		I1 => B1,
		I2 => B2,
		I3 => B3,
		S => SB,
		Output => AdderInput1);
		
	FA: Four_Bit_Adder port map(
		I0 => AdderInput0, 
		I1 => AdderInput1,
		Cin => '0',
		S => S,
		Cout => Cout);
end arch;
