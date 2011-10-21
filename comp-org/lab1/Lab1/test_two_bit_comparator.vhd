Library ieee;

use ieee.std_logic_1164.all;

Entity test_two_bit_comparator is
End test_two_bit_comparator; 

Architecture arch of test_two_bit_comparator is

component two_bit_comparator
Port (
	InputA, InputB: in std_logic_vector(1 downto 0);
	AEqualsB    : out std_logic);
End component; 


procedure test_values(
	signal in0, in1 : out std_logic_vector(1 downto 0);
	signal result : in std_logic;
	testValue0, testValue1 : in std_logic_vector(1 downto 0);
	expectedResult : in std_logic)
is begin
	in0 <= testValue0;
	in1 <= testValue1; 

	wait for 25 ns;

	if (not (result = expectedResult)) then
		report "TEST FAILED! Simulation halted" severity failure;
	end if;
	wait for 25 ns;
end procedure test_values;  

Signal p0, p1 :std_logic_vector(1 downto 0);
signal pout : std_logic;

begin
  
my_comparator : two_bit_comparator port map(InputA => p0, InputB => p1, AEqualsB => pout); 


test_process : process begin
	test_values(p0, p1, pout, "00", "00", '1');
	test_values(p0, p1, pout, "00", "01", '0');
	test_values(p0, p1, pout, "00", "10", '0');
	test_values(p0, p1, pout, "00", "11", '0');      

	test_values(p0, p1, pout, "01", "00", '0');
	test_values(p0, p1, pout, "01", "01", '1');
	test_values(p0, p1, pout, "01", "10", '0');
	test_values(p0, p1, pout, "01", "11", '0');      
	
	test_values(p0, p1, pout, "10", "00", '0');
	test_values(p0, p1, pout, "10", "01", '0');
	test_values(p0, p1, pout, "10", "10", '1');
	test_values(p0, p1, pout, "10", "11", '0');      

	test_values(p0, p1, pout, "11", "00", '0');
	test_values(p0, p1, pout, "11", "01", '0');
	test_values(p0, p1, pout, "11", "10", '0');
	test_values(p0, p1, pout, "11", "11", '1');      
	
	report "NONE. TEST SUCCESSFUL! End of simulation." severity failure;
end process test_process;
  
End arch;

