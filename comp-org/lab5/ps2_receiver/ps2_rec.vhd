library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ps2_rec is
	port(
	clk ,reset: in std_logic;
	ps2data : in std_logic;
	ps2clock : in std_logic;
	rec_en : in std_logic;
	rec_done: out std_logic;
	dout: out std_logic_vector(7 downto 0)
	);
end ps2_rec;

architecture arch of ps2_rec is
	type statetype is (idle, receive, done);
	
	signal current_state, next_state : statetype;
	signal current_data, next_data: std_logic_vector(10 downto 0);
	signal u_current_data : unsigned(10 downto 0);
	signal current_n, next_n: unsigned(3 downto 0);
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
	
	next_filter <= ps2clock & current_filter(7 downto 1);
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
			elsif(rising_edge(clk)) then
				current_state <= next_state;
				current_n <= next_n;
				current_data <= next_data;
			end if;
		end process;
		
		process(current_state, current_data, current_n, ps2data, fall_edge, rec_en)
		begin
			rec_done <= '0';
			next_state <= current_state;
			next_n <= current_n;
			next_data <= current_data;
		case current_state is
			--write the code for idle and receive states
			--in idle state, when the receiver is enabled and on falling edge of the ps2
			--clock (fall_edge = '1'), shift the (current)data to the right and set the most
			--significant bit of the (next)data to ps2 data. also set n to be equal to nine.
			--remember to decrement n in the receive state.
		when idle =>
			if(fall_edge = '1' and rec_en = '1') then
					next_data(9 downto 0) <= current_data(10 downto 1);
					next_data(10) <= ps2data;
					next_n <= to_unsigned(9, 4);
					next_state <= receive;
			end if;
		when receive =>
			if(fall_edge = '1' and rec_en = '1') then
				if( current_n = to_unsigned(0, 4) ) then
					-- One last time
					next_data(9 downto 0) <= current_data(10 downto 1);
					next_data(10) <= ps2data;
					next_state <= done;
				else
					next_data(9 downto 0) <= current_data(10 downto 1);
					next_data(10) <= ps2data;
					next_n <= next_n - to_unsigned(1, 4);
				end if;
			end if;
				
		when done =>
			next_state <= idle;
			rec_done <= '1';
		end case;
	end process;
	
	dout <= current_data(8 downto 1);
end arch;