library ieee;
use ieee.std_logic_1164.all;
entity test_ps2_rec is
	port
	(
	rec_done: out std_logic
	);
end test_ps2_rec;
architecture arch_test of test_ps2_rec is
	component ps2_rec
		port
		(
		clk ,reset: in std_logic;
		ps2data : in std_logic;
		ps2clock : in std_logic;
		rec_en : in std_logic;
		rec_done: out std_logic;
		dout: out std_logic_vector(7 downto 0)
		);
	end component;
	
	signal clk: std_logic := '0';
	signal ps2data, ps2clock: std_logic;
	signal dout: std_logic_vector(7 downto 0);
	signal data : std_logic_vector(8 downto 0) := "011010000";
begin
	rec: ps2_rec port map
				(
				clk => clk,
				reset => '0',
				ps2data => ps2data,
				ps2clock => ps2clock,
				rec_en => '1',
				rec_done => rec_done,
				dout => dout
				);
	process
	begin
		wait for 50 ns;
		clk <= not clk;
	end process;
	
	process
	begin
		ps2data <= '1';
		ps2clock <= '1';
		
		wait for 100 us;
		
		ps2data <= '0';
		ps2clock <= '1';
		
		wait for 35 us;
		
		ps2data <= '0';
		ps2clock <= '0';
		
		wait for 35 us;
		ps2clock <= not ps2clock;
		wait for 35 us;
		ps2clock <= not ps2clock;
		ps2data <= data(0);
		wait for 35 us;
		ps2clock <= not ps2clock;
		wait for 35 us;
		ps2clock <= not ps2clock;
		ps2data <= data(1);
		wait for 35 us;
		ps2clock <= not ps2clock;
		wait for 35 us;
		ps2clock <= not ps2clock;
		ps2data <= data(2);
		wait for 35 us;
		ps2clock <= not ps2clock;
		wait for 35 us;
		ps2clock <= not ps2clock;
		ps2data <= data(3);
		wait for 35 us;
		ps2clock <= not ps2clock;
		wait for 35 us;
		ps2clock <= not ps2clock;
		ps2data <= data(4);
		wait for 35 us;
		ps2clock <= not ps2clock;
		wait for 35 us;
		ps2clock <= not ps2clock;
		ps2data <= data(5);
		wait for 35 us;
		ps2clock <= not ps2clock;
		wait for 35 us;
		ps2clock <= not ps2clock;
		ps2data <= data(6);
		wait for 35 us;
		ps2clock <= not ps2clock;
		wait for 35 us;
		ps2clock <= not ps2clock;
		ps2data <= data(7);
		wait for 35 us;
		ps2clock <= not ps2clock;
		wait for 35 us;
		ps2clock <= not ps2clock;
		ps2data <= data(8);
		wait for 35 us;
		ps2clock <= not ps2clock;
		wait for 35 us;
		ps2clock <= not ps2clock;
		ps2data <= '1';
		wait for 35 us;
		ps2clock <= '1';
		wait for 35 us;
		if (data(7 downto 0) = dout) then
			report "no error detected. simulation successful" severity failure;
		else
			report "error detected" severity failure;
		end if;
	end process;
end arch_test;