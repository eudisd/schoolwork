LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Test_Multiplexer_4_to_1 is
end Test_Multiplexer_4_to_1 ;
architecture arch of Test_Multiplexer_4_to_1 is
Component Multiplexer_4_to_1
port (
I0, I1, I2, I3 : STD_LOGIC;
S0, S1 : STD_LOGIC;
Output : out STD_LOGIC
);
end Component;
procedure test_mux(
signal s0, s1: out std_logic;
signal result: in std_logic;
test_s0, test_s1, expectedResult: in std_logic)
is begin
--we assign our test values to the signals that are connected
--to our mux
s0 <= test_s0;
s1 <= test_s1;
wait for 25 ns;
if (not (result = expectedResult)) then
--if it doesn't, we halt with an appropriate message
report "TEST FAILED! Simulation halted" severity failure;
end if;

wait for 25 ns;
end procedure test_mux;
Signal I0, I1, I2, I3, Output : STD_LOGIC;
Signal S : STD_LOGIC_VECTOR(1 Downto 0);
Signal error : std_logic := '0';
begin
mux: Multiplexer_4_to_1 Port map (
I0 => I0,
I1 => I1,
I2 => I2,
I3 => I3,
S0 => S(0),
S1 => S(1),
Output => Output
);
process begin
--we start by setting our mux data inputs to some sample values
wait for 50 ns;
I0 <= '1';
I1 <= '0';
I2 <= '1';
I3 <= '0';
--then we cycle through each possible selection and make sure
--the selected output is the expected value
test_mux(s(0), s(1), Output, '0', '0', '1');
test_mux(s(0), s(1), Output, '1', '0', '0');
test_mux(s(0), s(1), Output, '0', '1', '1');
test_mux(s(0), s(1), Output, '1', '1', '0');
report "NONE. TEST SUCCESSFUL! End of simulation." severity failure;
end process;
end arch;