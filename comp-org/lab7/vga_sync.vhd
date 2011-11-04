library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_sync is
	port(
	clk, reset: in std_logic;
	hsync , vsync : out std_logic ;
	video_on: out std_logic;
	pixel_x , pixel_y : out std_logic_vector (9 downto 0)
	);
end vga_sync;

architecture arch of vga_sync is
	constant HD: integer := 640; --horizontal display area
	constant HF: integer:= 16 ; --h. front porch
	constant HB: integer:= 48 ; --h. back porch
	constant HR: integer:= 96 ; --h. retrace
	constant VD: integer := 480; --vertical display area
	constant VF: integer:= 11; -- v. front porch
	constant VB: integer := 31; -- v. back porch
	constant VR: integer := 2; -- v. retrace
	signal current_mod2, next_mod2 : std_logic;
	signal current_v_count , next_v_count : unsigned(9 downto 0);
	signal current_h_count , next_h_count : unsigned (9 downto 0);
	signal current_v_sync , current_h_sync : std_logic;
	signal next_v_sync , next_h_sync : std_logic;
	signal h_end , v_end , pixel_tick: std_logic;
begin
	process (clk,reset)
	begin
		if (reset = '1') then
			current_mod2 <= '0';
			current_v_count <= (others=>'0');
			current_h_count <= (others=>'0');
			current_v_sync <= '0';
			current_h_sync <= '0';
		elsif (clk'event and clk = '1') then
			current_mod2 <= next_mod2 ;
			current_v_count <= next_v_count;
			current_h_count <= next_h_count;
			current_v_sync <= next_v_sync ;
			current_h_sync <= next_h_sync ;
		end if ;
	end process;
	
	next_mod2 <= not current_mod2;
	pixel_tick <= '1' when current_mod2='1' else '0';
	h_end <= '1' when current_h_count=(HD+HF+HB+HR - 1) else --799
	'0';
	v_end <= '1' when current_v_count=(VD+VF+VB+VR - 1) else --524
	'0';
	
	process (current_h_count,h_end,pixel_tick)
	begin
		if pixel_tick = '1' then
			if h_end='1' then
				next_h_count <= (others=>'0');
			else
				next_h_count <= current_h_count + 1;
			end if ;
		else
			next_h_count <= current_h_count;
		end if ;
	end process;
	
	process (current_v_count,h_end,v_end,pixel_tick)
	begin
		if pixel_tick='1' and h_end='1' then
			if (v_end='1') then
				next_v_count <= (others=>'0');
			else
				next_v_count <= current_v_count + 1;
			end if ;
		else
			next_v_count <= current_v_count;
		end if ;
	end process;
	
	next_h_sync <= '1' when (current_h_count >=(HD+HF)) --656
	and (current_h_count<=(HD+HF+HR-1)) else --751
	'0';
	video_on <= '1' when (current_h_count<HD) and
	(current_v_count<VD) else
	'0';
	next_v_sync <= '1' when ( current_v_count >= ( VD+VF ) ) --490
	and (current_v_count<=(VD+VF+VR-1)) else --491
	'0';
	
	hsync <= current_h_sync;
	vsync <= current_v_sync;
	
	pixel_x <= std_logic_vector(current_h_count);
	pixel_y <= std_logic_vector(current_v_count);
	
end arch;