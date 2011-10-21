library ieee;
use ieee.std_logic_1164.all;

entity reg is
		port(  d : in std_logic_vector(7 downto 0);
			   clock : in std_logic;
			   q : out std_logic_vector(7 downto 0));
end reg;

architecture arch of reg is
	component d_flip_flop_en 
		port( d, en, clock : in std_logic;
		      q, notq : inout std_logic);
	end component;
	signal otemp : std_logic_vector(7 downto 0);
begin

	r0 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => d(0),
		q => otemp(0)
	);
	
	r1 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => d(1),
		q => otemp(1)
	);
	
	r2 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => d(2),
		q => otemp(2)
	);
	
	r3 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => d(3),
		q => otemp(3)
	);
	
	r4 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => d(4),
		q => otemp(4)
	);
	
	r5 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => d(5),
		q => otemp(5)
	);
	
	r6 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => d(6),
		q => otemp(6)
	);
	
	r7 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => d(7),
		q => otemp(7)
	);
	
	q <= otemp;

	
end arch;