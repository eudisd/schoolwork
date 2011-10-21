library ieee;
use ieee.std_logic_1164.all;

entity shift_detector is
		port(
		clk : in std_logic;
		done : in std_logic;
		hex : in std_logic_vector(7 downto 0);
		shift : out std_logic
		);
end shift_detector;

architecture arch of shift_detector is
	type state_type is (a, b, c, d, e, f, g, h, i);
	signal cur_state : state_type := a;
	signal next_state : state_type;
begin
	process (cur_state, done, hex) 
	begin
	if(done = '1') then
		case cur_state is
			when a =>
				if(hex = X"12") then
					next_state <= c;
				elsif (hex = X"59") then
					next_state <= b;
				else
					next_state <= a;
				end if;
				
			when b =>
				if(hex = X"12") then
					next_state <= i;
				elsif (hex = X"F0") then
					next_state <= e;
				else
					next_state <= b;
				end if;
				
			when c =>
				if(hex = X"59") then
					next_state <= i;
				elsif (hex = X"F0") then
					next_state <= d;
				else
					next_state <= c;
				end if;
				
			when d =>
				if(hex = X"12") then
					next_state <= a;
				elsif (hex = X"59") then
					next_state <= b;
				else
					next_state <= d;
				end if;
			when e =>
				if(hex = X"12") then
					next_state <= c;
				elsif (hex = X"59") then
					next_state <= a;
				else
					next_state <= e;
				end if;
			when f =>
				if(hex = X"F0") then
					next_state <= d;
				elsif (hex = X"59") then
					next_state <= i;
				else
					next_state <= f;
				end if;
			when g =>
				if(hex = X"F0") then
					next_state <= e;
				elsif (hex = X"12") then
					next_state <= i;
				else
					next_state <= g;
				end if;
			when h =>
				if(hex = X"12") then
					next_state <= g;
				elsif (hex = X"59") then
					next_state <= f;
				else
					next_state <= h;
				end if;
			when i =>
				if(hex = X"F0") then
					next_state <= h;
				else
					next_state <= i;
				end if;
		end case;
	end if;
	end process;
	
	process (clk, done)
	begin
		if(rising_edge(clk) and done='1') then
			cur_state <= next_state;
			
			case cur_state is
			when a =>
				if(hex = X"12") then
					shift <= '1';
				elsif (hex = X"59") then
					shift <= '1';
				else
					shift <= '0';
				end if;
				
			when b =>
				if(hex = X"12") then
					shift <= '1';
				elsif (hex = X"F0") then
					shift <= '1';
				else
					shift <= '1';
				end if;
				
			when c =>
				if(hex = X"59") then
					shift <= '1';
				elsif (hex = X"F0") then
					shift <= '1';
				else
					shift <= '1';
				end if;
				
			when d =>
				if(hex = X"12") then
					shift <= '0';
				elsif (hex = X"59") then
					shift <= '1';
				else
					shift <= '1';
				end if;
			when e =>
				if(hex = X"12") then
					shift <= '1';
				elsif (hex = X"59") then
					shift <= '0';
				else
					shift <= '1';
				end if;
			when f =>
				if(hex = X"F0") then
					shift <= '1';
				elsif (hex = X"59") then
					shift <= '1';
				else
					shift <= '1';
				end if;
			when g =>
				if(hex = X"F0") then
					shift <= '1';
				elsif (hex = X"12") then
					shift <= '1';
				else
					shift <= '1';
				end if;
			when h =>
				if(hex = X"12") then
					shift <= '1';
				elsif (hex = X"59") then
					shift <= '1';
				else
					shift <= '1';
				end if;
			when i =>
				if(hex = X"F0") then
					shift <= '1';
				else
					shift <= '1';
				end if;
		end case;
		end if;
		
	end process;

end arch;