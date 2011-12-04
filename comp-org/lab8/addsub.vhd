library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Sub = 0, Add = 1
entity addsub is
	port( a, b : in std_logic_vector(15 downto 0);
		  AddSub : in std_logic;
		  res : out std_logic_vector(15 downto 0)
		  );
end addsub;

architecture addsub_arch of addsub is 
begin
	process(a, b, AddSub)
	begin
		if(AddSub = '1') then
			res <= std_logic_vector(unsigned(a) + unsigned(b));
		elsif (AddSub = '0') then 
			res <= std_logic_vector(unsigned(a) - unsigned(b));
		end if;
	end process;
end addsub_arch;