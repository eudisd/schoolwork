library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
entity mux_gate is
port (
I0 : in STD_LOGIC;
I1 : in STD_LOGIC;
I2 : in STD_LOGIC;
I3 : in STD_LOGIC;
Sel : in STD_LOGIC_VECTOR(1 downto 0);
Output: out STD_LOGIC
);
end mux_gate;
architecture behav of mux_gate is begin
with Sel select
Output <=
I0 when "00",
I1 when "01",
I2 when "10",
I3 when "11";
end behav;