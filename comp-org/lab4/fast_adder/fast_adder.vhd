library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fast_adder is
	port (
	clock_50_mhz :in std_logic;
	en :in std_logic;
	clock_user :in std_logic;
	data_user : in std_logic_vector(7 downto 0);
	address_user: in std_logic_vector(2 downto 0);
	sev_seg_output_1,sev_seg_output_2,sev_seg_output_3 : out std_logic_vector(3 downto 0));
end fast_adder;

architecture arch of fast_adder is
	component adder
		port (
		clock_50_mhz :in std_logic;
		en :in std_logic;
		data_registerfile : in std_logic_vector(7 downto 0);
		read_address: out std_logic_vector(2 downto 0);
		output : out std_logic_vector(11 downto 0));
	end component;

	component registerfile_8_by_8
		port ( clock4: in std_logic;
		w_addr: in std_logic_vector(2 downto 0);
		datain: in std_logic_vector(7 downto 0);
		r_addr: in std_logic_vector(2 downto 0);
		dataout: out std_logic_vector(7 downto 0));
	end component;
	signal data: std_logic_vector(7 downto 0);
	signal raddr : std_logic_vector(2 downto 0);
	signal output : std_logic_vector(11 downto 0);
begin
	sev_seg_output_1 <= output(11 downto 8);
	sev_seg_output_2 <= output(7 downto 4);
	sev_seg_output_3 <= output(3 downto 0);
	
	rf: registerfile_8_by_8 port map(
		clock4 => clock_user,
		w_addr => address_user,
		datain => data_user,
		r_addr => raddr,
		dataout => data);
		
	a: adder port map(
		clock_50_mhz => clock_50_mhz,
		en => en,
		data_registerfile => data,
		read_address => raddr,
		output => output);
	
end arch;