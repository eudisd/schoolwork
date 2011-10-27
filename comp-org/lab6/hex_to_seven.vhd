library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-- hexadecimal to 7 segment decoder for led display
entity hex_to_seven is
port(
input : in std_logic_vector(31 downto 0);
en : in std_logic;
hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7 : out std_logic_vector(6 downto 0)
);
end hex_to_seven;
architecture a of hex_to_seven is
component dec_7seg_hex
port(
hex_digit : in std_logic_vector(3 downto 0);
en : in std_logic;
segment_a, segment_b, segment_c, segment_d, segment_e, segment_f,
segment_g : out std_logic);
end component;
begin
d0: dec_7seg_hex port map
(
hex_digit(0) => input(0),
hex_digit(1) => input(1),
hex_digit(2) => input(2),
hex_digit(3) => input(3),
en => en,
segment_a => hex0(0),
segment_b => hex0(1),
segment_c => hex0(2),
segment_d => hex0(3),
segment_e => hex0(4),
segment_f => hex0(5),
segment_g => hex0(6)
);
d1:dec_7seg_hex port map
(
hex_digit(0) =>input(4),
hex_digit(1) =>input(5),
hex_digit(2) =>input(6),
hex_digit(3) =>input(7),
en => en,
segment_a => hex1(0),
segment_b => hex1(1),
segment_c => hex1(2),
segment_d => hex1(3),
segment_e => hex1(4),
segment_f => hex1(5),
segment_g => hex1(6)
);
d2:dec_7seg_hex port map
(
hex_digit(0) =>input(8),
hex_digit(1) =>input(9),

hex_digit(2) =>input(10),
hex_digit(3) =>input(11),
en => en,
segment_a => hex2(0),
segment_b => hex2(1),
segment_c => hex2(2),
segment_d => hex2(3),
segment_e => hex2(4),
segment_f => hex2(5),
segment_g => hex2(6)
);
d3:dec_7seg_hex port map
(
hex_digit(0) =>input(12),
hex_digit(1) =>input(13),
hex_digit(2) =>input(14),
hex_digit(3) =>input(15),
en => en,
segment_a => hex3(0),
segment_b => hex3(1),
segment_c => hex3(2),
segment_d => hex3(3),
segment_e => hex3(4),
segment_f => hex3(5),
segment_g => hex3(6)
);
d4:dec_7seg_hex port map
(
hex_digit(0) =>input(16),
hex_digit(1) =>input(17),
hex_digit(2) =>input(18),
hex_digit(3) =>input(19),
en => en,
segment_a => hex4(0),
segment_b => hex4(1),
segment_c => hex4(2),
segment_d => hex4(3),
segment_e => hex4(4),
segment_f => hex4(5),
segment_g => hex4(6)
);
d5:dec_7seg_hex port map
(
hex_digit(0) =>input(20),
hex_digit(1) =>input(21),
hex_digit(2) =>input(22),
hex_digit(3) =>input(23),
en => en,
segment_a => hex5(0),
segment_b => hex5(1),
segment_c => hex5(2),
segment_d => hex5(3),
segment_e => hex5(4),
segment_f => hex5(5),
segment_g => hex5(6)
);
d6:dec_7seg_hex port map
(
hex_digit(0) =>input(24),

hex_digit(1) =>input(25),
hex_digit(2) =>input(26),
hex_digit(3) =>input(27),
en => en,
segment_a => hex6(0),
segment_b => hex6(1),
segment_c => hex6(2),
segment_d => hex6(3),
segment_e => hex6(4),
segment_f => hex6(5),
segment_g => hex6(6)
);
d7:dec_7seg_hex port map
(
hex_digit(0) =>input(28),
hex_digit(1) =>input(29),
hex_digit(2) =>input(30),
hex_digit(3) =>input(31),
en => en,
segment_a => hex7(0),
segment_b => hex7(1),
segment_c => hex7(2),
segment_d => hex7(3),
segment_e => hex7(4),
segment_f => hex7(5),
segment_g => hex7(6)
);
end a;