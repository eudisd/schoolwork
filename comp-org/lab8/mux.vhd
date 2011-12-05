library ieee;
use ieee.std_logic_1164.all;

entity mux is
	port( R0, R1, R2, R3, R4, R5, R6, R7 : in std_logic_vector(15 downto 0);
		  DIN : in std_logic_vector(15 downto 0);
		  AddSubResult : in std_logic_vector(15 downto 0);
		  SR : in std_logic_vector(7 downto 0);
		  SG : in std_logic;
		  SDIN : in std_logic;
		  MuxOut : out std_logic_vector(15 downto 0)
	);
end mux;

architecture arch_mux of mux is
begin
	process(R0, R1, R2, R3, R4, R5, R6, R7, DIN, AddSubResult, SR, SG, SDIN)
	begin	
		if(SR = "00000000" and (SG = '1' or SDIN = '1')) then -- Handle SG or SDIN cases
			if(SG = '0' and SDIN = '1') then 
				MuxOut <= "000000" & DIN(9 downto 0); -- We must not store the instruction, only DIN (2^10) = 1024 possible values
			elsif (SG = '1' and SDIN = '0') then
				MuxOut <= AddSubResult;
			end if;
		elsif (SR /= "00000000" and (SG = '0' and SDIN = '0')) then -- handle SR case
			if(SR = "00000001") then
				MuxOut <= R0;
			elsif (SR = "00000010") then 
				MuxOut <= R1;
			elsif (SR = "00000100") then
				MuxOut <= R2;
			elsif (SR = "00001000") then
				MuxOut <= R3;
			elsif (SR = "00010000") then
				MuxOut <= R4;
			elsif (SR = "00100000") then
				MuxOut <= R5;
			elsif (SR = "01000000") then
				MuxOut <= R6;
			elsif (SR = "10000000") then
				MuxOut <= R7;
			end if;
		end if;
	end process;
end arch_mux;