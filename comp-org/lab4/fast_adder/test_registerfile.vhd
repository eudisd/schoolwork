library ieee;
use ieee.std_logic_1164.all;
entity test_registerfile is
end test_registerfile;
architecture arch_test of test_registerfile is
component registerfile
port ( clock4: in std_logic;
		   w_addr: in std_logic_vector(2 downto 0);
		   datain: in std_logic_vector(7 downto 0);
		   r_addr: in std_logic_vector(2 downto 0);
		   dataout: out std_logic_vector(7 downto 0));
end component;
signal clock4: std_logic := '0';
signal w_addr, r_addr: std_logic_vector(2 downto 0);
signal datain, dataout: std_logic_vector(7 downto 0);
begin
rf: registerfile port map
(
clock4 => clock4,
w_addr => w_addr,
datain => datain,
r_addr => r_addr,
dataout => dataout
);
process
begin
wait for 50 ns;
datain <= "00000000";
w_addr <= "000";
wait for 5 ns;
clock4 <= not clock4;
wait for 50 ns;
clock4 <= not clock4;
wait for 50 ns;
datain <= "00000001";
w_addr <= "001";
wait for 5 ns;
clock4 <= not clock4;
wait for 50 ns;
clock4 <= not clock4;

wait for 50 ns;
datain <= "00000100";
w_addr <= "010";
wait for 5 ns;
clock4 <= not clock4;
wait for 50 ns;
clock4 <= not clock4;
wait for 50 ns;
datain <= "00001000";
w_addr <= "011";
wait for 5 ns;
clock4 <= not clock4;
wait for 50 ns;
clock4 <= not clock4;
wait for 50 ns;

-- New entries

datain <= "00010000";
w_addr <= "100";
wait for 5 ns;
clock4 <= not clock4;
wait for 50 ns;
clock4 <= not clock4;
wait for 50 ns;

datain <= "00100000";
w_addr <= "101";
wait for 5 ns;
clock4 <= not clock4;
wait for 50 ns;
clock4 <= not clock4;
wait for 50 ns;

datain <= "01000000";
w_addr <= "110";
wait for 5 ns;
clock4 <= not clock4;
wait for 50 ns;
clock4 <= not clock4;
wait for 50 ns;

datain <= "10000000";
w_addr <= "111";
wait for 5 ns;
clock4 <= not clock4;
wait for 50 ns;
clock4 <= not clock4;
wait for 50 ns;

-- Reading Starts
r_addr <= "000";
wait for 5 ns;
clock4 <= not clock4;
wait for 50 ns;
clock4 <= not clock4;
wait for 50 ns;
r_addr <= "001";
wait for 5 ns;
clock4 <= not clock4;
wait for 50 ns;
clock4 <= not clock4;
wait for 50 ns;
r_addr <= "010";
wait for 5 ns;
clock4 <= not clock4;
wait for 50 ns;
clock4 <= not clock4;
wait for 50 ns;
r_addr <= "011";
wait for 5 ns;
clock4 <= not clock4;
wait for 50 ns;
clock4 <= not clock4;
wait for 50 ns;

end process;
end arch_test;