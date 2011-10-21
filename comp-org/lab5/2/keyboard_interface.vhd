library ieee;
use ieee.std_logic_1164.all;
entity keyboard_interface is
	port
	(
		clock : in std_logic;
		reset : in std_logic;
		en : in std_logic;
		display: out std_logic_vector(55 downto 0);
		ps2d : inout std_logic;
		ps2c : inout std_logic
	);
end keyboard_interface;
architecture bdf_type of keyboard_interface is
	component ps2_rec
		port(clk : in std_logic;
		reset : in std_logic;
		ps2data : in std_logic;
		ps2clock : in std_logic;
		rec_en : in std_logic;
		rec_done : out std_logic;
		dout : out std_logic_vector(7 downto 0));
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
	component shift_detector
		port(clk : in std_logic;
		done : in std_logic;
		hex : in std_logic_vector(7 downto 0);
		shift : out std_logic
		);
	end component;
	component scan_code_to_ascii
		port(shift : in std_logic;
		scan_code : in std_logic_vector(7 downto 0);
		ascii : out std_logic_vector(7 downto 0)
		);
	end component;
	signal notreset : std_logic;
	signal rec_done : std_logic;
	signal dis_input : std_logic_vector(31 downto 0);
	signal scancode : std_logic_vector(7 downto 0);
	signal shift_output : std_logic;
	signal asci_output : std_logic_vector(7 downto 0);
begin
	rec : ps2_rec
	port map(
			clk => clock,
			reset => notreset,
			ps2data => ps2d,
			ps2clock => ps2c,
			rec_en => en,
			rec_done => rec_done,
			dout => scancode 
			);
	
	sev : hex_to_seven
	port map(
			en => rec_done,
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
	dis_input <= asci_output & "0000000000000000" & scancode;
	notreset <= not(reset);
	shft : shift_detector
	port map(
			clk => clock,
			done => rec_done,
			hex => scancode,
			shift => shift_output
			);
	
	ascii : scan_code_to_ascii port map(
				shift => shift_output,
				scan_code => scancode,
				ascii => asci_output
		);
end bdf_type;