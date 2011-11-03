library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display_mouse is
	port(
		clock : in std_logic;
		reset : in std_logic;
		en : in std_logic;
		display: out std_logic_vector(55 downto 0);
		ps2d : inout std_logic;
		ps2c : inout std_logic
	);
end display_mouse;


architecture arch of display_mouse is 
	component mouse
		port(
		clk ,reset: in std_logic;
		ps2_data : inout std_logic;
		ps2_clk : inout std_logic;
		m_done : out std_logic;
		x, y: out std_logic_vector(8 downto 0);
		btn: out std_logic_vector( 2 downto 0)
		);
	end component;
	
	component hex_to_seven port(
		en : in std_logic;
		input : in std_logic_vector(31 downto 0);
		hex0 : out std_logic_vector(6 downto 0);
		hex1 : out std_logic_vector(6 downto 0);
		hex2 : out std_logic_vector(6 downto 0);
		hex3 : out std_logic_vector(6 downto 0);
		hex4 : out std_logic_vector(6 downto 0);
		hex5 : out std_logic_vector(6 downto 0);
		hex6 : out std_logic_vector(6 downto 0);
		hex7 : out std_logic_vector(6 downto 0));
	end component;
	
	signal m_done : std_logic;
	signal x, y : std_logic_vector (8 downto 0);
	signal btn : std_logic_vector( 2 downto 0);
	signal dis_input : std_logic_vector(31 downto 0);
	
	signal s_x : signed(8 downto 0);
	
begin

	process(x)
	begin
		s_x <= s_x + signed(x);
	end process;

	process(s_x)
	begin
		dis_input <= "00000000000000000000000" & std_logic_vector(s_x);
	end process;
	
	m : mouse port map (
		clk => clock,
		reset => reset,
		ps2_data => ps2d,
		ps2_clk => ps2c,
		m_done => m_done,
		x => x, 
		y => y,
		btn => btn
		);

	sev : hex_to_seven port map(
		en => m_done,
		input => dis_input,
		hex0 => display(6 downto 0),
		hex1 => display(13 downto 7),
		hex2 => display(20 downto 14),
		hex3 => display(27 downto 21),
		hex4 => display(34 downto 28),
		hex5 => display(41 downto 35),
		hex6 => display(48 downto 42),
		hex7 => display(55 downto 49)
	);
	
	
end arch;