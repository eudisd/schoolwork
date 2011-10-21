library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_eight_bit_comparator is
end test_eight_bit_comparator;

architecture arch_test of test_eight_bit_comparator is
	component eight_bit_comparator
		port (InputA, InputB: in std_logic_vector(7 downto 0);
		      AEqualsB : out std_logic);
	end component;

	procedure test_values(
		signal in0, in1 : out std_logic_vector(7 downto 0);
		signal result : in std_logic;
		testValue0, testValue1 : in std_logic_vector(7 downto 0);
		expectedResult : in std_logic) is
	begin
		in0 <= testValue0;
		in1 <= testValue1;

		wait for 25 ns;

		if (not (result = expectedResult)) then
			report "TEST FAILED! Simulation halted" severity failure;
		end if;
	
		wait for 25 ns;
	end procedure test_values;
	
	signal p1, p0 : std_logic_vector(7 downto 0);
	signal pout : std_logic;
	signal error : std_logic := '0';
begin

	my_comparator: eight_bit_comparator port map(InputA => p0, InputB => p1, AEqualsB => pout);
	
	process 
		variable tmpI, tmpJ : std_logic_vector(7 downto 0);
		
		begin
		
		for i in 0 to 255 loop
			for j in 0 to 255 loop
			
				tmpI := std_logic_vector(to_unsigned(i, tmpI'length));
				tmpJ := std_logic_vector(to_unsigned(j, tmpJ'length));
				
				report "I: " & integer'image(i) & " J: " & integer'image(j) severity warning;
				
				if i = j then
					test_values(p0, p1, pout, tmpI, tmpJ, '1');
				else 
					test_values(p0, p1, pout, tmpI, tmpJ, '0');
				end if;
			end loop;
		end loop;

		report "NONE. TEST SUCCESSFUL! End of simulation." severity failure;
	end process;
end arch_test;