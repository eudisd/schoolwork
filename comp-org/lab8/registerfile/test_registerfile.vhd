library ieee;
use ieee.std_logic_1164.all;
entity Test_registerfile is
end Test_registerfile;
Architecture arch_test of Test_registerfile is
Component registerfile
port (
clock4: in std_logic;
W_Addr: in std_logic_vector(1 downto 0);
DataIn: in std_logic_vector(3 downto 0);
R_Addr_A: in std_logic_vector(1 downto 0);
R_Addr_B: in std_logic_vector(1 downto 0);
DataOutA: out std_logic_vector(3 downto 0);
DataOutB: out std_logic_vector(3 downto 0)
);
end Component;
Signal clock4: std_logic := '0';
Signal W_Addr, R_Addr_A, R_Addr_B: std_logic_vector(1 downto 0);
Signal DataIn, DataOutA, DataOutB: std_logic_vector(3 downto 0);
begin
rf: registerfile port map
(
clock4 => clock4,
W_Addr => W_Addr,
DataIn => DataIn,
R_Addr_A => R_Addr_A,
R_Addr_B => R_Addr_B,
DataOutA => DataOutA,
DataOutB => DataOutB
);
process
begin
wait for 50 ns;
DataIn <= "0001";
W_Addr <= "00";
wait for 5 ns;
clock4 <= NOT clock4;
wait for 50 ns;
clock4 <= NOT clock4;
wait for 50 ns;
DataIn <= "0010";
W_Addr <= "01";
wait for 5 ns;
clock4 <= NOT clock4;
wait for 50 ns;
clock4 <= NOT clock4;

wait for 50 ns;
DataIn <= "0100";
W_Addr <= "10";
wait for 5 ns;
clock4 <= NOT clock4;
wait for 50 ns;
clock4 <= NOT clock4;
wait for 50 ns;
DataIn <= "1000";
W_Addr <= "11";
wait for 5 ns;
clock4 <= NOT clock4;
wait for 50 ns;
clock4 <= NOT clock4;
wait for 50 ns;
R_Addr_A <= "00";
wait for 5 ns;
clock4 <= NOT clock4;
wait for 50 ns;
clock4 <= NOT clock4;
wait for 50 ns;
R_Addr_A <= "01";
wait for 5 ns;
clock4 <= NOT clock4;
wait for 50 ns;
clock4 <= NOT clock4;
wait for 50 ns;
R_Addr_A <= "10";
wait for 5 ns;
clock4 <= NOT clock4;
wait for 50 ns;
clock4 <= NOT clock4;
wait for 50 ns;
R_Addr_A <= "11";
wait for 5 ns;
clock4 <= NOT clock4;
wait for 50 ns;
clock4 <= NOT clock4;
wait for 50 ns;
R_Addr_B <= "00";
wait for 5 ns;
clock4 <= NOT clock4;
wait for 50 ns;
clock4 <= NOT clock4;
wait for 50 ns;
R_Addr_B <= "01";
wait for 5 ns;
clock4 <= NOT clock4;
wait for 50 ns;

clock4 <= NOT clock4;
wait for 50 ns;
R_Addr_B <= "10";
wait for 5 ns;
clock4 <= NOT clock4;
wait for 50 ns;
clock4 <= NOT clock4;
wait for 50 ns;
R_Addr_B <= "11";
wait for 5 ns;
clock4 <= NOT clock4;
wait for 50 ns;
clock4 <= NOT clock4;
end process;
end arch_test;