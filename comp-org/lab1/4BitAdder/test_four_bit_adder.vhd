library ieee;
use ieee.std_logic_1164.all;

entity Test_Four_Bit_Adder is
end Test_Four_Bit_Adder;

architecture arch_test of Test_Four_Bit_Adder is
	component Four_Bit_Adder
		port( I0,I1 : in STD_LOGIC_VECTOR(3 Downto 0);
			  Cin : in STD_LOGIC;
			  S : out STD_LOGIC_VECTOR(3 Downto 0);
			  Cout : out STD_LOGIC);

	end component;

	signal I0, I1, S : STD_LOGIC_VECTOR(3 Downto 0);
	signal Cin, Cout : std_logic;
	signal error : std_logic := '0';
begin

	FA: Four_Bit_Adder port map ( I0 => I0, I1 => I1, Cin => Cin, S => S, Cout => Cout );
	
	process
	begin
		I0 <= "0000";
		I1 <= "0000";
		Cin <= '0';
		wait for 1 ns;
		if (S /= "0000" or Cout /= '0') then
			error <= '1';
		end if;
		wait for 200 ns;
		I0 <= "0010";
		I1 <= "0100";
		Cin <= '1';
		wait for 1 ns;
		if (S /= "0111" or Cout /= '0') then
			error <= '1';
		end if;
		wait for 200 ns;
		I0 <= "0100";
		I1 <= "0010";
		Cin <= '0';
		wait for 1 ns;
		if (S /= "0110" or Cout /= '0') then
			error <= '1';
		end if;
		wait for 200 ns;
		I0 <= "0001";
		I1 <= "1000";
		Cin <= '1';


		wait for 1 ns;
		if (S /= "1010" or Cout /= '0') then
			error <= '1';
		end if;
		wait for 200 ns;
		I0 <= "1110";
		I1 <= "0110";
		Cin <= '0';
		wait for 1 ns;
		if (S /= "0100" or Cout /= '1') then
			error <= '1';
		end if;
		wait for 200 ns;
		I0 <= "0001";
		I1 <= "0001";
		Cin <= '1';
		wait for 1 ns;
		if (S /= "0011" or Cout /= '0') then
			error <= '1';
		end if;
		wait for 200 ns;
		I0 <= "1111";
		I1 <= "0100";
		Cin <= '0';
		wait for 1 ns;
		if (S /= "0011" or Cout /= '1') then
			error <= '1';
		end if;
		wait for 200 ns;
		I0 <= "1111";
		I1 <= "1111";
		Cin <= '1';
		wait for 1 ns;
		if (S /= "1111" or Cout /= '1') then
			error <= '1';
		end if;
		wait for 200 ns;
		if (error = '0') then
			report "No errors detected. Simulation successful" severity failure;
		else
			report "Error detected" severity failure;
		end if;
	end process;
end arch_test;