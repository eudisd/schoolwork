library ieee;
use ieee.std_logic_1164.all;

entity mux_2_to_1 is
	port( i0, i1 : in std_logic;
		  s : in std_logic;
		  output : out std_logic);
end mux_2_to_1;

architecture mux_2_to_1_arch of mux_2_to_1 is

begin
	output <= (i0 and s) or (i1 and (not s));
end mux_2_to_1_arch;

library ieee;
use ieee.std_logic_1164.all;


entity d_flip_flop_en is
	port( d, en, clock : in std_logic;
		  q, notq : inout std_logic);
end d_flip_flop_en;

architecture d_enable_arch of d_flip_flop_en is
	component mux_2_to_1 
		port( i0, i1 : in std_logic;
		      s : in std_logic;
		      output : out std_logic);
	end component;
	
	component master_slave
		port ( clock, d: in std_logic;
		       q, qnot : inout std_logic);
	end component;
	
	signal out_sig : std_logic;
	
begin
	
	enable : mux_2_to_1 port map(
		i0 => d,
		i1 => q,
		s => en,
		output => out_sig
	);
	
	d_ff : master_slave port map(
		clock => clock,
		d => out_sig,
		qnot => notq,
		q => q
	);


end d_enable_arch;