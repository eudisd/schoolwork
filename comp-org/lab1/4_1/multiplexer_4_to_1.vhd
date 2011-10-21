Library ieee;
Use ieee.std_logic_1164.all;
Entity Multiplexer_4_to_1 is
Port
(
i0, i1, i2, i3: in std_logic;
s0, s1: in std_logic;
output : out std_logic
);
End Multiplexer_4_to_1;
Architecture arch of Multiplexer_4_to_1 is
begin
output <= --your code goes here
End arch;