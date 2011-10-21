library ieee;
use ieee.std_logic_1164.all;
entity Full_Adder is
port (
A, B,Cin: in std_logic;
S,Cout : out std_logic
);
end Full_Adder;

architecture arch of Full_Adder is
begin
S <= (A XOR B) XOR Cin;
Cout <= ((A AND B) OR ((A XOR B) AND Cin));
end arch;