library ieee;
use ieee.std_logic_1164.all;

entity display_mouse is
	port(
		clk ,reset: in std_logic;
		x : std_logic_vector( 8 downto 0)
		);
	);
end display_mouse;


architecture arch of display_mouse is 
	component mouse
		port(
		clk ,reset: in std_logic;
		ps2_data : inout std_logic;
		ps2_clk : inout std_logic;
		m_done : out std_logic;
		x, y: out std_logic_vector( 8 downto 0);
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
	
	signal clk, reset : std_logic;
	
begin

	
	m : port map (
		clk => clk,
		reset => reset,
		ps2_data => ps2_data,
		ps2_clk => ps2_data,
		m_done => m_done,
		x => x, 
		y => y,
		btn => btn
		);

end arch;