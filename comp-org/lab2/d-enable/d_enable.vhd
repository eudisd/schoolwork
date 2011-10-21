library ieee;
use ieee.std_logic_1164.all;

entity mux_2_to_1 is
	port( I0, I1 : in std_logic;
		  S : in std_logic;
		  Output : out std_logic);
end mux_2_to_1;

architecture mux_2_to_1_arch of mux_2_to_1 is

begin
	Output <= (I0 and S) or (I1 and (not S));
end mux_2_to_1_arch;

library ieee;
use ieee.std_logic_1164.all;


entity D_Flip_Flop_En is
	Port( D, En, Clock : in std_logic;
		  Q, NotQ : inout std_logic);
end D_Flip_Flop_En;

architecture d_enable_arch of D_Flip_Flop_En is
	component mux_2_to_1 
		port( I0, I1 : in std_logic;
		      S : in std_logic;
		      Output : out std_logic);
	end component;
	
	component master_slave
		port ( Clock, D: in std_logic;
		       Q, QNot : inout std_logic);
	end component;
	
	signal out_sig : std_logic;
	
begin
	
	enable : mux_2_to_1 port map(
		I0 => D,
		I1 => Q,
		S => En,
		Output => out_sig
	);
	
	d_ff : master_slave port map(
		Clock => Clock,
		D => out_sig,
		QNot => NotQ,
		Q => Q
	);


end d_enable_arch;