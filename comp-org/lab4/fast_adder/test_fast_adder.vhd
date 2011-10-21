library ieee;
use ieee.std_logic_1164.all;
entity test_fast_adder is
end test_fast_adder;

architecture arch_test of test_fast_adder is
	component fast_adder
		port (  clock_50_mhz :in std_logic;
				en :in std_logic;
				clock_user :in std_logic;
				data_user : in std_logic_vector(7 downto 0);
				address_user: in std_logic_vector(2 downto 0);
				sev_seg_output_1,sev_seg_output_2,sev_seg_output_3 : out std_logic_vector(3 downto 0));
	end component;
	
	-- Input signals
	signal clock_user: std_logic := '0';
	signal clock_50_mhz: std_logic := '0';
	signal en: std_logic := '0';
	
	signal address_user: std_logic_vector(2 downto 0);
	signal data_user: std_logic_vector(7 downto 0);
	
	-- Output signals
	signal s1, s2, s3: std_logic_vector (3 downto 0);
	
begin
	fa: fast_adder port map(
				clock_50_mhz => clock_50_mhz,
				en => en,
				clock_user => clock_user,
				data_user => data_user,
				address_user => address_user,
				sev_seg_output_1 => s1,
				sev_seg_output_2 => s2,
				sev_seg_output_3 => s3
	);
	process
		begin
		
		-- First, we fill in the register file with values of 1 (sum = 7)
		
		wait for 5 ns;
		clock_user <= not clock_user;
		wait for 50 ns;
		
		address_user <= "000";
		data_user <= "00000001";
		wait for 5 ns;
		clock_user <= not clock_user;
		wait for 50 ns;
		
		address_user <= "001";
		data_user <= "00000001";
		wait for 5 ns;
		clock_user <= not clock_user;
		wait for 50 ns;
		
		address_user <= "010";
		data_user <= "00000001";
		wait for 5 ns;
		clock_user <= not clock_user;
		wait for 50 ns;
		
		address_user <= "011";
		data_user <= "00000001";
		wait for 5 ns;
		clock_user <= not clock_user;
		wait for 50 ns;
		
		address_user <= "100";
		data_user <= "00000001";
		wait for 5 ns;
		clock_user <= not clock_user;
		wait for 50 ns;
		
		address_user <= "101";
		data_user <= "00000001";
		wait for 5 ns;
		clock_user <= not clock_user;
		wait for 50 ns;
		
		address_user <= "110";
		data_user <= "00000001";
		wait for 5 ns;
		clock_user <= not clock_user;
		wait for 50 ns;
		
		address_user <= "111";
		data_user <= "00000001";
		wait for 5 ns;
		clock_user <= not clock_user;
		wait for 50 ns;

		
		-- Now, we add them
		
		wait for 5 ns;
		clock_50_mhz <= not clock_50_mhz;
		wait for 50 ns;
		
		en <= '1';
		clock_user <= 'U';
		
		wait for 5 ns;
		clock_50_mhz <= not clock_50_mhz;
		wait for 50 ns;
		
		wait for 5 ns;
		clock_50_mhz <= not clock_50_mhz;
		wait for 50 ns;
		
		wait for 5 ns;
		clock_50_mhz <= not clock_50_mhz;
		wait for 50 ns;
		
		wait for 5 ns;
		clock_50_mhz <= not clock_50_mhz;
		wait for 50 ns;
		
		wait for 5 ns;
		clock_50_mhz <= not clock_50_mhz;
		wait for 50 ns;
		
		wait for 5 ns;
		clock_50_mhz <= not clock_50_mhz;
		wait for 50 ns;
		
		wait for 5 ns;
		clock_50_mhz <= not clock_50_mhz;
		wait for 50 ns;
		
		wait for 5 ns;
		clock_50_mhz <= not clock_50_mhz;
		wait for 50 ns;
		
		wait for 5 ns;
		clock_50_mhz <= not clock_50_mhz;
		wait for 50 ns;
		
		wait for 5 ns;
		clock_50_mhz <= not clock_50_mhz;
		wait for 50 ns;
		
		wait for 5 ns;
		clock_50_mhz <= not clock_50_mhz;
		wait for 50 ns;
		
		

	end process;
end arch_test;