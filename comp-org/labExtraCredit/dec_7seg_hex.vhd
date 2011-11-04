LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;
-- Hexadecimal to 7 Segment Decoder for LED Display
ENTITY dec_7seg_hex IS
PORT(
hex_digit : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
en : in std_logic;
segment_a, segment_b, segment_c, segment_d, segment_e, segment_f,
segment_g : OUT std_logic);
END dec_7seg_hex;
ARCHITECTURE a OF dec_7seg_hex IS
SIGNAL segment_data : STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN
PROCESS (Hex_digit)
-- HEX to 7 Segment Decoder for LED Display
BEGIN -- Hex-digit is the four bit binary value to display
if(en = '1') then
CASE Hex_digit IS
WHEN "0000" =>
segment_data <= "1111110";
WHEN "0001" =>
segment_data <= "0110000";
WHEN "0010" =>
segment_data <= "1101101";
WHEN "0011" =>
segment_data <= "1111001";
WHEN "0100" =>
segment_data <= "0110011";
WHEN "0101" =>
segment_data <= "1011011";
WHEN "0110" =>
segment_data <= "1011111";
When "0111" =>
segment_data <= "1110000";
When "1000" =>
segment_data <= "1111111";
When "1001" =>
segment_data <= "1111011";
When "1010" =>
segment_data <= "1110111";
When "1011" =>
segment_data <= "0011111";
When "1100" =>
segment_data <= "1001110";
When "1101" =>
segment_data <= "0111101";
When "1110" =>
segment_data <= "1001111";
When "1111" =>
segment_data <= "1000111";
WHEN OTHERS =>
segment_data <= "0111110";
END CASE;
end if;
END PROCESS;
-- extract segment data bits and invert
-- LED driver circuit is inverted
segment_a
<=
NOT
segment_data(6);
segment_b
<=
NOT
segment_data(5);
segment_c
<=
NOT
segment_data(4);
segment_d
<=
NOT
segment_data(3);
segment_e
<=
NOT
segment_data(2);
segment_f
<=
NOT
segment_data(1);
segment_g
<=
NOT
segment_data(0);
END a;