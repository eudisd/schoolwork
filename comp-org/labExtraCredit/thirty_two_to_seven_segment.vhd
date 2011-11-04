LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY Thirty_Two_to_Seven_Segment IS
	PORT(
	input : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	display : OUT std_logic_vector(55 downto 0)
	);
END Thirty_Two_to_Seven_Segment;

ARCHITECTURE a OF Thirty_Two_to_Seven_Segment IS
	component dec_7seg_hex
	PORT(
	hex_digit : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	en : in std_logic;
	segment_a, segment_b, segment_c, segment_d, segment_e, segment_f,
	segment_g : OUT std_logic);
	END component;
	
	signal en : std_logic := '1';
	signal HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7 :
	std_logic_vector(6 downto 0);
	
BEGIN
	en <= '1';
	display <= HEX7 & HEX6 & HEX5 & HEX4 & HEX3 & HEX2 & HEX1 & HEX0;
	
	d0: dec_7seg_hex port map
		(
		hex_digit(0) => input(0),
		hex_digit(1) => input(1),
		hex_digit(2) => input(2),
		hex_digit(3) => input(3),
		en => en,
		segment_a => HEX0(0),
		segment_b => HEX0(1),
		segment_c => HEX0(2),
		segment_d => HEX0(3),
		segment_e => HEX0(4),
		segment_f => HEX0(5),
		segment_g => HEX0(6)
		);
		
	d1:dec_7seg_hex port map
		(
		hex_digit(0) =>input(4),
		hex_digit(1) =>input(5),
		hex_digit(2) =>input(6),
		hex_digit(3) =>input(7),
		en => en,
		segment_a => HEX1(0),
		segment_b => HEX1(1),
		segment_c => HEX1(2),
		segment_d => HEX1(3),
		segment_e => HEX1(4),
		segment_f => HEX1(5),
		segment_g => HEX1(6)
		);
		
	d2:dec_7seg_hex port map
		(
		hex_digit(0) =>input(8),
		hex_digit(1) =>input(9),
		hex_digit(2) =>input(10),
		hex_digit(3) =>input(11),
		en => en,
		segment_a => HEX2(0),
		segment_b => HEX2(1),
		segment_c => HEX2(2),
		segment_d => HEX2(3),
		segment_e => HEX2(4),
		segment_f => HEX2(5),
		segment_g => HEX2(6)
		);
		
	d3:dec_7seg_hex port map
		(
		hex_digit(0) =>input(12),
		hex_digit(1) =>input(13),
		hex_digit(2) =>input(14),
		hex_digit(3) =>input(15),
		en => en,
		segment_a => HEX3(0),
		segment_b => HEX3(1),
		segment_c => HEX3(2),
		segment_d => HEX3(3),
		segment_e => HEX3(4),
		segment_f => HEX3(5),
		segment_g => HEX3(6)
		);
	d4:dec_7seg_hex port map
		(
		hex_digit(0) =>input(16),
		hex_digit(1) =>input(17),
		hex_digit(2) =>input(18),
		hex_digit(3) =>input(19),
		en => en,
		segment_a => HEX4(0),
		segment_b => HEX4(1),
		segment_c => HEX4(2),
		segment_d => HEX4(3),
		segment_e => HEX4(4),
		segment_f => HEX4(5),
		segment_g => HEX4(6)
		);
	d5:dec_7seg_hex port map
		(
		hex_digit(0) =>input(20),
		hex_digit(1) =>input(21),
		hex_digit(2) =>input(22),
		hex_digit(3) =>input(23),
		en => en,
		segment_a => HEX5(0),
		segment_b => HEX5(1),
		segment_c => HEX5(2),
		segment_d => HEX5(3),
		segment_e => HEX5(4),
		segment_f => HEX5(5),
		segment_g => HEX5(6)
		);
	d6:dec_7seg_hex port map
		(
		hex_digit(0) =>input(24),
		hex_digit(1) =>input(25),
		hex_digit(2) =>input(26),
		hex_digit(3) =>input(27),
		en => en,
		segment_a => HEX6(0),
		segment_b => HEX6(1),
		segment_c => HEX6(2),
		segment_d => HEX6(3),
		segment_e => HEX6(4),
		segment_f => HEX6(5),
		segment_g => HEX6(6)
		);
	d7:dec_7seg_hex port map
		(
		hex_digit(0) =>input(28),
		hex_digit(1) =>input(29),
		hex_digit(2) =>input(30),
		hex_digit(3) =>input(31),
		en => en,
		segment_a => HEX7(0),
		segment_b => HEX7(1),
		segment_c => HEX7(2),
		segment_d => HEX7(3),
		segment_e => HEX7(4),
		segment_f => HEX7(5),
		segment_g => HEX7(6)
		);
END a;
