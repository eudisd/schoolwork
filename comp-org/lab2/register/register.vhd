library ieee;
use ieee.std_logic_1164.all;

entity Register_Four_Bit is
		port(  Input : in std_logic_vector(3 downto 0);
			   En, Clock : in std_logic;
			   Output : out std_logic_vector(3 downto 0));
end Register_Four_Bit;

architecture arch of Register_Four_Bit is
	component D_Flip_Flop_En 
		port( D, En, Clock : in std_logic;
		      Q, NotQ : inout std_logic);
	end component;
	signal OTemp : std_logic_vector(3 downto 0);
begin

	R0 : D_Flip_Flop_En port map(
		Clock => Clock,
		En => En,
		D => Input(0),
		Q => OTemp(0)
	);
	
	R1 : D_Flip_Flop_En port map(
		Clock => Clock,
		En => En,
		D => Input(1),
		Q => OTemp(1)
	);
	
	R2 : D_Flip_Flop_En port map(
		Clock => Clock,
		En => En,
		D => Input(2),
		Q => OTemp(2)
	);
	
	R3 : D_Flip_Flop_En port map(
		Clock => Clock,
		En => En,
		D => Input(3),
		Q => OTemp(3)
	);
	
	Output <= OTemp;

	
end arch;