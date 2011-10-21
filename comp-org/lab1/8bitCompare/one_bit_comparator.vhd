library ieee;
use ieee.std_logic_1164.all;

--these lines are an entity declaration statement
--entity declarations define the input and output signals of a circuit
--each signal is specified as in, out or inout, which correspond to
--inputs, outputs, and birectional signals to the circuit
entity one_bit_comparator is
	port (
	InputA, InputB: in std_logic;
	AEqualsB : out std_logic);
end one_bit_comparator;

--these lines are the architecture statements
--the architecture describes the functionality of the circuit
architecture arch of one_bit_comparator is

--these are internal signal declarations
--internal signals are not visible outside the circuit, but are used internally
--to implement functionality
--we will use these to store the first and second products of our
--expression Input0.Input1 + Input0’.Input1’
signal p0, p1 : std_logic;

--the main functionality description for our comparator is between these 'begin'
--and 'end' keywords
--each line contains a statement that is executed concurrently
begin
	AEqualsB <= p0 or p1;
	p0 <= (not InputA) and (not InputB);
	p1 <= InputA and InputB;
end arch;