library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mouse is
	port
	(
	clk ,reset: in std_logic;
	ps2_data : inout std_logic;
	ps2_clk : inout std_logic;
	m_done : out std_logic;
	x, y: out std_logic_vector( 8 downto 0);
	btn: out std_logic_vector( 2 downto 0)
	);
end mouse;

architecture arch of mouse is
	component ps2_rt
		port
		(
		clk ,reset: in std_logic;
		ps2_data : inout std_logic;
		ps2_clk : inout std_logic;
		write_en : std_logic;
		dout : out std_logic_vector( 7 downto 0);
		rec_done, tran_done : out std_logic;
		din: in std_logic_vector( 7 downto 0)
		);
	end component;
	
	constant stream_mode : std_logic_vector(7 downto 0) := "11110100";
	type statetype is (init1, init2, init3, pack1, pack2, pack3, done);
	signal current_state, next_state : statetype;
	signal current_counter, next_counter : 
	unsigned(12 downto 0) := (others => '0');
	signal rec_data: std_logic_vector(7 downto 0);
	signal rec_done, tran_done : std_logic;
	signal wr_en : std_logic;
	signal current_x, next_x : std_logic_vector(8 downto 0);
	signal current_y, next_y : std_logic_vector(8 downto 0);
	signal current_btn, next_btn : std_logic_vector(2 downto 0);

begin
	rt: ps2_rt port map
	(
	clk => clk,
	reset => reset,
	ps2_data => ps2_data,
	ps2_clk => ps2_clk,
	write_en => wr_en,
	tran_done => tran_done,
	rec_done => rec_done,
	din => stream_mode,
	dout => rec_data
	);
	
	process (clk, reset)
	begin
		if(reset = '1') then
			current_state <= init1;
			current_x <= (others => '0');
			current_y <= (others => '0');
			current_btn <= (others => '0');
		elsif(rising_edge(clk)) then
			current_state <= next_state;
			current_x <= next_x;
			current_y <= next_y;
			current_btn <= next_btn;
		end if;
	end process;
	process(current_state, 
			rec_done, 
			tran_done, 
			current_x, 
			current_y,
			current_btn, 
			rec_data)
	begin
		wr_en <= '0';
		m_done <= '0';
		next_state <= current_state;
		next_x <= current_x;
		next_y <= current_y;
		next_btn <= current_btn;
		
		case current_state is
			when init1 =>
				wr_en <='1';
				next_state <= init2;
			when init2 =>
				if(tran_done = '1') then
					next_state <= init3;
				end if;
			when init3 =>
				if(rec_done = '1') then
					next_state <= pack1;
				end if;
			when pack1 =>
				if (rec_done = '1') then
					next_y(8) <= --enter you code here;
					next_x(8) <= --enter you code here;
					next_btn <= rec_data(2 downto 0);
					next_state <= pack2;
				end if;
			when pack2 =>
				if (rec_done = '1') then
					next_x(7 downto 0) <= --enter you code here;
					next_state <= pack3;
				end if;
			when pack3 =>
				if (rec_done = '1') then
					next_y(7 downto 0) <= --enter you code here;
					next_state <= done;
				end if;
			when done =>
				next_state <= pack1;
				m_done <= '1';
		end case;
	end process;
	
	x <= current_x;
	y <= current_y;
	btn <= current_btn;
end arch;