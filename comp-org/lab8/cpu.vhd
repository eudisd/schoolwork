library ieee;
use ieee.std_logic_1164.all;

entity cpu is
	port( Clock, Run, Reset : in std_logic;
		  DIN : in std_logic_vector(15 downto 0);
		  cpu_bus : inout std_logic_vector(15 downto 0);
		  Done : out std_logic
 		  );
end cpu;


architecture cpu_arch of cpu is
	component reg 
		port(  d : in std_logic_vector(15 downto 0);
			   clock : in std_logic;
			   R_in : in std_logic;
			   q : out std_logic_vector(15 downto 0));
	end component;
	
	-- Sub = 0, Add = 1
	component addsub 
		port( a, b : in std_logic_vector(15 downto 0);
			  AddSub : in std_logic;
			  res : out std_logic_vector(15 downto 0)
			  );
	end component;
	
	-- CONTROL
	component control_unit 
		port( Run : in std_logic;
			  Reset : in std_logic;
			  Clock : in std_logic;
			  IR : in std_logic_vector(8 downto 0);  -- 9 bits
			  
			  IR_in : out std_logic;
			  R_out : out std_logic_vector(7 downto 0);
			  G_out : out std_logic;
			  DIN_out : out std_logic;
			  R_in : out std_logic_vector(7 downto 0);
			  A_in : out std_logic;
			  G_in : out std_logic;
			  AddSub : out std_logic;
			  Done : out std_logic
		);
	end component;
	
	-- IR
	component IR 
		port(Clock : in std_logic;
			 IR_in : in std_logic;
			 DIN_in : in std_logic_vector(8 downto 0);
			 DIN_out : out std_logic_vector(8 downto 0));
	end component;
	
	-- MUX
	component mux 
		port( R0, R1, R2, R3, R4, R5, R6, R7 : in std_logic_vector(15 downto 0);
			  DIN : in std_logic_vector(15 downto 0);
			  AddSubResult : in std_logic_vector(15 downto 0);
			  SR : in std_logic_vector(7 downto 0);
			  SG : in std_logic;
			  SDIN : in std_logic;
			  MuxOut : out std_logic_vector(15 downto 0)
		);
	end component;
	
	signal R0_in, R1_in, R2_in, R3_in, R4_in, R5_in, R6_in, R7_in : std_logic;
	signal R0_output, R1_output, R2_output, R3_output, R4_output,
           R5_output, R6_output, R7_output	: std_logic_vector(15 downto 0);
		   
	-- AddSub part
	signal A_output, G_output : std_logic_vector(15 downto 0);
	signal A_in, G_in : std_logic;
	signal AddSubFlag : std_logic;
	signal AddSubResult : std_logic_vector(15 downto 0);
	
	-- IR/Control
	signal IR_out : std_logic;
	signal IRControl: std_logic_vector(8 downto 0);
	signal G_out : std_logic;
	signal DIN_out : std_logic;
	signal R_in : std_logic_vector(7 downto 0);
	signal R_out : std_logic_vector(7 downto 0);

	
begin
	R0 : reg port map( d => cpu_bus,
					   clock => Clock,
					   R_in => R0_in,
					   q => R0_output);
	R1 : reg port map( d => cpu_bus,
					   clock => Clock,
					   R_in => R1_in,
					   q => R1_output);
	R2 : reg port map( d => cpu_bus,
					   clock => Clock,
					   R_in => R2_in,
					   q => R2_output);
	R3 : reg port map( d => cpu_bus,
					   clock => Clock,
					   R_in => R3_in,
					   q => R3_output);
	R4 : reg port map( d => cpu_bus,
					   clock => Clock,
					   R_in => R4_in,
					   q => R4_output);
	R5 : reg port map( d => cpu_bus,
					   clock => Clock,
					   R_in => R5_in,
					   q => R5_output);
	R6 : reg port map( d => cpu_bus,
					   clock => Clock,
					   R_in => R6_in,
					   q => R6_output);
	R7 : reg port map( d => cpu_bus,
					   clock => Clock,
					   R_in => R7_in,
					   q => R7_output);
				
	-- AddSub Part
	A : reg port map( d => cpu_bus,
					   clock => Clock,
					   R_in => A_in,
					   q => A_output);
	G : reg port map( d => AddSubResult,
					   clock => Clock,
					   R_in => G_in,
					   q => G_output);
					   
	AddSubComp : addsub port map(a => A_output,
								 b => cpu_bus,
								 AddSub => AddSubFlag,
								 res => AddSubResult);
								 
	IRComp : IR port map( Clock => Clock,
						  IR_in => IR_out,
						  DIN_in => DIN(15 downto 7),
						  DIN_out => IRControl);
		
	muxComp : mux port map (R0 => R0_output,
					R1 => R1_output,
					R2 => R2_output,
					R3 => R3_output,
					R4 => R4_output,
					R5 => R5_output,
					R6 => R6_output,
					R7 => R7_output,
					DIN => DIN,
					AddSubResult => AddSubResult,
					SR => R_out,
					SG => G_out,
					SDIN => DIN_out,
					MuxOut => cpu_bus);
					
	control : control_unit port map( Run => Run,
									 Reset => Reset,
									 IR => IRControl,
									 IR_in => IR_out,
									 R_out => R_out,
									 G_out => G_out,
									 DIN_out => DIN_out,
									 R_in => R_in,
									 A_in => A_in,
									 G_in => G_in,
									 AddSub => AddSubFlag,
									 Done => Done,
									 Clock => Clock);
	
								
				
	
end cpu_arch;
