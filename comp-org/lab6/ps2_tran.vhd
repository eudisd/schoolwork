library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ps2_tran is
	port (clk ,reset: in std_logic;
	ps2_data : inout std_logic;
	ps2_clk : inout std_logic;
	en : std_logic;
	tran_done: out std_logic;
	tran_idle: out std_logic;
	din: in std_logic_vector( 7 downto 0));
end ps2_tran;

architecture arch of ps2_tran is
	type statetype is (idle, request, start, transmit, done);
	signal current_state, next_state : statetype;
	signal current_counter, next_counter : unsigned(12 downto 0);
	signal current_data, next_data: std_logic_vector(8 downto 0);
	signal current_n, next_n : unsigned(3 downto 0);
	signal parity : std_logic;
	signal ps2_clk_out, ps2_data_out : std_logic;
	signal tri_clk, tri_data : std_logic;
	signal fall_edge: std_logic;
	signal current_filter, next_filter : std_logic_vector(7 downto 0);
	signal current_filter_clock, next_filter_clock : std_logic;
begin
	process(clk, reset)
	begin
		if reset = '1' then
			current_filter <= (others => '0');
			current_filter_clock <= '0';
		elsif (rising_edge(clk)) then
			current_filter <= next_filter;
			current_filter_clock <= next_filter_clock;
		end if;
	end process;
	
	next_filter <= ps2_clk & current_filter(7 downto 1);
	next_filter_clock <= '1' when current_filter = "11111111" else
	'0' when current_filter = "00000000" else
	current_filter_clock;
	fall_edge <= current_filter_clock and (not next_filter_clock);
	
	process (clk, reset)
	begin
		if(reset = '1') then
			current_state <= idle;
			current_n <= (others => '0');
			current_data <= (others => '0');
			current_counter <= (others => '0');
		elsif(rising_edge(clk)) then
			current_state <= next_state;
			current_n <= next_n;
			current_data <= next_data;
			current_counter <= next_counter;
		end if;
	end process;
	
	parity <= not (din(7) xor din (6) xor din (5) 
	          xor din (4) xor din (3) xor din(2) 
			  xor din (1)xor din (0));
	
	process(current_state, 
			current_data, 
			current_n, 
			current_counter, 
			en, 
			din,
			parity, 
			fall_edge)
	begin
		tran_done <= '0';
		ps2_clk_out <= '1';
		ps2_data_out <= '1';
		tri_clk <= '0';
		tri_data <= '0';
		tran_idle <= '0';
		next_state <= current_state;
		next_n <= current_n;
		next_data <= current_data;
		next_counter <= current_counter;
		
		case current_state is
			when idle =>
				tran_idle <='1';
				if(en = '1') then
					next_data <= parity & din;
					next_counter <= (others => '1');
					next_state <= request;
				end if;
			when request =>
				ps2_clk_out <= '0'; --enter you code here;
				tri_clk <= '1';
				next_counter <= current_counter - 1;
				if (current_counter = 0) then
					next_state <= start;
				end if;
			when start =>
				ps2_data_out <= '0';--enter you code here;
				tri_data <= '1';
				
				if (fall_edge = '1') then
					next_n <= "1000";
					next_state <= transmit;
				end if;
				
			when transmit =>
			
				ps2_data_out <= '0';--enter you code here;
				tri_data <= '1';
				
				if (fall_edge = '1') then
					next_data <= '0' & "00000000";--enter you code here;
					if current_n = 0 then
						next_state <= idle;--enter you code here;
					else
						next_n <= "1001";--enter you code here;
					end if;
				end if;
				
			when done =>
				if (fall_edge = '1') then
					next_state <= idle;
					tran_done <= '1';
				end if;
		end case;
	end process;
	
	ps2_clk <= ps2_clk_out when tri_clk = '1' else 'Z';
	ps2_data <= ps2_data_out when tri_data = '1' else 'Z';
	
end arch;