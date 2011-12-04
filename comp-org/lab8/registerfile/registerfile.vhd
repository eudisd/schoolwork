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
		   w_addr: in std_logic_vector(2 downto 0);
		   datain: in std_logic_vector(15 downto 0);
		   r_addr_a: in std_logic_vector(2 downto 0);
		   dataouta: out std_logic_vector(15 downto 0);
		   --dataoutb: out std_logic_vector(15 downto 0)
		   );
end registerfile;

architecture struct of registerfile is
	component and_gate 
		port ( in0 : in std_logic;
			   in1 : in std_logic;
			   o: out std_logic);
	end component;
	
	component reg
		port ( clock: in std_logic;
			   d: in std_logic_vector(15 downto 0);
			   q: out std_logic_vector(15 downto 0));
	end component;

	component decoder
		port ( i: in std_logic_vector(2 downto 0);
			   o: out std_logic_vector(15 downto 0));
	end component;

	component multiplexer4
		port ( i7: in std_logic_vector(16 downto 0);
			   i6: in std_logic_vector(16 downto 0);
			   i5: in std_logic_vector(16 downto 0);
			   i4: in std_logic_vector(16 downto 0);
			   i3: in std_logic_vector(16 downto 0);
			   i2: in std_logic_vector(16 downto 0);
			   i1: in std_logic_vector(16 downto 0);
			   i0: in std_logic_vector(16 downto 0);
			   s: in std_logic_vector(2 downto 0);
			   o: out std_logic_vector(16 downto 0));
	end component;

	signal ss1: std_logic;
	signal ss2: std_logic;
	signal ss3: std_logic;
	signal ss4: std_logic;
	signal ss5: std_logic;
	signal ss6: std_logic;
	signal ss7: std_logic;
	signal ss8: std_logic;
	
	signal ss: std_logic_vector(7 downto 0);
	signal dataout1: std_logic_vector(15 downto 0);
	signal dataout2: std_logic_vector(15 downto 0);
	signal dataout3: std_logic_vector(15 downto 0);
	signal dataout4: std_logic_vector(15 downto 0);
	signal dataout5: std_logic_vector(15 downto 0);
	signal dataout6: std_logic_vector(15 downto 0);
	signal dataout7: std_logic_vector(15 downto 0);
	signal dataout8: std_logic_vector(15 downto 0);

begin
	
	DEC: decoder port map(i => w_addr, o => ss);
	
	AND1: and_gate port map(in0 => ss(0), in1 => clock4, o => ss1);
	AND2: and_gate port map(in0 => ss(1), in1 => clock4, o => ss2);
	AND3: and_gate port map(in0 => ss(2), in1 => clock4, o => ss3);
	AND4: and_gate port map(in0 => ss(3), in1 => clock4, o => ss4);
	AND5: and_gate port map(in0 => ss(4), in1 => clock4, o => ss5);
	AND6: and_gate port map(in0 => ss(5), in1 => clock4, o => ss6);
	AND7: and_gate port map(in0 => ss(6), in1 => clock4, o => ss7);
	AND8: and_gate port map(in0 => ss(7), in1 => clock4, o => ss8);
	
	R1: reg port map(clock => ss1, d => datain, q => dataout1);
	R2: reg port map(clock => ss2, d => datain, q => dataout2);
	R3: reg port map(clock => ss3, d => datain, q => dataout3);
	R4: reg port map(clock => ss4, d => datain, q => dataout4);
	R5: reg port map(clock => ss5, d => datain, q => dataout5);
	R6: reg port map(clock => ss6, d => datain, q => dataout6);
	R7: reg port map(clock => ss7, d => datain, q => dataout7);
	R8: reg port map(clock => ss8, d => datain, q => dataout8);
	
	MUXA: multiplexer4 port map(s  => r_addr_a, 
								o  => dataouta,
								i0 => dataout1, 
								i1 => dataout2,
								i2 => dataout3,
								i3 => dataout4,
								i4 => dataout1, 
								i5 => dataout2,
								i6 => dataout3,
								i7 => dataout4,
								
								);
	
end struct;