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
	                   movi, operation, StoreOpRes, StoreOpResFollowUp, StoreOpResFollowUp2, finished);
					   
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
	process(clock, reset)
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
						R_out <= "00000000";
						G_out <= '0';
						DIN_out <= '0';
						R_in <= "00000000";
						A_in <= '0';
						G_in <= '0';
						AddSub <= '0';
							
					when cpu_off =>
						if(run = '1' or reset = '1') then
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
								--IR_in <= '0';  -- Do not allow the current IR to be modified!
								R_out <= Ry_out;
								G_out <= '0';
								DIN_out <= '0';
								R_in <= Rx_out;
								A_in <= '0';
								G_in <= '0';
								AddSub <= '0';
								
							elsif ( IR(8 downto 6) = "001") then -- Movi 
								next_state <= movi;
								--IR_in <= '0';  -- Do not allow the current IR to be modified!
								done <= '0';								
								R_out <= "00000000";
								G_out <= '0';
								DIN_out <= '1';
								R_in <= Rx_out;
								A_in <= '0';
								G_in <= '0';
								AddSub <= '0';
							elsif ( IR(8 downto 6) = "010" or IR(8 downto 6) = "011") then -- Add or Sub
								next_state <= operation;
								-- Store A Here
								done <= '0';
								A_in <= '1';
								R_out <= Rx_out;  -- Store Rx in A
								G_out <= '0';
								DIN_out <= '0';
								R_in <= "00000000";
								G_in <= '0';
								
							end if;
						end if;
						
					when mov =>
						if(run = '1') then
							next_state <= finished;
							done <= '1';
							
							R_out <= "00000000";
							G_out <= '0';  
							DIN_out <= '0';
							R_in <= "00000000";
							A_in <= '0';
							G_in <= '0';
							
							
						end if;
					when movi =>
						if(run = '1') then
							next_state <= finished;
							done <= '1';
							
							R_out <= "00000000";
							G_out <= '0';  
							DIN_out <= '0';
							R_in <= "00000000";
							A_in <= '0';
							G_in <= '0';
							
						end if;
					when operation =>
						if(run = '1' and IR(8 downto 6) = "010") then -- Add
							AddSub <= '1';
						elsif (run = '1' and IR(8 downto 6) = "011") then -- Sub
							AddSub <= '0';
						end if;
						next_state <= StoreOpRes;
						
						done <= '0';
						R_out <= Ry_out;
						G_out <= '0';  
						DIN_out <= '0';
						R_in <= "00000000";
						A_in <= '0';
						G_in <= '1';
						
					when StoreOpRes =>
						if(run = '1') then
							next_state <= StoreOpResFollowUp;
							done <= '0';
							-- Leaving this part uncommented results in a CPU bus of UUUUUU
							--R_in <= Rx_out;  
							--G_out <= '1';
							--R_out <= "00000000"; 
							--DIN_out <= '0';
							--A_in <= '0';
							--G_in <= '0';
						end if;
						
					when StoreOpResFollowUp =>
						if(run = '1') then
							next_state <= StoreOpResFollowUp2;
							done <= '0';
						end if;
						
					when StoreOpResFollowUp2 =>
						if(run = '1') then
							next_state <= finished;
							done <= '1';
							
							R_in <= Rx_out;
							G_out <= '1';
							R_out <= "00000000"; 
							DIN_out <= '0';
							A_in <= '0';
							G_in <= '0';
						end if;

							
					when finished =>
						if(run = '1') then
							next_state <= cpu_wait;
							done <= '0';
							
						end if;
				end case;
			end if;
	end process;
	
	
end control_arch;
