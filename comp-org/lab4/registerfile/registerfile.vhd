library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
	port ( in0 : in std_logic;
		   in1 : in std_logic;
		   o: out std_logic);
end and_gate;

architecture arch_and_gate of and_gate is

begin
	o <= in0 and in1;
end arch_and_gate;

library ieee;
use ieee.std_logic_1164.all;

entity registerfile is
	port ( clock4: in std_logic;
		   w_addr: in std_logic_vector(1 downto 0);
		   datain: in std_logic_vector(3 downto 0);
		   r_addr_a: in std_logic_vector(1 downto 0);
		   r_addr_b: in std_logic_vector(1 downto 0);
		   dataouta: out std_logic_vector(3 downto 0);
		   dataoutb: out std_logic_vector(3 downto 0));
end registerfile;

architecture struct of registerfile is
	component and_gate 
		port ( in0 : in std_logic;
			   in1 : in std_logic;
			   o: out std_logic);
	end component;
	
	component reg
		port ( clock: in std_logic;
			   d: in std_logic_vector(3 downto 0);
			   q: out std_logic_vector(3 downto 0));
	end component;

	component decoder
		port ( i: in std_logic_vector(1 downto 0);
			   o: out std_logic_vector(3 downto 0));
	end component;

	component multiplexer4
		port ( i3: in std_logic_vector(3 downto 0);
			   i2: in std_logic_vector(3 downto 0);
			   i1: in std_logic_vector(3 downto 0);
			   i0: in std_logic_vector(3 downto 0);
			   s: in std_logic_vector(1 downto 0);
			   o: out std_logic_vector(3 downto 0));
	end component;

	signal ss1: std_logic;
	signal ss2: std_logic;
	signal ss3: std_logic;
	signal ss4: std_logic;
	
	signal ss: std_logic_vector(3 downto 0);
	signal dataout1: std_logic_vector(3 downto 0);
	signal dataout2: std_logic_vector(3 downto 0);
	signal dataout3: std_logic_vector(3 downto 0);
	signal dataout4: std_logic_vector(3 downto 0);

begin
	
	DEC: decoder port map(i => w_addr, o => ss);
	
	AND1: and_gate port map(in0 => ss(0), in1 => clock4, o => ss1);
	AND2: and_gate port map(in0 => ss(1), in1 => clock4, o => ss2);
	AND3: and_gate port map(in0 => ss(2), in1 => clock4, o => ss3);
	AND4: and_gate port map(in0 => ss(3), in1 => clock4, o => ss4);
	
	R1: reg port map(clock => ss1, d => datain, q => dataout1);
	R2: reg port map(clock => ss2, d => datain, q => dataout2);
	R3: reg port map(clock => ss3, d => datain, q => dataout3);
	R4: reg port map(clock => ss4, d => datain, q => dataout4);
	
	MUXA: multiplexer4 port map(s  => r_addr_a, 
								o  => dataouta,
								i0 => dataout1, 
								i1 => dataout2,
								i2 => dataout3,
								i3 => dataout4);
								
	MUXB: multiplexer4 port map(s  => r_addr_b, 
								o  => dataoutb,
								i0 => dataout1, 
								i1 => dataout2,
								i2 => dataout3,
								i3 => dataout4);
	
end struct;