library ieee;
use ieee.std_logic_1164.all;

entity test_multiplexer_and_adder is 
end test_multiplexer_and_adder;

architecture arch of test_multiplexer_and_adder is
	component Multiplexer_and_Adder 
		port (A0, A1, A2, A3, B0, B1, B2, B3: in std_logic_vector(3 downto 0);
			  SA, SB : in std_logic_vector(1 downto 0);
			  S : out std_logic_vector(3 downto 0);
			  Cout : out std_logic);
	end component;
	
	signal A0, A1, A2, A3, B0, B1, B2, B3: std_logic_vector(3 downto 0);
	signal SA, SB : std_logic_vector(1 downto 0);
	signal S : std_logic_vector(3 downto 0);
	signal Cout : std_logic;
	signal error : std_logic;
	
begin

	my_mux_and_adder : Multiplexer_and_Adder port map (
		A0 => A0,
		A1 => A1,
		A2 => A2,
		A3 => A3,
		B0 => B0,
		B1 => B1,
		B2 => B2,
		B3 => B3,
		SA => SA,
		SB => SB,
		S => S,
		Cout => Cout
	);
		
	process 
	begin 
				-- Set some test cases here
			
				SA <= "00";
				SB <= "00";
				
				A0 <= "0000";
				B0 <= "0001";
				wait for 25 ns;
				if ( S /= "0001" and Cout /= '0' ) then
					error <= '1';
				end if;
				
				-- Test 2
				SA <= "00";
				SB <= "01";
				
				A0 <= "0001";
				B1 <= "0001";
				
				wait for 25 ns;
				
				if ( S /= "0001" and Cout /= '0' ) then
					error <= '1';
				end if;
				
				
				
				
		wait for 25 ns;
		if (error = '1') then
			report "TEST FAILED! Simulation halted" severity failure;
		end if;
		
		report "NONE. TEST SUCCESSFUL! End of simulation." severity failure;
	end process;

end arch;