library ieee;
use ieee.std_logic_1164.all;

entity reg is
		port(  d : in std_logic_vector(15 downto 0);
			   clock : in std_logic;
			   R_in : in std_logic;
			   q : out std_logic_vector(15 downto 0));
end reg;

architecture arch of reg is
	component d_flip_flop_en 
		port( d, en, clock : in std_logic;
		      q, notq : inout std_logic);
	end component;
	
	signal itemp, qtemp : std_logic_vector(15 downto 0);
begin

	r0 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => itemp(0),
		q => qtemp(0)
	);
	
	r1 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => itemp(1),
		q => qtemp(1)
	);
	
	r2 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => itemp(2),
		q => qtemp(2)
	);
	
	r3 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => itemp(3),
		q => qtemp(3)
	);
	r4 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => itemp(4),
		q => qtemp(4)
	);
	
	r5 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => itemp(5),
		q => qtemp(5)
	);
	
	r6 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => itemp(6),
		q => qtemp(6)
	);
	
	r7 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => itemp(7),
		q => qtemp(7)
	);
	
	-- 8 More bits
	
	r8 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => itemp(8),
		q => qtemp(8)
	);
	
	r9 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => itemp(9),
		q => qtemp(9)
	);
	
	r10 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => itemp(10),
		q => qtemp(10)
	);
	
	r11 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => itemp(11),
		q => qtemp(11)
	);
	r12 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => itemp(12),
		q => qtemp(12)
	);
	
	r13 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => itemp(13),
		q => qtemp(13)
	);
	
	r14 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => itemp(14),
		q => qtemp(14)
	);
	
	r15 : d_flip_flop_en port map(
		clock => clock,
		en => '1',
		d => itemp(15),
		q => qtemp(15)
	);
	
	process(clock, R_in)
	begin
		if(rising_edge(clock)) then
			if(R_in = '1') then
				itemp <= d;
				q <= qtemp;
			elsif(R_in = '0') then
				itemp <= qtemp;
				q <= qtemp;
			end if;
		end if;
	end process;
	
end arch;