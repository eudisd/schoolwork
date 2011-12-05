library ieee;
use ieee.std_logic_1164.all;

entity control_unit is
	port( Run : in std_logic;
	      Reset : in std_logic;
		  Clock : in std_logic;
		  IR : in std_logic_vector(8 downto 0);  -- 9 bits
		  
		  IR_in : out std_logic;
		  R_out : out std_logic_vector(7 downto 0);
		  G_out : out std_logic;
		  DIN_out : out std_logic;
		  R_in : out std_logic_vector(7 downto 0);
		  A_in : out std_logic;
		  G_in : out std_logic;
		  AddSub : out std_logic;
		  Done : out std_logic
	);
end control_unit;

architecture control_arch of control_unit is
	component decoder 
		port (i: in std_logic_vector(2 downto 0);
			  o: out std_logic_vector(7 downto 0));
	end component;
	type state_type is (cpu_wait, cpu_off, fetch, decode, mov, 
	                   movi, operation, storeA, AddG, SubG, finished);
					   
	signal current_state : state_type;
	signal next_state : state_type := cpu_wait;
	signal Rx_out : std_logic_vector(7 downto 0);
	signal Ry_out : std_logic_vector(7 downto 0);
begin
	
	Rx : decoder port map( i => IR(5 downto 3),
							 o => Rx_out);
	Ry : decoder port map( i => IR(2 downto 0),
						   o => Ry_out);
	-- States Process
	process(clock, reset, current_state, Run, IR)
	begin
			current_state <= next_state;
			if(rising_edge(clock)) then
				case current_state is
					when cpu_wait =>
						if(run = '1') then
							next_state <= fetch;
						elsif (run = '0') then
							next_state <= cpu_off;
						end if;
						
						done <= '0';
						IR_in <= '0';
						R_out <= "00000000";
						G_out <= '0';
						DIN_out <= '0';
						R_in <= "00000000";
						A_in <= '0';
						G_in <= '0';
						AddSub <= '0';
							
					when cpu_off =>
						if(run = '1' or reset = '1') then
							-- Change State here
							next_state <= cpu_wait;
						end if;
						-- All Outputs
						done <= '0';
						IR_in <= '0';
						R_out <= "00000000";
						G_out <= '0';
						DIN_out <= '0';
						R_in <= "00000000";
						A_in <= '0';
						G_in <= '0';
						AddSub <= '0';
						
					when fetch =>
						if(run = '1') then
							next_state <= decode;
							IR_in <= '1';
						elsif(run = '0') then
							next_state <= cpu_off;
							IR_in <= '0';
						elsif(reset = '1') then
							next_state <= cpu_wait;
							IR_in <= '0';
						end if;
						done <= '0';
						R_out <= "00000000";
						G_out <= '0';
						DIN_out <= '0';
						R_in <= "00000000";
						A_in <= '0';
						G_in <= '0';
						AddSub <= '0';
						
					when decode =>
						if(run = '1') then
							if( IR(8 downto 6) = "000" ) then -- Mov
								next_state <= mov;
								done <= '0';
								
								R_out <= Ry_out;
								G_out <= '0';
								DIN_out <= '0';
								R_in <= Rx_out;
								A_in <= '0';
								G_in <= '0';
								AddSub <= '0';
								
							elsif ( IR(8 downto 6) = "001") then -- Movi 
								next_state <= movi;

								done <= '0';								
								R_out <= "00000000";
								G_out <= '0';
								DIN_out <= '1';
								R_in <= Rx_out;
								A_in <= '0';
								G_in <= '0';
								AddSub <= '0';
							elsif ( IR(8 downto 6) = "010") then -- Add or Sub
								next_state <= operation;
							end if;
						end if;
						
						
						
					when mov =>
						if(run = '1') then
							next_state <= finished;
							done <= '1';
							
						end if;
					when movi =>
						if(run = '1') then
							next_state <= finished;
							done <= '1';
							
						end if;
					when operation =>
					when storeA =>
					when AddG =>
					when SubG =>
					when finished =>
						if(run = '1') then
							next_state <= cpu_wait;
							done <= '0';
							IR_in <= '0';
							R_out <= "00000000";
							G_out <= '0';
							DIN_out <= '0';
							R_in <= "00000000";
							A_in <= '0';
							AddSub <= '0';
						end if;
				end case;
			end if;
	end process;
	
	
end control_arch;
