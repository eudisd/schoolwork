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
	type state_type is (down, up, break);
	signal cur_state, next_state : state_type := up;
begin

	process (cur_state, hex) 
	begin
		case cur_state is
			when up =>
				if(hex = "00010010" or hex = "01011001") then
					next_state <= down;
				else 
					next_state <= up;
				end if;
			when down =>
				if(hex = "11110000") then
					next_state <= break;
				else 
					next_state <= down;
				end if;
				
			when break =>
				if(hex = "00010010" or hex = "01011001") then
					next_state <= up;
				else
					next_state <= down;
				end if;
		end case;
		
	end process;
	
	process (clk)
	begin
		if(rising_edge(clk)) then
			cur_state <= next_state;
			case cur_state is
				when up =>
				if(hex = "00010010" or hex = "01011001") then
					shift <= '1';
				else 
					shift <= '0';
				end if;
			when down =>
				if(hex = "11110000") then
					shift <= '1';
				else 
					shift <= '1';
				end if;
				
			when break =>
				if(hex = "00010010" or hex = "01011001") then
					shift <= '0';
				else
					shift <= '1';
				end if;
			end case;
		end if;
		
	end process;

end arch;