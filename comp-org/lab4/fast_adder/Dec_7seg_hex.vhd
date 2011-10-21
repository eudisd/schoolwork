library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-- hexadecimal to 7 segment decoder for led display
entity dec_7seg_hex is
	port(hex_digit : in std_logic_vector(3 downto 0);
		 segment_a, segment_b, segment_c, segment_d, segment_e, segment_f,
		 segment_g : out std_logic);
end dec_7seg_hex;

architecture a of dec_7seg_hex is
	signal segment_data : std_logic_vector(6 downto 0);
begin
	process (hex_digit)
		-- hex to 7 segment decoder for led display
	begin -- hex-digit is the four bit binary value to display
		case hex_digit is
			when "0000" =>
			segment_data <= "1111110";
			when "0001" =>
			segment_data <= "0110000";
			when "0010" =>
			segment_data <= "1101101";
			when "0011" =>
			segment_data <= "1111001";
			when "0100" =>
			segment_data <= "0110011";
			when "0101" =>
			segment_data <= "1011011";
			when "0110" =>
			segment_data <= "1011111";
			when "0111" =>
			segment_data <= "1110000";
			when "1000" =>
			segment_data <= "1111111";
			when "1001" =>
			segment_data <= "1111011";
			when "1010" =>
			segment_data <= "1110111";
			when "1011" =>
			segment_data <= "0011111";
			when "1100" =>
			segment_data <= "1001110";
			when "1101" =>
			segment_data <= "0111101";
			when "1110" =>
			segment_data <= "1001111";
			when "1111" =>
			segment_data <= "1000111";
			when others =>
			segment_data <= "0111110";
		end case;
	end process;
	-- extract segment data bits and invert
	-- led driver circuit is inverted
	segment_a
	<=
	not
	segment_data(6);
	segment_b
	<=
	not
	segment_data(5);
	segment_c
	<=
	not
	segment_data(4);
	segment_d
	<=
	not
	segment_data(3);
	segment_e
	<=
	not
	segment_data(2);
	segment_f
	<=
	not
	segment_data(1);
	segment_g
	<=
	not
	segment_data(0);
end a;