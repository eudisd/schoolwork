-- Copyright (C) 1991-2008 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II"
-- VERSION "Version 8.0 Build 215 05/29/2008 SJ Full Version"

-- DATE "10/07/2011 12:43:30"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE, cycloneii;
USE IEEE.std_logic_1164.all;
USE cycloneii.cycloneii_components.all;

ENTITY 	registerfile IS
    PORT (
	clock4 : IN std_logic;
	w_addr : IN std_logic_vector(2 DOWNTO 0);
	datain : IN std_logic_vector(7 DOWNTO 0);
	r_addr : IN std_logic_vector(2 DOWNTO 0);
	dataout : OUT std_logic_vector(7 DOWNTO 0)
	);
END registerfile;

ARCHITECTURE structure OF registerfile IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock4 : std_logic;
SIGNAL ww_w_addr : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_datain : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_r_addr : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_dataout : std_logic_vector(7 DOWNTO 0);
SIGNAL \AND8|o~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \AND6|o~37clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \MUXA|o[0]~335_combout\ : std_logic;
SIGNAL \MUXA|o[2]~343_combout\ : std_logic;
SIGNAL \MUXA|o[3]~348_combout\ : std_logic;
SIGNAL \MUXA|o[4]~353_combout\ : std_logic;
SIGNAL \MUXA|o[4]~355_combout\ : std_logic;
SIGNAL \MUXA|o[5]~358_combout\ : std_logic;
SIGNAL \MUXA|o[7]~368_combout\ : std_logic;
SIGNAL \R6|r0|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R5|r0|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R1|r0|d_ff|slave|q~56_combout\ : std_logic;
SIGNAL \R8|r1|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R3|r1|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R4|r2|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R2|r2|d_ff|slave|q~56_combout\ : std_logic;
SIGNAL \R1|r2|d_ff|slave|q~56_combout\ : std_logic;
SIGNAL \R7|r2|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R4|r3|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R2|r3|d_ff|slave|q~56_combout\ : std_logic;
SIGNAL \R4|r4|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R2|r4|d_ff|slave|q~56_combout\ : std_logic;
SIGNAL \R5|r4|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R1|r4|d_ff|slave|q~56_combout\ : std_logic;
SIGNAL \R4|r5|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R2|r5|d_ff|slave|q~56_combout\ : std_logic;
SIGNAL \R1|r5|d_ff|slave|q~56_combout\ : std_logic;
SIGNAL \R7|r5|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R2|r6|d_ff|slave|q~56_combout\ : std_logic;
SIGNAL \R8|r6|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R1|r6|d_ff|slave|q~56_combout\ : std_logic;
SIGNAL \R7|r6|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R4|r7|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R2|r7|d_ff|slave|q~56_combout\ : std_logic;
SIGNAL \R3|r7|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R1|r7|d_ff|slave|q~56_combout\ : std_logic;
SIGNAL \R6|r0|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R3|r0|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R5|r0|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R1|r0|d_ff|master|q~57_combout\ : std_logic;
SIGNAL \R8|r1|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R3|r1|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R4|r2|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R2|r2|d_ff|master|q~57_combout\ : std_logic;
SIGNAL \R1|r2|d_ff|master|q~57_combout\ : std_logic;
SIGNAL \R7|r2|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R4|r3|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R2|r3|d_ff|master|q~57_combout\ : std_logic;
SIGNAL \R3|r3|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R1|r3|d_ff|master|q~57_combout\ : std_logic;
SIGNAL \R4|r4|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R2|r4|d_ff|master|q~57_combout\ : std_logic;
SIGNAL \R5|r4|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R1|r4|d_ff|master|q~57_combout\ : std_logic;
SIGNAL \R4|r5|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R2|r5|d_ff|master|q~57_combout\ : std_logic;
SIGNAL \R1|r5|d_ff|master|q~57_combout\ : std_logic;
SIGNAL \R7|r5|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R2|r6|d_ff|master|q~57_combout\ : std_logic;
SIGNAL \R8|r6|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R1|r6|d_ff|master|q~57_combout\ : std_logic;
SIGNAL \R7|r6|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R4|r7|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R2|r7|d_ff|master|q~57_combout\ : std_logic;
SIGNAL \R3|r7|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R5|r7|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R1|r7|d_ff|master|q~57_combout\ : std_logic;
SIGNAL \AND2|o~25_combout\ : std_logic;
SIGNAL \R2|r0|d_ff|master|q~57_combout\ : std_logic;
SIGNAL \R2|r0|d_ff|slave|q~56_combout\ : std_logic;
SIGNAL \AND3|o~27_combout\ : std_logic;
SIGNAL \R4|r0|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R4|r0|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[0]~333_combout\ : std_logic;
SIGNAL \clock4~combout\ : std_logic;
SIGNAL \AND8|o~combout\ : std_logic;
SIGNAL \AND8|o~clkctrl_outclk\ : std_logic;
SIGNAL \R8|r0|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R8|r0|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[0]~334_combout\ : std_logic;
SIGNAL \R3|r0|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \DEC|Equal0~72_combout\ : std_logic;
SIGNAL \R7|r0|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R7|r0|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[0]~336_combout\ : std_logic;
SIGNAL \MUXA|o[0]~337_combout\ : std_logic;
SIGNAL \R7|r1|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R7|r1|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R1|r1|d_ff|master|q~57_combout\ : std_logic;
SIGNAL \R1|r1|d_ff|slave|q~56_combout\ : std_logic;
SIGNAL \AND6|o~38_combout\ : std_logic;
SIGNAL \R5|r1|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R5|r1|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[1]~340_combout\ : std_logic;
SIGNAL \MUXA|o[1]~341_combout\ : std_logic;
SIGNAL \R2|r1|d_ff|master|q~57_combout\ : std_logic;
SIGNAL \R2|r1|d_ff|slave|q~56_combout\ : std_logic;
SIGNAL \R4|r1|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R4|r1|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[1]~338_combout\ : std_logic;
SIGNAL \AND6|o~37_combout\ : std_logic;
SIGNAL \AND6|o~37clkctrl_outclk\ : std_logic;
SIGNAL \R6|r1|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R6|r1|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[1]~339_combout\ : std_logic;
SIGNAL \MUXA|o[1]~342_combout\ : std_logic;
SIGNAL \R5|r2|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R5|r2|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[2]~345_combout\ : std_logic;
SIGNAL \R3|r2|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R3|r2|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[2]~346_combout\ : std_logic;
SIGNAL \R8|r2|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R8|r2|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R6|r2|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R6|r2|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[2]~344_combout\ : std_logic;
SIGNAL \MUXA|o[2]~347_combout\ : std_logic;
SIGNAL \R7|r3|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R7|r3|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R5|r3|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R5|r3|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R1|r3|d_ff|slave|q~56_combout\ : std_logic;
SIGNAL \MUXA|o[3]~350_combout\ : std_logic;
SIGNAL \R3|r3|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[3]~351_combout\ : std_logic;
SIGNAL \R8|r3|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R8|r3|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R6|r3|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R6|r3|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[3]~349_combout\ : std_logic;
SIGNAL \MUXA|o[3]~352_combout\ : std_logic;
SIGNAL \R8|r4|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R8|r4|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R6|r4|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R6|r4|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[4]~354_combout\ : std_logic;
SIGNAL \R7|r4|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R7|r4|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R3|r4|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R3|r4|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[4]~356_combout\ : std_logic;
SIGNAL \MUXA|o[4]~357_combout\ : std_logic;
SIGNAL \R5|r5|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R5|r5|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[5]~360_combout\ : std_logic;
SIGNAL \R3|r5|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R3|r5|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[5]~361_combout\ : std_logic;
SIGNAL \R6|r5|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R6|r5|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R8|r5|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R8|r5|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[5]~359_combout\ : std_logic;
SIGNAL \MUXA|o[5]~362_combout\ : std_logic;
SIGNAL \DEC|Equal0~71_combout\ : std_logic;
SIGNAL \R5|r6|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R5|r6|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[6]~365_combout\ : std_logic;
SIGNAL \R3|r6|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R3|r6|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[6]~366_combout\ : std_logic;
SIGNAL \R4|r6|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R4|r6|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[6]~363_combout\ : std_logic;
SIGNAL \R6|r6|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R6|r6|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[6]~364_combout\ : std_logic;
SIGNAL \MUXA|o[6]~367_combout\ : std_logic;
SIGNAL \R5|r7|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[7]~370_combout\ : std_logic;
SIGNAL \R7|r7|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R7|r7|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[7]~371_combout\ : std_logic;
SIGNAL \R6|r7|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R6|r7|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \R8|r7|d_ff|master|q~65_combout\ : std_logic;
SIGNAL \R8|r7|d_ff|slave|q~64_combout\ : std_logic;
SIGNAL \MUXA|o[7]~369_combout\ : std_logic;
SIGNAL \MUXA|o[7]~372_combout\ : std_logic;
SIGNAL \datain~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \r_addr~combout\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \w_addr~combout\ : std_logic_vector(2 DOWNTO 0);

BEGIN

ww_clock4 <= clock4;
ww_w_addr <= w_addr;
ww_datain <= datain;
ww_r_addr <= r_addr;
dataout <= ww_dataout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\AND8|o~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \AND8|o~combout\);

\AND6|o~37clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \AND6|o~37_combout\);

\MUXA|o[0]~335\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[0]~335_combout\ = \r_addr~combout\(1) & (\r_addr~combout\(0)) # !\r_addr~combout\(1) & (\r_addr~combout\(0) & (!\R5|r0|d_ff|slave|q~64_combout\) # !\r_addr~combout\(0) & !\R1|r0|d_ff|slave|q~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000111110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_addr~combout\(1),
	datab => \R1|r0|d_ff|slave|q~56_combout\,
	datac => \r_addr~combout\(0),
	datad => \R5|r0|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[0]~335_combout\);

\MUXA|o[2]~343\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[2]~343_combout\ = \r_addr~combout\(0) & (\r_addr~combout\(1)) # !\r_addr~combout\(0) & (\r_addr~combout\(1) & (!\R4|r2|d_ff|slave|q~64_combout\) # !\r_addr~combout\(1) & !\R2|r2|d_ff|slave|q~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000111110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R2|r2|d_ff|slave|q~56_combout\,
	datab => \r_addr~combout\(0),
	datac => \r_addr~combout\(1),
	datad => \R4|r2|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[2]~343_combout\);

\MUXA|o[3]~348\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[3]~348_combout\ = \r_addr~combout\(1) & (\r_addr~combout\(0) # !\R4|r3|d_ff|slave|q~64_combout\) # !\r_addr~combout\(1) & !\R2|r3|d_ff|slave|q~56_combout\ & !\r_addr~combout\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_addr~combout\(1),
	datab => \R2|r3|d_ff|slave|q~56_combout\,
	datac => \r_addr~combout\(0),
	datad => \R4|r3|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[3]~348_combout\);

\MUXA|o[4]~353\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[4]~353_combout\ = \r_addr~combout\(1) & (\r_addr~combout\(0) # !\R4|r4|d_ff|slave|q~64_combout\) # !\r_addr~combout\(1) & !\R2|r4|d_ff|slave|q~56_combout\ & !\r_addr~combout\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_addr~combout\(1),
	datab => \R2|r4|d_ff|slave|q~56_combout\,
	datac => \r_addr~combout\(0),
	datad => \R4|r4|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[4]~353_combout\);

\MUXA|o[4]~355\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[4]~355_combout\ = \r_addr~combout\(1) & \r_addr~combout\(0) # !\r_addr~combout\(1) & (\r_addr~combout\(0) & !\R5|r4|d_ff|slave|q~64_combout\ # !\r_addr~combout\(0) & (!\R1|r4|d_ff|slave|q~56_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_addr~combout\(1),
	datab => \r_addr~combout\(0),
	datac => \R5|r4|d_ff|slave|q~64_combout\,
	datad => \R1|r4|d_ff|slave|q~56_combout\,
	combout => \MUXA|o[4]~355_combout\);

\MUXA|o[5]~358\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[5]~358_combout\ = \r_addr~combout\(0) & (\r_addr~combout\(1)) # !\r_addr~combout\(0) & (\r_addr~combout\(1) & (!\R4|r5|d_ff|slave|q~64_combout\) # !\r_addr~combout\(1) & !\R2|r5|d_ff|slave|q~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000111110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_addr~combout\(0),
	datab => \R2|r5|d_ff|slave|q~56_combout\,
	datac => \r_addr~combout\(1),
	datad => \R4|r5|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[5]~358_combout\);

\MUXA|o[7]~368\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[7]~368_combout\ = \r_addr~combout\(0) & \r_addr~combout\(1) # !\r_addr~combout\(0) & (\r_addr~combout\(1) & (!\R4|r7|d_ff|slave|q~64_combout\) # !\r_addr~combout\(1) & !\R2|r7|d_ff|slave|q~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_addr~combout\(0),
	datab => \r_addr~combout\(1),
	datac => \R2|r7|d_ff|slave|q~56_combout\,
	datad => \R4|r7|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[7]~368_combout\);

\R6|r0|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R6|r0|d_ff|slave|q~64_combout\ = GLOBAL(\AND6|o~37clkctrl_outclk\) & (\R6|r0|d_ff|master|q~65_combout\) # !GLOBAL(\AND6|o~37clkctrl_outclk\) & \R6|r0|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R6|r0|d_ff|slave|q~64_combout\,
	datac => \AND6|o~37clkctrl_outclk\,
	datad => \R6|r0|d_ff|master|q~65_combout\,
	combout => \R6|r0|d_ff|slave|q~64_combout\);

\R5|r0|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R5|r0|d_ff|slave|q~64_combout\ = \DEC|Equal0~71_combout\ & (\AND6|o~38_combout\ & \R5|r0|d_ff|master|q~65_combout\ # !\AND6|o~38_combout\ & (\R5|r0|d_ff|slave|q~64_combout\)) # !\DEC|Equal0~71_combout\ & (\R5|r0|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DEC|Equal0~71_combout\,
	datab => \R5|r0|d_ff|master|q~65_combout\,
	datac => \AND6|o~38_combout\,
	datad => \R5|r0|d_ff|slave|q~64_combout\,
	combout => \R5|r0|d_ff|slave|q~64_combout\);

\R1|r0|d_ff|slave|q~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r0|d_ff|slave|q~56_combout\ = \w_addr~combout\(0) & (\R1|r0|d_ff|slave|q~56_combout\) # !\w_addr~combout\(0) & (\AND2|o~25_combout\ & \R1|r0|d_ff|master|q~57_combout\ # !\AND2|o~25_combout\ & (\R1|r0|d_ff|slave|q~56_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R1|r0|d_ff|master|q~57_combout\,
	datab => \R1|r0|d_ff|slave|q~56_combout\,
	datac => \w_addr~combout\(0),
	datad => \AND2|o~25_combout\,
	combout => \R1|r0|d_ff|slave|q~56_combout\);

\R8|r1|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R8|r1|d_ff|slave|q~64_combout\ = GLOBAL(\AND8|o~clkctrl_outclk\) & (\R8|r1|d_ff|master|q~65_combout\) # !GLOBAL(\AND8|o~clkctrl_outclk\) & \R8|r1|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \AND8|o~clkctrl_outclk\,
	datac => \R8|r1|d_ff|slave|q~64_combout\,
	datad => \R8|r1|d_ff|master|q~65_combout\,
	combout => \R8|r1|d_ff|slave|q~64_combout\);

\R3|r1|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r1|d_ff|slave|q~64_combout\ = \w_addr~combout\(0) & (\R3|r1|d_ff|slave|q~64_combout\) # !\w_addr~combout\(0) & (\AND3|o~27_combout\ & \R3|r1|d_ff|master|q~65_combout\ # !\AND3|o~27_combout\ & (\R3|r1|d_ff|slave|q~64_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(0),
	datab => \R3|r1|d_ff|master|q~65_combout\,
	datac => \AND3|o~27_combout\,
	datad => \R3|r1|d_ff|slave|q~64_combout\,
	combout => \R3|r1|d_ff|slave|q~64_combout\);

\R4|r2|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r2|d_ff|slave|q~64_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & (\R4|r2|d_ff|master|q~65_combout\) # !\w_addr~combout\(0) & \R4|r2|d_ff|slave|q~64_combout\) # !\AND3|o~27_combout\ & \R4|r2|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND3|o~27_combout\,
	datab => \R4|r2|d_ff|slave|q~64_combout\,
	datac => \w_addr~combout\(0),
	datad => \R4|r2|d_ff|master|q~65_combout\,
	combout => \R4|r2|d_ff|slave|q~64_combout\);

\R2|r2|d_ff|slave|q~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r2|d_ff|slave|q~56_combout\ = \AND2|o~25_combout\ & (\w_addr~combout\(0) & (\R2|r2|d_ff|master|q~57_combout\) # !\w_addr~combout\(0) & \R2|r2|d_ff|slave|q~56_combout\) # !\AND2|o~25_combout\ & \R2|r2|d_ff|slave|q~56_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R2|r2|d_ff|slave|q~56_combout\,
	datab => \AND2|o~25_combout\,
	datac => \w_addr~combout\(0),
	datad => \R2|r2|d_ff|master|q~57_combout\,
	combout => \R2|r2|d_ff|slave|q~56_combout\);

\R1|r2|d_ff|slave|q~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r2|d_ff|slave|q~56_combout\ = \AND2|o~25_combout\ & (\w_addr~combout\(0) & \R1|r2|d_ff|slave|q~56_combout\ # !\w_addr~combout\(0) & (\R1|r2|d_ff|master|q~57_combout\)) # !\AND2|o~25_combout\ & \R1|r2|d_ff|slave|q~56_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R1|r2|d_ff|slave|q~56_combout\,
	datab => \AND2|o~25_combout\,
	datac => \w_addr~combout\(0),
	datad => \R1|r2|d_ff|master|q~57_combout\,
	combout => \R1|r2|d_ff|slave|q~56_combout\);

\R7|r2|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R7|r2|d_ff|slave|q~64_combout\ = \clock4~combout\ & (\DEC|Equal0~72_combout\ & \R7|r2|d_ff|master|q~65_combout\ # !\DEC|Equal0~72_combout\ & (\R7|r2|d_ff|slave|q~64_combout\)) # !\clock4~combout\ & (\R7|r2|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R7|r2|d_ff|master|q~65_combout\,
	datab => \R7|r2|d_ff|slave|q~64_combout\,
	datac => \clock4~combout\,
	datad => \DEC|Equal0~72_combout\,
	combout => \R7|r2|d_ff|slave|q~64_combout\);

\R4|r3|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r3|d_ff|slave|q~64_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & (\R4|r3|d_ff|master|q~65_combout\) # !\w_addr~combout\(0) & \R4|r3|d_ff|slave|q~64_combout\) # !\AND3|o~27_combout\ & \R4|r3|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R4|r3|d_ff|slave|q~64_combout\,
	datab => \AND3|o~27_combout\,
	datac => \w_addr~combout\(0),
	datad => \R4|r3|d_ff|master|q~65_combout\,
	combout => \R4|r3|d_ff|slave|q~64_combout\);

\R2|r3|d_ff|slave|q~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r3|d_ff|slave|q~56_combout\ = \AND2|o~25_combout\ & (\w_addr~combout\(0) & (\R2|r3|d_ff|master|q~57_combout\) # !\w_addr~combout\(0) & \R2|r3|d_ff|slave|q~56_combout\) # !\AND2|o~25_combout\ & \R2|r3|d_ff|slave|q~56_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND2|o~25_combout\,
	datab => \R2|r3|d_ff|slave|q~56_combout\,
	datac => \w_addr~combout\(0),
	datad => \R2|r3|d_ff|master|q~57_combout\,
	combout => \R2|r3|d_ff|slave|q~56_combout\);

\R4|r4|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r4|d_ff|slave|q~64_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & (\R4|r4|d_ff|master|q~65_combout\) # !\w_addr~combout\(0) & \R4|r4|d_ff|slave|q~64_combout\) # !\AND3|o~27_combout\ & \R4|r4|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R4|r4|d_ff|slave|q~64_combout\,
	datab => \AND3|o~27_combout\,
	datac => \R4|r4|d_ff|master|q~65_combout\,
	datad => \w_addr~combout\(0),
	combout => \R4|r4|d_ff|slave|q~64_combout\);

\R2|r4|d_ff|slave|q~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r4|d_ff|slave|q~56_combout\ = \w_addr~combout\(0) & (\AND2|o~25_combout\ & (\R2|r4|d_ff|master|q~57_combout\) # !\AND2|o~25_combout\ & \R2|r4|d_ff|slave|q~56_combout\) # !\w_addr~combout\(0) & \R2|r4|d_ff|slave|q~56_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(0),
	datab => \R2|r4|d_ff|slave|q~56_combout\,
	datac => \AND2|o~25_combout\,
	datad => \R2|r4|d_ff|master|q~57_combout\,
	combout => \R2|r4|d_ff|slave|q~56_combout\);

\R5|r4|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R5|r4|d_ff|slave|q~64_combout\ = \AND6|o~38_combout\ & (\DEC|Equal0~71_combout\ & \R5|r4|d_ff|master|q~65_combout\ # !\DEC|Equal0~71_combout\ & (\R5|r4|d_ff|slave|q~64_combout\)) # !\AND6|o~38_combout\ & (\R5|r4|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND6|o~38_combout\,
	datab => \R5|r4|d_ff|master|q~65_combout\,
	datac => \R5|r4|d_ff|slave|q~64_combout\,
	datad => \DEC|Equal0~71_combout\,
	combout => \R5|r4|d_ff|slave|q~64_combout\);

\R1|r4|d_ff|slave|q~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r4|d_ff|slave|q~56_combout\ = \w_addr~combout\(0) & (\R1|r4|d_ff|slave|q~56_combout\) # !\w_addr~combout\(0) & (\AND2|o~25_combout\ & \R1|r4|d_ff|master|q~57_combout\ # !\AND2|o~25_combout\ & (\R1|r4|d_ff|slave|q~56_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(0),
	datab => \R1|r4|d_ff|master|q~57_combout\,
	datac => \AND2|o~25_combout\,
	datad => \R1|r4|d_ff|slave|q~56_combout\,
	combout => \R1|r4|d_ff|slave|q~56_combout\);

\R4|r5|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r5|d_ff|slave|q~64_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & \R4|r5|d_ff|master|q~65_combout\ # !\w_addr~combout\(0) & (\R4|r5|d_ff|slave|q~64_combout\)) # !\AND3|o~27_combout\ & (\R4|r5|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND3|o~27_combout\,
	datab => \R4|r5|d_ff|master|q~65_combout\,
	datac => \w_addr~combout\(0),
	datad => \R4|r5|d_ff|slave|q~64_combout\,
	combout => \R4|r5|d_ff|slave|q~64_combout\);

\R2|r5|d_ff|slave|q~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r5|d_ff|slave|q~56_combout\ = \AND2|o~25_combout\ & (\w_addr~combout\(0) & \R2|r5|d_ff|master|q~57_combout\ # !\w_addr~combout\(0) & (\R2|r5|d_ff|slave|q~56_combout\)) # !\AND2|o~25_combout\ & (\R2|r5|d_ff|slave|q~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND2|o~25_combout\,
	datab => \R2|r5|d_ff|master|q~57_combout\,
	datac => \w_addr~combout\(0),
	datad => \R2|r5|d_ff|slave|q~56_combout\,
	combout => \R2|r5|d_ff|slave|q~56_combout\);

\R1|r5|d_ff|slave|q~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r5|d_ff|slave|q~56_combout\ = \AND2|o~25_combout\ & (\w_addr~combout\(0) & (\R1|r5|d_ff|slave|q~56_combout\) # !\w_addr~combout\(0) & \R1|r5|d_ff|master|q~57_combout\) # !\AND2|o~25_combout\ & (\R1|r5|d_ff|slave|q~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND2|o~25_combout\,
	datab => \R1|r5|d_ff|master|q~57_combout\,
	datac => \w_addr~combout\(0),
	datad => \R1|r5|d_ff|slave|q~56_combout\,
	combout => \R1|r5|d_ff|slave|q~56_combout\);

\R7|r5|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R7|r5|d_ff|slave|q~64_combout\ = \DEC|Equal0~72_combout\ & (\clock4~combout\ & \R7|r5|d_ff|master|q~65_combout\ # !\clock4~combout\ & (\R7|r5|d_ff|slave|q~64_combout\)) # !\DEC|Equal0~72_combout\ & (\R7|r5|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DEC|Equal0~72_combout\,
	datab => \clock4~combout\,
	datac => \R7|r5|d_ff|master|q~65_combout\,
	datad => \R7|r5|d_ff|slave|q~64_combout\,
	combout => \R7|r5|d_ff|slave|q~64_combout\);

\R2|r6|d_ff|slave|q~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r6|d_ff|slave|q~56_combout\ = \AND2|o~25_combout\ & (\w_addr~combout\(0) & \R2|r6|d_ff|master|q~57_combout\ # !\w_addr~combout\(0) & (\R2|r6|d_ff|slave|q~56_combout\)) # !\AND2|o~25_combout\ & (\R2|r6|d_ff|slave|q~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND2|o~25_combout\,
	datab => \R2|r6|d_ff|master|q~57_combout\,
	datac => \w_addr~combout\(0),
	datad => \R2|r6|d_ff|slave|q~56_combout\,
	combout => \R2|r6|d_ff|slave|q~56_combout\);

\R8|r6|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R8|r6|d_ff|slave|q~64_combout\ = GLOBAL(\AND8|o~clkctrl_outclk\) & (\R8|r6|d_ff|master|q~65_combout\) # !GLOBAL(\AND8|o~clkctrl_outclk\) & \R8|r6|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \AND8|o~clkctrl_outclk\,
	datac => \R8|r6|d_ff|slave|q~64_combout\,
	datad => \R8|r6|d_ff|master|q~65_combout\,
	combout => \R8|r6|d_ff|slave|q~64_combout\);

\R1|r6|d_ff|slave|q~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r6|d_ff|slave|q~56_combout\ = \AND2|o~25_combout\ & (\w_addr~combout\(0) & (\R1|r6|d_ff|slave|q~56_combout\) # !\w_addr~combout\(0) & \R1|r6|d_ff|master|q~57_combout\) # !\AND2|o~25_combout\ & (\R1|r6|d_ff|slave|q~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND2|o~25_combout\,
	datab => \R1|r6|d_ff|master|q~57_combout\,
	datac => \w_addr~combout\(0),
	datad => \R1|r6|d_ff|slave|q~56_combout\,
	combout => \R1|r6|d_ff|slave|q~56_combout\);

\R7|r6|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R7|r6|d_ff|slave|q~64_combout\ = \clock4~combout\ & (\DEC|Equal0~72_combout\ & \R7|r6|d_ff|master|q~65_combout\ # !\DEC|Equal0~72_combout\ & (\R7|r6|d_ff|slave|q~64_combout\)) # !\clock4~combout\ & (\R7|r6|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R7|r6|d_ff|master|q~65_combout\,
	datab => \clock4~combout\,
	datac => \DEC|Equal0~72_combout\,
	datad => \R7|r6|d_ff|slave|q~64_combout\,
	combout => \R7|r6|d_ff|slave|q~64_combout\);

\R4|r7|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r7|d_ff|slave|q~64_combout\ = \w_addr~combout\(0) & (\AND3|o~27_combout\ & (\R4|r7|d_ff|master|q~65_combout\) # !\AND3|o~27_combout\ & \R4|r7|d_ff|slave|q~64_combout\) # !\w_addr~combout\(0) & \R4|r7|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R4|r7|d_ff|slave|q~64_combout\,
	datab => \R4|r7|d_ff|master|q~65_combout\,
	datac => \w_addr~combout\(0),
	datad => \AND3|o~27_combout\,
	combout => \R4|r7|d_ff|slave|q~64_combout\);

\R2|r7|d_ff|slave|q~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r7|d_ff|slave|q~56_combout\ = \AND2|o~25_combout\ & (\w_addr~combout\(0) & (\R2|r7|d_ff|master|q~57_combout\) # !\w_addr~combout\(0) & \R2|r7|d_ff|slave|q~56_combout\) # !\AND2|o~25_combout\ & \R2|r7|d_ff|slave|q~56_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND2|o~25_combout\,
	datab => \R2|r7|d_ff|slave|q~56_combout\,
	datac => \w_addr~combout\(0),
	datad => \R2|r7|d_ff|master|q~57_combout\,
	combout => \R2|r7|d_ff|slave|q~56_combout\);

\R3|r7|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r7|d_ff|slave|q~64_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & (\R3|r7|d_ff|slave|q~64_combout\) # !\w_addr~combout\(0) & \R3|r7|d_ff|master|q~65_combout\) # !\AND3|o~27_combout\ & (\R3|r7|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R3|r7|d_ff|master|q~65_combout\,
	datab => \AND3|o~27_combout\,
	datac => \w_addr~combout\(0),
	datad => \R3|r7|d_ff|slave|q~64_combout\,
	combout => \R3|r7|d_ff|slave|q~64_combout\);

\R1|r7|d_ff|slave|q~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r7|d_ff|slave|q~56_combout\ = \w_addr~combout\(0) & \R1|r7|d_ff|slave|q~56_combout\ # !\w_addr~combout\(0) & (\AND2|o~25_combout\ & (\R1|r7|d_ff|master|q~57_combout\) # !\AND2|o~25_combout\ & \R1|r7|d_ff|slave|q~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R1|r7|d_ff|slave|q~56_combout\,
	datab => \R1|r7|d_ff|master|q~57_combout\,
	datac => \w_addr~combout\(0),
	datad => \AND2|o~25_combout\,
	combout => \R1|r7|d_ff|slave|q~56_combout\);

\R6|r0|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R6|r0|d_ff|master|q~65_combout\ = GLOBAL(\AND6|o~37clkctrl_outclk\) & !\datain~combout\(0) # !GLOBAL(\AND6|o~37clkctrl_outclk\) & (\R6|r0|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(0),
	datac => \AND6|o~37clkctrl_outclk\,
	datad => \R6|r0|d_ff|master|q~65_combout\,
	combout => \R6|r0|d_ff|master|q~65_combout\);

\R3|r0|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r0|d_ff|master|q~65_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & (\R3|r0|d_ff|master|q~65_combout\) # !\w_addr~combout\(0) & !\datain~combout\(0)) # !\AND3|o~27_combout\ & (\R3|r0|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(0),
	datab => \AND3|o~27_combout\,
	datac => \w_addr~combout\(0),
	datad => \R3|r0|d_ff|master|q~65_combout\,
	combout => \R3|r0|d_ff|master|q~65_combout\);

\R5|r0|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R5|r0|d_ff|master|q~65_combout\ = \AND6|o~38_combout\ & (\DEC|Equal0~71_combout\ & !\datain~combout\(0) # !\DEC|Equal0~71_combout\ & (\R5|r0|d_ff|master|q~65_combout\)) # !\AND6|o~38_combout\ & (\R5|r0|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(0),
	datab => \R5|r0|d_ff|master|q~65_combout\,
	datac => \AND6|o~38_combout\,
	datad => \DEC|Equal0~71_combout\,
	combout => \R5|r0|d_ff|master|q~65_combout\);

\R1|r0|d_ff|master|q~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r0|d_ff|master|q~57_combout\ = \w_addr~combout\(0) & \R1|r0|d_ff|master|q~57_combout\ # !\w_addr~combout\(0) & (\AND2|o~25_combout\ & (!\datain~combout\(0)) # !\AND2|o~25_combout\ & \R1|r0|d_ff|master|q~57_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(0),
	datab => \R1|r0|d_ff|master|q~57_combout\,
	datac => \datain~combout\(0),
	datad => \AND2|o~25_combout\,
	combout => \R1|r0|d_ff|master|q~57_combout\);

\R8|r1|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R8|r1|d_ff|master|q~65_combout\ = GLOBAL(\AND8|o~clkctrl_outclk\) & !\datain~combout\(1) # !GLOBAL(\AND8|o~clkctrl_outclk\) & (\R8|r1|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(1),
	datac => \R8|r1|d_ff|master|q~65_combout\,
	datad => \AND8|o~clkctrl_outclk\,
	combout => \R8|r1|d_ff|master|q~65_combout\);

\R3|r1|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r1|d_ff|master|q~65_combout\ = \w_addr~combout\(0) & (\R3|r1|d_ff|master|q~65_combout\) # !\w_addr~combout\(0) & (\AND3|o~27_combout\ & !\datain~combout\(1) # !\AND3|o~27_combout\ & (\R3|r1|d_ff|master|q~65_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(0),
	datab => \datain~combout\(1),
	datac => \AND3|o~27_combout\,
	datad => \R3|r1|d_ff|master|q~65_combout\,
	combout => \R3|r1|d_ff|master|q~65_combout\);

\R4|r2|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r2|d_ff|master|q~65_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & (!\datain~combout\(2)) # !\w_addr~combout\(0) & \R4|r2|d_ff|master|q~65_combout\) # !\AND3|o~27_combout\ & \R4|r2|d_ff|master|q~65_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND3|o~27_combout\,
	datab => \R4|r2|d_ff|master|q~65_combout\,
	datac => \w_addr~combout\(0),
	datad => \datain~combout\(2),
	combout => \R4|r2|d_ff|master|q~65_combout\);

\R2|r2|d_ff|master|q~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r2|d_ff|master|q~57_combout\ = \AND2|o~25_combout\ & (\w_addr~combout\(0) & !\datain~combout\(2) # !\w_addr~combout\(0) & (\R2|r2|d_ff|master|q~57_combout\)) # !\AND2|o~25_combout\ & (\R2|r2|d_ff|master|q~57_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(2),
	datab => \AND2|o~25_combout\,
	datac => \w_addr~combout\(0),
	datad => \R2|r2|d_ff|master|q~57_combout\,
	combout => \R2|r2|d_ff|master|q~57_combout\);

\R1|r2|d_ff|master|q~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r2|d_ff|master|q~57_combout\ = \AND2|o~25_combout\ & (\w_addr~combout\(0) & (\R1|r2|d_ff|master|q~57_combout\) # !\w_addr~combout\(0) & !\datain~combout\(2)) # !\AND2|o~25_combout\ & (\R1|r2|d_ff|master|q~57_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(2),
	datab => \AND2|o~25_combout\,
	datac => \w_addr~combout\(0),
	datad => \R1|r2|d_ff|master|q~57_combout\,
	combout => \R1|r2|d_ff|master|q~57_combout\);

\R7|r2|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R7|r2|d_ff|master|q~65_combout\ = \clock4~combout\ & (\DEC|Equal0~72_combout\ & (!\datain~combout\(2)) # !\DEC|Equal0~72_combout\ & \R7|r2|d_ff|master|q~65_combout\) # !\clock4~combout\ & \R7|r2|d_ff|master|q~65_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R7|r2|d_ff|master|q~65_combout\,
	datab => \datain~combout\(2),
	datac => \clock4~combout\,
	datad => \DEC|Equal0~72_combout\,
	combout => \R7|r2|d_ff|master|q~65_combout\);

\R4|r3|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r3|d_ff|master|q~65_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & !\datain~combout\(3) # !\w_addr~combout\(0) & (\R4|r3|d_ff|master|q~65_combout\)) # !\AND3|o~27_combout\ & (\R4|r3|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(3),
	datab => \AND3|o~27_combout\,
	datac => \w_addr~combout\(0),
	datad => \R4|r3|d_ff|master|q~65_combout\,
	combout => \R4|r3|d_ff|master|q~65_combout\);

\R2|r3|d_ff|master|q~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r3|d_ff|master|q~57_combout\ = \AND2|o~25_combout\ & (\w_addr~combout\(0) & !\datain~combout\(3) # !\w_addr~combout\(0) & (\R2|r3|d_ff|master|q~57_combout\)) # !\AND2|o~25_combout\ & (\R2|r3|d_ff|master|q~57_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(3),
	datab => \AND2|o~25_combout\,
	datac => \w_addr~combout\(0),
	datad => \R2|r3|d_ff|master|q~57_combout\,
	combout => \R2|r3|d_ff|master|q~57_combout\);

\R3|r3|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r3|d_ff|master|q~65_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & \R3|r3|d_ff|master|q~65_combout\ # !\w_addr~combout\(0) & (!\datain~combout\(3))) # !\AND3|o~27_combout\ & \R3|r3|d_ff|master|q~65_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND3|o~27_combout\,
	datab => \R3|r3|d_ff|master|q~65_combout\,
	datac => \w_addr~combout\(0),
	datad => \datain~combout\(3),
	combout => \R3|r3|d_ff|master|q~65_combout\);

\R1|r3|d_ff|master|q~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r3|d_ff|master|q~57_combout\ = \AND2|o~25_combout\ & (\w_addr~combout\(0) & (\R1|r3|d_ff|master|q~57_combout\) # !\w_addr~combout\(0) & !\datain~combout\(3)) # !\AND2|o~25_combout\ & (\R1|r3|d_ff|master|q~57_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(3),
	datab => \AND2|o~25_combout\,
	datac => \w_addr~combout\(0),
	datad => \R1|r3|d_ff|master|q~57_combout\,
	combout => \R1|r3|d_ff|master|q~57_combout\);

\R4|r4|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r4|d_ff|master|q~65_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & (!\datain~combout\(4)) # !\w_addr~combout\(0) & \R4|r4|d_ff|master|q~65_combout\) # !\AND3|o~27_combout\ & \R4|r4|d_ff|master|q~65_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R4|r4|d_ff|master|q~65_combout\,
	datab => \AND3|o~27_combout\,
	datac => \datain~combout\(4),
	datad => \w_addr~combout\(0),
	combout => \R4|r4|d_ff|master|q~65_combout\);

\R2|r4|d_ff|master|q~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r4|d_ff|master|q~57_combout\ = \w_addr~combout\(0) & (\AND2|o~25_combout\ & !\datain~combout\(4) # !\AND2|o~25_combout\ & (\R2|r4|d_ff|master|q~57_combout\)) # !\w_addr~combout\(0) & (\R2|r4|d_ff|master|q~57_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(4),
	datab => \w_addr~combout\(0),
	datac => \AND2|o~25_combout\,
	datad => \R2|r4|d_ff|master|q~57_combout\,
	combout => \R2|r4|d_ff|master|q~57_combout\);

\R5|r4|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R5|r4|d_ff|master|q~65_combout\ = \DEC|Equal0~71_combout\ & (\AND6|o~38_combout\ & (!\datain~combout\(4)) # !\AND6|o~38_combout\ & \R5|r4|d_ff|master|q~65_combout\) # !\DEC|Equal0~71_combout\ & \R5|r4|d_ff|master|q~65_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DEC|Equal0~71_combout\,
	datab => \R5|r4|d_ff|master|q~65_combout\,
	datac => \AND6|o~38_combout\,
	datad => \datain~combout\(4),
	combout => \R5|r4|d_ff|master|q~65_combout\);

\R1|r4|d_ff|master|q~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r4|d_ff|master|q~57_combout\ = \w_addr~combout\(0) & (\R1|r4|d_ff|master|q~57_combout\) # !\w_addr~combout\(0) & (\AND2|o~25_combout\ & !\datain~combout\(4) # !\AND2|o~25_combout\ & (\R1|r4|d_ff|master|q~57_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(4),
	datab => \w_addr~combout\(0),
	datac => \AND2|o~25_combout\,
	datad => \R1|r4|d_ff|master|q~57_combout\,
	combout => \R1|r4|d_ff|master|q~57_combout\);

\R4|r5|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r5|d_ff|master|q~65_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & (!\datain~combout\(5)) # !\w_addr~combout\(0) & \R4|r5|d_ff|master|q~65_combout\) # !\AND3|o~27_combout\ & \R4|r5|d_ff|master|q~65_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND3|o~27_combout\,
	datab => \R4|r5|d_ff|master|q~65_combout\,
	datac => \w_addr~combout\(0),
	datad => \datain~combout\(5),
	combout => \R4|r5|d_ff|master|q~65_combout\);

\R2|r5|d_ff|master|q~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r5|d_ff|master|q~57_combout\ = \AND2|o~25_combout\ & (\w_addr~combout\(0) & (!\datain~combout\(5)) # !\w_addr~combout\(0) & \R2|r5|d_ff|master|q~57_combout\) # !\AND2|o~25_combout\ & \R2|r5|d_ff|master|q~57_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND2|o~25_combout\,
	datab => \R2|r5|d_ff|master|q~57_combout\,
	datac => \w_addr~combout\(0),
	datad => \datain~combout\(5),
	combout => \R2|r5|d_ff|master|q~57_combout\);

\R1|r5|d_ff|master|q~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r5|d_ff|master|q~57_combout\ = \AND2|o~25_combout\ & (\w_addr~combout\(0) & (\R1|r5|d_ff|master|q~57_combout\) # !\w_addr~combout\(0) & !\datain~combout\(5)) # !\AND2|o~25_combout\ & (\R1|r5|d_ff|master|q~57_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(5),
	datab => \R1|r5|d_ff|master|q~57_combout\,
	datac => \AND2|o~25_combout\,
	datad => \w_addr~combout\(0),
	combout => \R1|r5|d_ff|master|q~57_combout\);

\R7|r5|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R7|r5|d_ff|master|q~65_combout\ = \DEC|Equal0~72_combout\ & (\clock4~combout\ & (!\datain~combout\(5)) # !\clock4~combout\ & \R7|r5|d_ff|master|q~65_combout\) # !\DEC|Equal0~72_combout\ & \R7|r5|d_ff|master|q~65_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DEC|Equal0~72_combout\,
	datab => \R7|r5|d_ff|master|q~65_combout\,
	datac => \datain~combout\(5),
	datad => \clock4~combout\,
	combout => \R7|r5|d_ff|master|q~65_combout\);

\R2|r6|d_ff|master|q~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r6|d_ff|master|q~57_combout\ = \AND2|o~25_combout\ & (\w_addr~combout\(0) & (!\datain~combout\(6)) # !\w_addr~combout\(0) & \R2|r6|d_ff|master|q~57_combout\) # !\AND2|o~25_combout\ & \R2|r6|d_ff|master|q~57_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND2|o~25_combout\,
	datab => \R2|r6|d_ff|master|q~57_combout\,
	datac => \w_addr~combout\(0),
	datad => \datain~combout\(6),
	combout => \R2|r6|d_ff|master|q~57_combout\);

\R8|r6|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R8|r6|d_ff|master|q~65_combout\ = GLOBAL(\AND8|o~clkctrl_outclk\) & !\datain~combout\(6) # !GLOBAL(\AND8|o~clkctrl_outclk\) & (\R8|r6|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(6),
	datac => \R8|r6|d_ff|master|q~65_combout\,
	datad => \AND8|o~clkctrl_outclk\,
	combout => \R8|r6|d_ff|master|q~65_combout\);

\R1|r6|d_ff|master|q~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r6|d_ff|master|q~57_combout\ = \AND2|o~25_combout\ & (\w_addr~combout\(0) & (\R1|r6|d_ff|master|q~57_combout\) # !\w_addr~combout\(0) & !\datain~combout\(6)) # !\AND2|o~25_combout\ & (\R1|r6|d_ff|master|q~57_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(6),
	datab => \R1|r6|d_ff|master|q~57_combout\,
	datac => \AND2|o~25_combout\,
	datad => \w_addr~combout\(0),
	combout => \R1|r6|d_ff|master|q~57_combout\);

\R7|r6|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R7|r6|d_ff|master|q~65_combout\ = \clock4~combout\ & (\DEC|Equal0~72_combout\ & (!\datain~combout\(6)) # !\DEC|Equal0~72_combout\ & \R7|r6|d_ff|master|q~65_combout\) # !\clock4~combout\ & \R7|r6|d_ff|master|q~65_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R7|r6|d_ff|master|q~65_combout\,
	datab => \clock4~combout\,
	datac => \DEC|Equal0~72_combout\,
	datad => \datain~combout\(6),
	combout => \R7|r6|d_ff|master|q~65_combout\);

\R4|r7|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r7|d_ff|master|q~65_combout\ = \w_addr~combout\(0) & (\AND3|o~27_combout\ & !\datain~combout\(7) # !\AND3|o~27_combout\ & (\R4|r7|d_ff|master|q~65_combout\)) # !\w_addr~combout\(0) & (\R4|r7|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(7),
	datab => \R4|r7|d_ff|master|q~65_combout\,
	datac => \w_addr~combout\(0),
	datad => \AND3|o~27_combout\,
	combout => \R4|r7|d_ff|master|q~65_combout\);

\R2|r7|d_ff|master|q~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r7|d_ff|master|q~57_combout\ = \w_addr~combout\(0) & (\AND2|o~25_combout\ & !\datain~combout\(7) # !\AND2|o~25_combout\ & (\R2|r7|d_ff|master|q~57_combout\)) # !\w_addr~combout\(0) & (\R2|r7|d_ff|master|q~57_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(7),
	datab => \R2|r7|d_ff|master|q~57_combout\,
	datac => \w_addr~combout\(0),
	datad => \AND2|o~25_combout\,
	combout => \R2|r7|d_ff|master|q~57_combout\);

\R3|r7|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r7|d_ff|master|q~65_combout\ = \w_addr~combout\(0) & (\R3|r7|d_ff|master|q~65_combout\) # !\w_addr~combout\(0) & (\AND3|o~27_combout\ & !\datain~combout\(7) # !\AND3|o~27_combout\ & (\R3|r7|d_ff|master|q~65_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(0),
	datab => \AND3|o~27_combout\,
	datac => \datain~combout\(7),
	datad => \R3|r7|d_ff|master|q~65_combout\,
	combout => \R3|r7|d_ff|master|q~65_combout\);

\R5|r7|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R5|r7|d_ff|master|q~65_combout\ = \DEC|Equal0~71_combout\ & (\AND6|o~38_combout\ & (!\datain~combout\(7)) # !\AND6|o~38_combout\ & \R5|r7|d_ff|master|q~65_combout\) # !\DEC|Equal0~71_combout\ & \R5|r7|d_ff|master|q~65_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R5|r7|d_ff|master|q~65_combout\,
	datab => \datain~combout\(7),
	datac => \DEC|Equal0~71_combout\,
	datad => \AND6|o~38_combout\,
	combout => \R5|r7|d_ff|master|q~65_combout\);

\R1|r7|d_ff|master|q~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r7|d_ff|master|q~57_combout\ = \AND2|o~25_combout\ & (\w_addr~combout\(0) & \R1|r7|d_ff|master|q~57_combout\ # !\w_addr~combout\(0) & (!\datain~combout\(7))) # !\AND2|o~25_combout\ & \R1|r7|d_ff|master|q~57_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R1|r7|d_ff|master|q~57_combout\,
	datab => \datain~combout\(7),
	datac => \AND2|o~25_combout\,
	datad => \w_addr~combout\(0),
	combout => \R1|r7|d_ff|master|q~57_combout\);

\w_addr[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_w_addr(0),
	combout => \w_addr~combout\(0));

\w_addr[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_w_addr(1),
	combout => \w_addr~combout\(1));

\w_addr[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_w_addr(2),
	combout => \w_addr~combout\(2));

\AND2|o~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \AND2|o~25_combout\ = \clock4~combout\ & !\w_addr~combout\(1) & !\w_addr~combout\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock4~combout\,
	datab => \w_addr~combout\(1),
	datad => \w_addr~combout\(2),
	combout => \AND2|o~25_combout\);

\R2|r0|d_ff|master|q~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r0|d_ff|master|q~57_combout\ = \w_addr~combout\(0) & (\AND2|o~25_combout\ & !\datain~combout\(0) # !\AND2|o~25_combout\ & (\R2|r0|d_ff|master|q~57_combout\)) # !\w_addr~combout\(0) & (\R2|r0|d_ff|master|q~57_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(0),
	datab => \R2|r0|d_ff|master|q~57_combout\,
	datac => \w_addr~combout\(0),
	datad => \AND2|o~25_combout\,
	combout => \R2|r0|d_ff|master|q~57_combout\);

\R2|r0|d_ff|slave|q~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r0|d_ff|slave|q~56_combout\ = \AND2|o~25_combout\ & (\w_addr~combout\(0) & \R2|r0|d_ff|master|q~57_combout\ # !\w_addr~combout\(0) & (\R2|r0|d_ff|slave|q~56_combout\)) # !\AND2|o~25_combout\ & (\R2|r0|d_ff|slave|q~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND2|o~25_combout\,
	datab => \R2|r0|d_ff|master|q~57_combout\,
	datac => \w_addr~combout\(0),
	datad => \R2|r0|d_ff|slave|q~56_combout\,
	combout => \R2|r0|d_ff|slave|q~56_combout\);

\r_addr[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_r_addr(0),
	combout => \r_addr~combout\(0));

\AND3|o~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \AND3|o~27_combout\ = \clock4~combout\ & \w_addr~combout\(1) & !\w_addr~combout\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock4~combout\,
	datab => \w_addr~combout\(1),
	datad => \w_addr~combout\(2),
	combout => \AND3|o~27_combout\);

\R4|r0|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r0|d_ff|master|q~65_combout\ = \w_addr~combout\(0) & (\AND3|o~27_combout\ & !\datain~combout\(0) # !\AND3|o~27_combout\ & (\R4|r0|d_ff|master|q~65_combout\)) # !\w_addr~combout\(0) & (\R4|r0|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(0),
	datab => \w_addr~combout\(0),
	datac => \R4|r0|d_ff|master|q~65_combout\,
	datad => \AND3|o~27_combout\,
	combout => \R4|r0|d_ff|master|q~65_combout\);

\R4|r0|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r0|d_ff|slave|q~64_combout\ = \w_addr~combout\(0) & (\AND3|o~27_combout\ & (\R4|r0|d_ff|master|q~65_combout\) # !\AND3|o~27_combout\ & \R4|r0|d_ff|slave|q~64_combout\) # !\w_addr~combout\(0) & \R4|r0|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R4|r0|d_ff|slave|q~64_combout\,
	datab => \w_addr~combout\(0),
	datac => \R4|r0|d_ff|master|q~65_combout\,
	datad => \AND3|o~27_combout\,
	combout => \R4|r0|d_ff|slave|q~64_combout\);

\MUXA|o[0]~333\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[0]~333_combout\ = \r_addr~combout\(1) & (\r_addr~combout\(0) # !\R4|r0|d_ff|slave|q~64_combout\) # !\r_addr~combout\(1) & !\R2|r0|d_ff|slave|q~56_combout\ & !\r_addr~combout\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_addr~combout\(1),
	datab => \R2|r0|d_ff|slave|q~56_combout\,
	datac => \r_addr~combout\(0),
	datad => \R4|r0|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[0]~333_combout\);

\clock4~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clock4,
	combout => \clock4~combout\);

\AND8|o\ : cycloneii_lcell_comb
-- Equation(s):
-- \AND8|o~combout\ = \w_addr~combout\(0) & \clock4~combout\ & \w_addr~combout\(1) & \w_addr~combout\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(0),
	datab => \clock4~combout\,
	datac => \w_addr~combout\(1),
	datad => \w_addr~combout\(2),
	combout => \AND8|o~combout\);

\AND8|o~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "falling edge")
-- pragma translate_on
PORT MAP (
	inclk => \AND8|o~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \AND8|o~clkctrl_outclk\);

\R8|r0|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R8|r0|d_ff|master|q~65_combout\ = GLOBAL(\AND8|o~clkctrl_outclk\) & !\datain~combout\(0) # !GLOBAL(\AND8|o~clkctrl_outclk\) & (\R8|r0|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(0),
	datac => \R8|r0|d_ff|master|q~65_combout\,
	datad => \AND8|o~clkctrl_outclk\,
	combout => \R8|r0|d_ff|master|q~65_combout\);

\R8|r0|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R8|r0|d_ff|slave|q~64_combout\ = GLOBAL(\AND8|o~clkctrl_outclk\) & (\R8|r0|d_ff|master|q~65_combout\) # !GLOBAL(\AND8|o~clkctrl_outclk\) & \R8|r0|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \AND8|o~clkctrl_outclk\,
	datac => \R8|r0|d_ff|slave|q~64_combout\,
	datad => \R8|r0|d_ff|master|q~65_combout\,
	combout => \R8|r0|d_ff|slave|q~64_combout\);

\MUXA|o[0]~334\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[0]~334_combout\ = \MUXA|o[0]~333_combout\ & (!\r_addr~combout\(0) # !\R8|r0|d_ff|slave|q~64_combout\) # !\MUXA|o[0]~333_combout\ & !\R6|r0|d_ff|slave|q~64_combout\ & (\r_addr~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R6|r0|d_ff|slave|q~64_combout\,
	datab => \MUXA|o[0]~333_combout\,
	datac => \R8|r0|d_ff|slave|q~64_combout\,
	datad => \r_addr~combout\(0),
	combout => \MUXA|o[0]~334_combout\);

\r_addr[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_r_addr(2),
	combout => \r_addr~combout\(2));

\R3|r0|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r0|d_ff|slave|q~64_combout\ = \w_addr~combout\(0) & (\R3|r0|d_ff|slave|q~64_combout\) # !\w_addr~combout\(0) & (\AND3|o~27_combout\ & \R3|r0|d_ff|master|q~65_combout\ # !\AND3|o~27_combout\ & (\R3|r0|d_ff|slave|q~64_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R3|r0|d_ff|master|q~65_combout\,
	datab => \R3|r0|d_ff|slave|q~64_combout\,
	datac => \w_addr~combout\(0),
	datad => \AND3|o~27_combout\,
	combout => \R3|r0|d_ff|slave|q~64_combout\);

\datain[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_datain(0),
	combout => \datain~combout\(0));

\DEC|Equal0~72\ : cycloneii_lcell_comb
-- Equation(s):
-- \DEC|Equal0~72_combout\ = \w_addr~combout\(1) & !\w_addr~combout\(0) & \w_addr~combout\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w_addr~combout\(1),
	datac => \w_addr~combout\(0),
	datad => \w_addr~combout\(2),
	combout => \DEC|Equal0~72_combout\);

\R7|r0|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R7|r0|d_ff|master|q~65_combout\ = \clock4~combout\ & (\DEC|Equal0~72_combout\ & !\datain~combout\(0) # !\DEC|Equal0~72_combout\ & (\R7|r0|d_ff|master|q~65_combout\)) # !\clock4~combout\ & (\R7|r0|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock4~combout\,
	datab => \datain~combout\(0),
	datac => \R7|r0|d_ff|master|q~65_combout\,
	datad => \DEC|Equal0~72_combout\,
	combout => \R7|r0|d_ff|master|q~65_combout\);

\R7|r0|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R7|r0|d_ff|slave|q~64_combout\ = \clock4~combout\ & (\DEC|Equal0~72_combout\ & \R7|r0|d_ff|master|q~65_combout\ # !\DEC|Equal0~72_combout\ & (\R7|r0|d_ff|slave|q~64_combout\)) # !\clock4~combout\ & (\R7|r0|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock4~combout\,
	datab => \R7|r0|d_ff|master|q~65_combout\,
	datac => \R7|r0|d_ff|slave|q~64_combout\,
	datad => \DEC|Equal0~72_combout\,
	combout => \R7|r0|d_ff|slave|q~64_combout\);

\r_addr[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_r_addr(1),
	combout => \r_addr~combout\(1));

\MUXA|o[0]~336\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[0]~336_combout\ = \MUXA|o[0]~335_combout\ & (!\r_addr~combout\(1) # !\R7|r0|d_ff|slave|q~64_combout\) # !\MUXA|o[0]~335_combout\ & !\R3|r0|d_ff|slave|q~64_combout\ & (\r_addr~combout\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUXA|o[0]~335_combout\,
	datab => \R3|r0|d_ff|slave|q~64_combout\,
	datac => \R7|r0|d_ff|slave|q~64_combout\,
	datad => \r_addr~combout\(1),
	combout => \MUXA|o[0]~336_combout\);

\MUXA|o[0]~337\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[0]~337_combout\ = \r_addr~combout\(2) & \MUXA|o[0]~334_combout\ # !\r_addr~combout\(2) & (\MUXA|o[0]~336_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MUXA|o[0]~334_combout\,
	datac => \r_addr~combout\(2),
	datad => \MUXA|o[0]~336_combout\,
	combout => \MUXA|o[0]~337_combout\);

\datain[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_datain(1),
	combout => \datain~combout\(1));

\R7|r1|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R7|r1|d_ff|master|q~65_combout\ = \DEC|Equal0~72_combout\ & (\clock4~combout\ & (!\datain~combout\(1)) # !\clock4~combout\ & \R7|r1|d_ff|master|q~65_combout\) # !\DEC|Equal0~72_combout\ & \R7|r1|d_ff|master|q~65_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DEC|Equal0~72_combout\,
	datab => \R7|r1|d_ff|master|q~65_combout\,
	datac => \clock4~combout\,
	datad => \datain~combout\(1),
	combout => \R7|r1|d_ff|master|q~65_combout\);

\R7|r1|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R7|r1|d_ff|slave|q~64_combout\ = \clock4~combout\ & (\DEC|Equal0~72_combout\ & \R7|r1|d_ff|master|q~65_combout\ # !\DEC|Equal0~72_combout\ & (\R7|r1|d_ff|slave|q~64_combout\)) # !\clock4~combout\ & (\R7|r1|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock4~combout\,
	datab => \R7|r1|d_ff|master|q~65_combout\,
	datac => \R7|r1|d_ff|slave|q~64_combout\,
	datad => \DEC|Equal0~72_combout\,
	combout => \R7|r1|d_ff|slave|q~64_combout\);

\R1|r1|d_ff|master|q~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r1|d_ff|master|q~57_combout\ = \w_addr~combout\(0) & (\R1|r1|d_ff|master|q~57_combout\) # !\w_addr~combout\(0) & (\AND2|o~25_combout\ & !\datain~combout\(1) # !\AND2|o~25_combout\ & (\R1|r1|d_ff|master|q~57_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(0),
	datab => \AND2|o~25_combout\,
	datac => \datain~combout\(1),
	datad => \R1|r1|d_ff|master|q~57_combout\,
	combout => \R1|r1|d_ff|master|q~57_combout\);

\R1|r1|d_ff|slave|q~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r1|d_ff|slave|q~56_combout\ = \w_addr~combout\(0) & (\R1|r1|d_ff|slave|q~56_combout\) # !\w_addr~combout\(0) & (\AND2|o~25_combout\ & (\R1|r1|d_ff|master|q~57_combout\) # !\AND2|o~25_combout\ & \R1|r1|d_ff|slave|q~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(0),
	datab => \AND2|o~25_combout\,
	datac => \R1|r1|d_ff|slave|q~56_combout\,
	datad => \R1|r1|d_ff|master|q~57_combout\,
	combout => \R1|r1|d_ff|slave|q~56_combout\);

\AND6|o~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \AND6|o~38_combout\ = \clock4~combout\ & !\w_addr~combout\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock4~combout\,
	datad => \w_addr~combout\(1),
	combout => \AND6|o~38_combout\);

\R5|r1|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R5|r1|d_ff|master|q~65_combout\ = \DEC|Equal0~71_combout\ & (\AND6|o~38_combout\ & (!\datain~combout\(1)) # !\AND6|o~38_combout\ & \R5|r1|d_ff|master|q~65_combout\) # !\DEC|Equal0~71_combout\ & (\R5|r1|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DEC|Equal0~71_combout\,
	datab => \AND6|o~38_combout\,
	datac => \R5|r1|d_ff|master|q~65_combout\,
	datad => \datain~combout\(1),
	combout => \R5|r1|d_ff|master|q~65_combout\);

\R5|r1|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R5|r1|d_ff|slave|q~64_combout\ = \DEC|Equal0~71_combout\ & (\AND6|o~38_combout\ & \R5|r1|d_ff|master|q~65_combout\ # !\AND6|o~38_combout\ & (\R5|r1|d_ff|slave|q~64_combout\)) # !\DEC|Equal0~71_combout\ & (\R5|r1|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DEC|Equal0~71_combout\,
	datab => \AND6|o~38_combout\,
	datac => \R5|r1|d_ff|master|q~65_combout\,
	datad => \R5|r1|d_ff|slave|q~64_combout\,
	combout => \R5|r1|d_ff|slave|q~64_combout\);

\MUXA|o[1]~340\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[1]~340_combout\ = \r_addr~combout\(1) & \r_addr~combout\(0) # !\r_addr~combout\(1) & (\r_addr~combout\(0) & (!\R5|r1|d_ff|slave|q~64_combout\) # !\r_addr~combout\(0) & !\R1|r1|d_ff|slave|q~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_addr~combout\(1),
	datab => \r_addr~combout\(0),
	datac => \R1|r1|d_ff|slave|q~56_combout\,
	datad => \R5|r1|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[1]~340_combout\);

\MUXA|o[1]~341\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[1]~341_combout\ = \r_addr~combout\(1) & (\MUXA|o[1]~340_combout\ & (!\R7|r1|d_ff|slave|q~64_combout\) # !\MUXA|o[1]~340_combout\ & !\R3|r1|d_ff|slave|q~64_combout\) # !\r_addr~combout\(1) & (\MUXA|o[1]~340_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R3|r1|d_ff|slave|q~64_combout\,
	datab => \R7|r1|d_ff|slave|q~64_combout\,
	datac => \r_addr~combout\(1),
	datad => \MUXA|o[1]~340_combout\,
	combout => \MUXA|o[1]~341_combout\);

\R2|r1|d_ff|master|q~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r1|d_ff|master|q~57_combout\ = \w_addr~combout\(0) & (\AND2|o~25_combout\ & !\datain~combout\(1) # !\AND2|o~25_combout\ & (\R2|r1|d_ff|master|q~57_combout\)) # !\w_addr~combout\(0) & (\R2|r1|d_ff|master|q~57_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(0),
	datab => \AND2|o~25_combout\,
	datac => \datain~combout\(1),
	datad => \R2|r1|d_ff|master|q~57_combout\,
	combout => \R2|r1|d_ff|master|q~57_combout\);

\R2|r1|d_ff|slave|q~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r1|d_ff|slave|q~56_combout\ = \w_addr~combout\(0) & (\AND2|o~25_combout\ & (\R2|r1|d_ff|master|q~57_combout\) # !\AND2|o~25_combout\ & \R2|r1|d_ff|slave|q~56_combout\) # !\w_addr~combout\(0) & (\R2|r1|d_ff|slave|q~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(0),
	datab => \AND2|o~25_combout\,
	datac => \R2|r1|d_ff|slave|q~56_combout\,
	datad => \R2|r1|d_ff|master|q~57_combout\,
	combout => \R2|r1|d_ff|slave|q~56_combout\);

\R4|r1|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r1|d_ff|master|q~65_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & (!\datain~combout\(1)) # !\w_addr~combout\(0) & \R4|r1|d_ff|master|q~65_combout\) # !\AND3|o~27_combout\ & \R4|r1|d_ff|master|q~65_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND3|o~27_combout\,
	datab => \R4|r1|d_ff|master|q~65_combout\,
	datac => \datain~combout\(1),
	datad => \w_addr~combout\(0),
	combout => \R4|r1|d_ff|master|q~65_combout\);

\R4|r1|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r1|d_ff|slave|q~64_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & \R4|r1|d_ff|master|q~65_combout\ # !\w_addr~combout\(0) & (\R4|r1|d_ff|slave|q~64_combout\)) # !\AND3|o~27_combout\ & (\R4|r1|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND3|o~27_combout\,
	datab => \R4|r1|d_ff|master|q~65_combout\,
	datac => \w_addr~combout\(0),
	datad => \R4|r1|d_ff|slave|q~64_combout\,
	combout => \R4|r1|d_ff|slave|q~64_combout\);

\MUXA|o[1]~338\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[1]~338_combout\ = \r_addr~combout\(1) & (\r_addr~combout\(0) # !\R4|r1|d_ff|slave|q~64_combout\) # !\r_addr~combout\(1) & !\R2|r1|d_ff|slave|q~56_combout\ & !\r_addr~combout\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_addr~combout\(1),
	datab => \R2|r1|d_ff|slave|q~56_combout\,
	datac => \r_addr~combout\(0),
	datad => \R4|r1|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[1]~338_combout\);

\AND6|o~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \AND6|o~37_combout\ = \w_addr~combout\(0) & \clock4~combout\ & !\w_addr~combout\(1) & \w_addr~combout\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(0),
	datab => \clock4~combout\,
	datac => \w_addr~combout\(1),
	datad => \w_addr~combout\(2),
	combout => \AND6|o~37_combout\);

\AND6|o~37clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "falling edge")
-- pragma translate_on
PORT MAP (
	inclk => \AND6|o~37clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \AND6|o~37clkctrl_outclk\);

\R6|r1|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R6|r1|d_ff|master|q~65_combout\ = GLOBAL(\AND6|o~37clkctrl_outclk\) & !\datain~combout\(1) # !GLOBAL(\AND6|o~37clkctrl_outclk\) & (\R6|r1|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(1),
	datac => \AND6|o~37clkctrl_outclk\,
	datad => \R6|r1|d_ff|master|q~65_combout\,
	combout => \R6|r1|d_ff|master|q~65_combout\);

\R6|r1|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R6|r1|d_ff|slave|q~64_combout\ = GLOBAL(\AND6|o~37clkctrl_outclk\) & (\R6|r1|d_ff|master|q~65_combout\) # !GLOBAL(\AND6|o~37clkctrl_outclk\) & \R6|r1|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \R6|r1|d_ff|slave|q~64_combout\,
	datac => \AND6|o~37clkctrl_outclk\,
	datad => \R6|r1|d_ff|master|q~65_combout\,
	combout => \R6|r1|d_ff|slave|q~64_combout\);

\MUXA|o[1]~339\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[1]~339_combout\ = \r_addr~combout\(0) & (\MUXA|o[1]~338_combout\ & !\R8|r1|d_ff|slave|q~64_combout\ # !\MUXA|o[1]~338_combout\ & (!\R6|r1|d_ff|slave|q~64_combout\)) # !\r_addr~combout\(0) & (\MUXA|o[1]~338_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R8|r1|d_ff|slave|q~64_combout\,
	datab => \r_addr~combout\(0),
	datac => \MUXA|o[1]~338_combout\,
	datad => \R6|r1|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[1]~339_combout\);

\MUXA|o[1]~342\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[1]~342_combout\ = \r_addr~combout\(2) & (\MUXA|o[1]~339_combout\) # !\r_addr~combout\(2) & \MUXA|o[1]~341_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MUXA|o[1]~341_combout\,
	datac => \r_addr~combout\(2),
	datad => \MUXA|o[1]~339_combout\,
	combout => \MUXA|o[1]~342_combout\);

\datain[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_datain(2),
	combout => \datain~combout\(2));

\R5|r2|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R5|r2|d_ff|master|q~65_combout\ = \DEC|Equal0~71_combout\ & (\AND6|o~38_combout\ & (!\datain~combout\(2)) # !\AND6|o~38_combout\ & \R5|r2|d_ff|master|q~65_combout\) # !\DEC|Equal0~71_combout\ & (\R5|r2|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DEC|Equal0~71_combout\,
	datab => \AND6|o~38_combout\,
	datac => \R5|r2|d_ff|master|q~65_combout\,
	datad => \datain~combout\(2),
	combout => \R5|r2|d_ff|master|q~65_combout\);

\R5|r2|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R5|r2|d_ff|slave|q~64_combout\ = \DEC|Equal0~71_combout\ & (\AND6|o~38_combout\ & \R5|r2|d_ff|master|q~65_combout\ # !\AND6|o~38_combout\ & (\R5|r2|d_ff|slave|q~64_combout\)) # !\DEC|Equal0~71_combout\ & (\R5|r2|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DEC|Equal0~71_combout\,
	datab => \AND6|o~38_combout\,
	datac => \R5|r2|d_ff|master|q~65_combout\,
	datad => \R5|r2|d_ff|slave|q~64_combout\,
	combout => \R5|r2|d_ff|slave|q~64_combout\);

\MUXA|o[2]~345\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[2]~345_combout\ = \r_addr~combout\(0) & (\r_addr~combout\(1) # !\R5|r2|d_ff|slave|q~64_combout\) # !\r_addr~combout\(0) & !\R1|r2|d_ff|slave|q~56_combout\ & !\r_addr~combout\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R1|r2|d_ff|slave|q~56_combout\,
	datab => \r_addr~combout\(0),
	datac => \r_addr~combout\(1),
	datad => \R5|r2|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[2]~345_combout\);

\R3|r2|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r2|d_ff|master|q~65_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & \R3|r2|d_ff|master|q~65_combout\ # !\w_addr~combout\(0) & (!\datain~combout\(2))) # !\AND3|o~27_combout\ & \R3|r2|d_ff|master|q~65_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND3|o~27_combout\,
	datab => \R3|r2|d_ff|master|q~65_combout\,
	datac => \w_addr~combout\(0),
	datad => \datain~combout\(2),
	combout => \R3|r2|d_ff|master|q~65_combout\);

\R3|r2|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r2|d_ff|slave|q~64_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & (\R3|r2|d_ff|slave|q~64_combout\) # !\w_addr~combout\(0) & \R3|r2|d_ff|master|q~65_combout\) # !\AND3|o~27_combout\ & (\R3|r2|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND3|o~27_combout\,
	datab => \R3|r2|d_ff|master|q~65_combout\,
	datac => \w_addr~combout\(0),
	datad => \R3|r2|d_ff|slave|q~64_combout\,
	combout => \R3|r2|d_ff|slave|q~64_combout\);

\MUXA|o[2]~346\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[2]~346_combout\ = \r_addr~combout\(1) & (\MUXA|o[2]~345_combout\ & !\R7|r2|d_ff|slave|q~64_combout\ # !\MUXA|o[2]~345_combout\ & (!\R3|r2|d_ff|slave|q~64_combout\)) # !\r_addr~combout\(1) & (\MUXA|o[2]~345_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R7|r2|d_ff|slave|q~64_combout\,
	datab => \r_addr~combout\(1),
	datac => \MUXA|o[2]~345_combout\,
	datad => \R3|r2|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[2]~346_combout\);

\R8|r2|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R8|r2|d_ff|master|q~65_combout\ = GLOBAL(\AND8|o~clkctrl_outclk\) & !\datain~combout\(2) # !GLOBAL(\AND8|o~clkctrl_outclk\) & (\R8|r2|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(2),
	datac => \R8|r2|d_ff|master|q~65_combout\,
	datad => \AND8|o~clkctrl_outclk\,
	combout => \R8|r2|d_ff|master|q~65_combout\);

\R8|r2|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R8|r2|d_ff|slave|q~64_combout\ = GLOBAL(\AND8|o~clkctrl_outclk\) & (\R8|r2|d_ff|master|q~65_combout\) # !GLOBAL(\AND8|o~clkctrl_outclk\) & \R8|r2|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \AND8|o~clkctrl_outclk\,
	datac => \R8|r2|d_ff|slave|q~64_combout\,
	datad => \R8|r2|d_ff|master|q~65_combout\,
	combout => \R8|r2|d_ff|slave|q~64_combout\);

\R6|r2|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R6|r2|d_ff|master|q~65_combout\ = GLOBAL(\AND6|o~37clkctrl_outclk\) & !\datain~combout\(2) # !GLOBAL(\AND6|o~37clkctrl_outclk\) & (\R6|r2|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(2),
	datac => \AND6|o~37clkctrl_outclk\,
	datad => \R6|r2|d_ff|master|q~65_combout\,
	combout => \R6|r2|d_ff|master|q~65_combout\);

\R6|r2|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R6|r2|d_ff|slave|q~64_combout\ = GLOBAL(\AND6|o~37clkctrl_outclk\) & (\R6|r2|d_ff|master|q~65_combout\) # !GLOBAL(\AND6|o~37clkctrl_outclk\) & \R6|r2|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \R6|r2|d_ff|slave|q~64_combout\,
	datac => \AND6|o~37clkctrl_outclk\,
	datad => \R6|r2|d_ff|master|q~65_combout\,
	combout => \R6|r2|d_ff|slave|q~64_combout\);

\MUXA|o[2]~344\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[2]~344_combout\ = \MUXA|o[2]~343_combout\ & (!\R8|r2|d_ff|slave|q~64_combout\ # !\r_addr~combout\(0)) # !\MUXA|o[2]~343_combout\ & \r_addr~combout\(0) & (!\R6|r2|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101001101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUXA|o[2]~343_combout\,
	datab => \r_addr~combout\(0),
	datac => \R8|r2|d_ff|slave|q~64_combout\,
	datad => \R6|r2|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[2]~344_combout\);

\MUXA|o[2]~347\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[2]~347_combout\ = \r_addr~combout\(2) & (\MUXA|o[2]~344_combout\) # !\r_addr~combout\(2) & \MUXA|o[2]~346_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_addr~combout\(2),
	datab => \MUXA|o[2]~346_combout\,
	datad => \MUXA|o[2]~344_combout\,
	combout => \MUXA|o[2]~347_combout\);

\R7|r3|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R7|r3|d_ff|master|q~65_combout\ = \DEC|Equal0~72_combout\ & (\clock4~combout\ & !\datain~combout\(3) # !\clock4~combout\ & (\R7|r3|d_ff|master|q~65_combout\)) # !\DEC|Equal0~72_combout\ & (\R7|r3|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(3),
	datab => \R7|r3|d_ff|master|q~65_combout\,
	datac => \DEC|Equal0~72_combout\,
	datad => \clock4~combout\,
	combout => \R7|r3|d_ff|master|q~65_combout\);

\R7|r3|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R7|r3|d_ff|slave|q~64_combout\ = \clock4~combout\ & (\DEC|Equal0~72_combout\ & (\R7|r3|d_ff|master|q~65_combout\) # !\DEC|Equal0~72_combout\ & \R7|r3|d_ff|slave|q~64_combout\) # !\clock4~combout\ & \R7|r3|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R7|r3|d_ff|slave|q~64_combout\,
	datab => \R7|r3|d_ff|master|q~65_combout\,
	datac => \clock4~combout\,
	datad => \DEC|Equal0~72_combout\,
	combout => \R7|r3|d_ff|slave|q~64_combout\);

\datain[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_datain(3),
	combout => \datain~combout\(3));

\R5|r3|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R5|r3|d_ff|master|q~65_combout\ = \DEC|Equal0~71_combout\ & (\AND6|o~38_combout\ & (!\datain~combout\(3)) # !\AND6|o~38_combout\ & \R5|r3|d_ff|master|q~65_combout\) # !\DEC|Equal0~71_combout\ & \R5|r3|d_ff|master|q~65_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DEC|Equal0~71_combout\,
	datab => \R5|r3|d_ff|master|q~65_combout\,
	datac => \AND6|o~38_combout\,
	datad => \datain~combout\(3),
	combout => \R5|r3|d_ff|master|q~65_combout\);

\R5|r3|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R5|r3|d_ff|slave|q~64_combout\ = \DEC|Equal0~71_combout\ & (\AND6|o~38_combout\ & \R5|r3|d_ff|master|q~65_combout\ # !\AND6|o~38_combout\ & (\R5|r3|d_ff|slave|q~64_combout\)) # !\DEC|Equal0~71_combout\ & (\R5|r3|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DEC|Equal0~71_combout\,
	datab => \R5|r3|d_ff|master|q~65_combout\,
	datac => \AND6|o~38_combout\,
	datad => \R5|r3|d_ff|slave|q~64_combout\,
	combout => \R5|r3|d_ff|slave|q~64_combout\);

\R1|r3|d_ff|slave|q~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r3|d_ff|slave|q~56_combout\ = \AND2|o~25_combout\ & (\w_addr~combout\(0) & (\R1|r3|d_ff|slave|q~56_combout\) # !\w_addr~combout\(0) & \R1|r3|d_ff|master|q~57_combout\) # !\AND2|o~25_combout\ & (\R1|r3|d_ff|slave|q~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R1|r3|d_ff|master|q~57_combout\,
	datab => \AND2|o~25_combout\,
	datac => \w_addr~combout\(0),
	datad => \R1|r3|d_ff|slave|q~56_combout\,
	combout => \R1|r3|d_ff|slave|q~56_combout\);

\MUXA|o[3]~350\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[3]~350_combout\ = \r_addr~combout\(1) & (\r_addr~combout\(0)) # !\r_addr~combout\(1) & (\r_addr~combout\(0) & !\R5|r3|d_ff|slave|q~64_combout\ # !\r_addr~combout\(0) & (!\R1|r3|d_ff|slave|q~56_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_addr~combout\(1),
	datab => \R5|r3|d_ff|slave|q~64_combout\,
	datac => \r_addr~combout\(0),
	datad => \R1|r3|d_ff|slave|q~56_combout\,
	combout => \MUXA|o[3]~350_combout\);

\R3|r3|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r3|d_ff|slave|q~64_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & (\R3|r3|d_ff|slave|q~64_combout\) # !\w_addr~combout\(0) & \R3|r3|d_ff|master|q~65_combout\) # !\AND3|o~27_combout\ & (\R3|r3|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R3|r3|d_ff|master|q~65_combout\,
	datab => \AND3|o~27_combout\,
	datac => \w_addr~combout\(0),
	datad => \R3|r3|d_ff|slave|q~64_combout\,
	combout => \R3|r3|d_ff|slave|q~64_combout\);

\MUXA|o[3]~351\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[3]~351_combout\ = \r_addr~combout\(1) & (\MUXA|o[3]~350_combout\ & !\R7|r3|d_ff|slave|q~64_combout\ # !\MUXA|o[3]~350_combout\ & (!\R3|r3|d_ff|slave|q~64_combout\)) # !\r_addr~combout\(1) & (\MUXA|o[3]~350_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_addr~combout\(1),
	datab => \R7|r3|d_ff|slave|q~64_combout\,
	datac => \MUXA|o[3]~350_combout\,
	datad => \R3|r3|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[3]~351_combout\);

\R8|r3|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R8|r3|d_ff|master|q~65_combout\ = GLOBAL(\AND8|o~clkctrl_outclk\) & !\datain~combout\(3) # !GLOBAL(\AND8|o~clkctrl_outclk\) & (\R8|r3|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(3),
	datac => \R8|r3|d_ff|master|q~65_combout\,
	datad => \AND8|o~clkctrl_outclk\,
	combout => \R8|r3|d_ff|master|q~65_combout\);

\R8|r3|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R8|r3|d_ff|slave|q~64_combout\ = GLOBAL(\AND8|o~clkctrl_outclk\) & (\R8|r3|d_ff|master|q~65_combout\) # !GLOBAL(\AND8|o~clkctrl_outclk\) & \R8|r3|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \AND8|o~clkctrl_outclk\,
	datac => \R8|r3|d_ff|slave|q~64_combout\,
	datad => \R8|r3|d_ff|master|q~65_combout\,
	combout => \R8|r3|d_ff|slave|q~64_combout\);

\R6|r3|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R6|r3|d_ff|master|q~65_combout\ = GLOBAL(\AND6|o~37clkctrl_outclk\) & !\datain~combout\(3) # !GLOBAL(\AND6|o~37clkctrl_outclk\) & (\R6|r3|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(3),
	datac => \AND6|o~37clkctrl_outclk\,
	datad => \R6|r3|d_ff|master|q~65_combout\,
	combout => \R6|r3|d_ff|master|q~65_combout\);

\R6|r3|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R6|r3|d_ff|slave|q~64_combout\ = GLOBAL(\AND6|o~37clkctrl_outclk\) & (\R6|r3|d_ff|master|q~65_combout\) # !GLOBAL(\AND6|o~37clkctrl_outclk\) & \R6|r3|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \R6|r3|d_ff|slave|q~64_combout\,
	datac => \AND6|o~37clkctrl_outclk\,
	datad => \R6|r3|d_ff|master|q~65_combout\,
	combout => \R6|r3|d_ff|slave|q~64_combout\);

\MUXA|o[3]~349\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[3]~349_combout\ = \MUXA|o[3]~348_combout\ & (!\r_addr~combout\(0) # !\R8|r3|d_ff|slave|q~64_combout\) # !\MUXA|o[3]~348_combout\ & (\r_addr~combout\(0) & !\R6|r3|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101001111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUXA|o[3]~348_combout\,
	datab => \R8|r3|d_ff|slave|q~64_combout\,
	datac => \r_addr~combout\(0),
	datad => \R6|r3|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[3]~349_combout\);

\MUXA|o[3]~352\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[3]~352_combout\ = \r_addr~combout\(2) & (\MUXA|o[3]~349_combout\) # !\r_addr~combout\(2) & \MUXA|o[3]~351_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_addr~combout\(2),
	datac => \MUXA|o[3]~351_combout\,
	datad => \MUXA|o[3]~349_combout\,
	combout => \MUXA|o[3]~352_combout\);

\R8|r4|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R8|r4|d_ff|master|q~65_combout\ = GLOBAL(\AND8|o~clkctrl_outclk\) & !\datain~combout\(4) # !GLOBAL(\AND8|o~clkctrl_outclk\) & (\R8|r4|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(4),
	datac => \R8|r4|d_ff|master|q~65_combout\,
	datad => \AND8|o~clkctrl_outclk\,
	combout => \R8|r4|d_ff|master|q~65_combout\);

\R8|r4|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R8|r4|d_ff|slave|q~64_combout\ = GLOBAL(\AND8|o~clkctrl_outclk\) & (\R8|r4|d_ff|master|q~65_combout\) # !GLOBAL(\AND8|o~clkctrl_outclk\) & \R8|r4|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \AND8|o~clkctrl_outclk\,
	datac => \R8|r4|d_ff|slave|q~64_combout\,
	datad => \R8|r4|d_ff|master|q~65_combout\,
	combout => \R8|r4|d_ff|slave|q~64_combout\);

\R6|r4|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R6|r4|d_ff|master|q~65_combout\ = GLOBAL(\AND6|o~37clkctrl_outclk\) & !\datain~combout\(4) # !GLOBAL(\AND6|o~37clkctrl_outclk\) & (\R6|r4|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(4),
	datac => \AND6|o~37clkctrl_outclk\,
	datad => \R6|r4|d_ff|master|q~65_combout\,
	combout => \R6|r4|d_ff|master|q~65_combout\);

\R6|r4|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R6|r4|d_ff|slave|q~64_combout\ = GLOBAL(\AND6|o~37clkctrl_outclk\) & (\R6|r4|d_ff|master|q~65_combout\) # !GLOBAL(\AND6|o~37clkctrl_outclk\) & \R6|r4|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \R6|r4|d_ff|slave|q~64_combout\,
	datac => \AND6|o~37clkctrl_outclk\,
	datad => \R6|r4|d_ff|master|q~65_combout\,
	combout => \R6|r4|d_ff|slave|q~64_combout\);

\MUXA|o[4]~354\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[4]~354_combout\ = \MUXA|o[4]~353_combout\ & (!\r_addr~combout\(0) # !\R8|r4|d_ff|slave|q~64_combout\) # !\MUXA|o[4]~353_combout\ & (\r_addr~combout\(0) & !\R6|r4|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101001111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUXA|o[4]~353_combout\,
	datab => \R8|r4|d_ff|slave|q~64_combout\,
	datac => \r_addr~combout\(0),
	datad => \R6|r4|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[4]~354_combout\);

\datain[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_datain(4),
	combout => \datain~combout\(4));

\R7|r4|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R7|r4|d_ff|master|q~65_combout\ = \DEC|Equal0~72_combout\ & (\clock4~combout\ & (!\datain~combout\(4)) # !\clock4~combout\ & \R7|r4|d_ff|master|q~65_combout\) # !\DEC|Equal0~72_combout\ & (\R7|r4|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DEC|Equal0~72_combout\,
	datab => \clock4~combout\,
	datac => \R7|r4|d_ff|master|q~65_combout\,
	datad => \datain~combout\(4),
	combout => \R7|r4|d_ff|master|q~65_combout\);

\R7|r4|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R7|r4|d_ff|slave|q~64_combout\ = \DEC|Equal0~72_combout\ & (\clock4~combout\ & (\R7|r4|d_ff|master|q~65_combout\) # !\clock4~combout\ & \R7|r4|d_ff|slave|q~64_combout\) # !\DEC|Equal0~72_combout\ & \R7|r4|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R7|r4|d_ff|slave|q~64_combout\,
	datab => \R7|r4|d_ff|master|q~65_combout\,
	datac => \DEC|Equal0~72_combout\,
	datad => \clock4~combout\,
	combout => \R7|r4|d_ff|slave|q~64_combout\);

\R3|r4|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r4|d_ff|master|q~65_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & \R3|r4|d_ff|master|q~65_combout\ # !\w_addr~combout\(0) & (!\datain~combout\(4))) # !\AND3|o~27_combout\ & \R3|r4|d_ff|master|q~65_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND3|o~27_combout\,
	datab => \R3|r4|d_ff|master|q~65_combout\,
	datac => \w_addr~combout\(0),
	datad => \datain~combout\(4),
	combout => \R3|r4|d_ff|master|q~65_combout\);

\R3|r4|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r4|d_ff|slave|q~64_combout\ = \w_addr~combout\(0) & \R3|r4|d_ff|slave|q~64_combout\ # !\w_addr~combout\(0) & (\AND3|o~27_combout\ & (\R3|r4|d_ff|master|q~65_combout\) # !\AND3|o~27_combout\ & \R3|r4|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R3|r4|d_ff|slave|q~64_combout\,
	datab => \w_addr~combout\(0),
	datac => \AND3|o~27_combout\,
	datad => \R3|r4|d_ff|master|q~65_combout\,
	combout => \R3|r4|d_ff|slave|q~64_combout\);

\MUXA|o[4]~356\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[4]~356_combout\ = \MUXA|o[4]~355_combout\ & (!\r_addr~combout\(1) # !\R7|r4|d_ff|slave|q~64_combout\) # !\MUXA|o[4]~355_combout\ & (\r_addr~combout\(1) & !\R3|r4|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101001111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUXA|o[4]~355_combout\,
	datab => \R7|r4|d_ff|slave|q~64_combout\,
	datac => \r_addr~combout\(1),
	datad => \R3|r4|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[4]~356_combout\);

\MUXA|o[4]~357\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[4]~357_combout\ = \r_addr~combout\(2) & \MUXA|o[4]~354_combout\ # !\r_addr~combout\(2) & (\MUXA|o[4]~356_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MUXA|o[4]~354_combout\,
	datac => \r_addr~combout\(2),
	datad => \MUXA|o[4]~356_combout\,
	combout => \MUXA|o[4]~357_combout\);

\datain[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_datain(5),
	combout => \datain~combout\(5));

\R5|r5|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R5|r5|d_ff|master|q~65_combout\ = \DEC|Equal0~71_combout\ & (\AND6|o~38_combout\ & (!\datain~combout\(5)) # !\AND6|o~38_combout\ & \R5|r5|d_ff|master|q~65_combout\) # !\DEC|Equal0~71_combout\ & \R5|r5|d_ff|master|q~65_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DEC|Equal0~71_combout\,
	datab => \R5|r5|d_ff|master|q~65_combout\,
	datac => \AND6|o~38_combout\,
	datad => \datain~combout\(5),
	combout => \R5|r5|d_ff|master|q~65_combout\);

\R5|r5|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R5|r5|d_ff|slave|q~64_combout\ = \DEC|Equal0~71_combout\ & (\AND6|o~38_combout\ & \R5|r5|d_ff|master|q~65_combout\ # !\AND6|o~38_combout\ & (\R5|r5|d_ff|slave|q~64_combout\)) # !\DEC|Equal0~71_combout\ & (\R5|r5|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DEC|Equal0~71_combout\,
	datab => \R5|r5|d_ff|master|q~65_combout\,
	datac => \AND6|o~38_combout\,
	datad => \R5|r5|d_ff|slave|q~64_combout\,
	combout => \R5|r5|d_ff|slave|q~64_combout\);

\MUXA|o[5]~360\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[5]~360_combout\ = \r_addr~combout\(1) & (\r_addr~combout\(0)) # !\r_addr~combout\(1) & (\r_addr~combout\(0) & (!\R5|r5|d_ff|slave|q~64_combout\) # !\r_addr~combout\(0) & !\R1|r5|d_ff|slave|q~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R1|r5|d_ff|slave|q~56_combout\,
	datab => \R5|r5|d_ff|slave|q~64_combout\,
	datac => \r_addr~combout\(1),
	datad => \r_addr~combout\(0),
	combout => \MUXA|o[5]~360_combout\);

\R3|r5|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r5|d_ff|master|q~65_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & \R3|r5|d_ff|master|q~65_combout\ # !\w_addr~combout\(0) & (!\datain~combout\(5))) # !\AND3|o~27_combout\ & \R3|r5|d_ff|master|q~65_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND3|o~27_combout\,
	datab => \R3|r5|d_ff|master|q~65_combout\,
	datac => \w_addr~combout\(0),
	datad => \datain~combout\(5),
	combout => \R3|r5|d_ff|master|q~65_combout\);

\R3|r5|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r5|d_ff|slave|q~64_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & (\R3|r5|d_ff|slave|q~64_combout\) # !\w_addr~combout\(0) & \R3|r5|d_ff|master|q~65_combout\) # !\AND3|o~27_combout\ & (\R3|r5|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND3|o~27_combout\,
	datab => \R3|r5|d_ff|master|q~65_combout\,
	datac => \w_addr~combout\(0),
	datad => \R3|r5|d_ff|slave|q~64_combout\,
	combout => \R3|r5|d_ff|slave|q~64_combout\);

\MUXA|o[5]~361\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[5]~361_combout\ = \MUXA|o[5]~360_combout\ & (!\r_addr~combout\(1) # !\R7|r5|d_ff|slave|q~64_combout\) # !\MUXA|o[5]~360_combout\ & (\r_addr~combout\(1) & !\R3|r5|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R7|r5|d_ff|slave|q~64_combout\,
	datab => \MUXA|o[5]~360_combout\,
	datac => \r_addr~combout\(1),
	datad => \R3|r5|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[5]~361_combout\);

\R6|r5|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R6|r5|d_ff|master|q~65_combout\ = GLOBAL(\AND6|o~37clkctrl_outclk\) & !\datain~combout\(5) # !GLOBAL(\AND6|o~37clkctrl_outclk\) & (\R6|r5|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \datain~combout\(5),
	datac => \AND6|o~37clkctrl_outclk\,
	datad => \R6|r5|d_ff|master|q~65_combout\,
	combout => \R6|r5|d_ff|master|q~65_combout\);

\R6|r5|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R6|r5|d_ff|slave|q~64_combout\ = GLOBAL(\AND6|o~37clkctrl_outclk\) & (\R6|r5|d_ff|master|q~65_combout\) # !GLOBAL(\AND6|o~37clkctrl_outclk\) & \R6|r5|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \R6|r5|d_ff|slave|q~64_combout\,
	datac => \AND6|o~37clkctrl_outclk\,
	datad => \R6|r5|d_ff|master|q~65_combout\,
	combout => \R6|r5|d_ff|slave|q~64_combout\);

\R8|r5|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R8|r5|d_ff|master|q~65_combout\ = GLOBAL(\AND8|o~clkctrl_outclk\) & !\datain~combout\(5) # !GLOBAL(\AND8|o~clkctrl_outclk\) & (\R8|r5|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \datain~combout\(5),
	datac => \R8|r5|d_ff|master|q~65_combout\,
	datad => \AND8|o~clkctrl_outclk\,
	combout => \R8|r5|d_ff|master|q~65_combout\);

\R8|r5|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R8|r5|d_ff|slave|q~64_combout\ = GLOBAL(\AND8|o~clkctrl_outclk\) & (\R8|r5|d_ff|master|q~65_combout\) # !GLOBAL(\AND8|o~clkctrl_outclk\) & \R8|r5|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \AND8|o~clkctrl_outclk\,
	datac => \R8|r5|d_ff|slave|q~64_combout\,
	datad => \R8|r5|d_ff|master|q~65_combout\,
	combout => \R8|r5|d_ff|slave|q~64_combout\);

\MUXA|o[5]~359\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[5]~359_combout\ = \MUXA|o[5]~358_combout\ & (!\r_addr~combout\(0) # !\R8|r5|d_ff|slave|q~64_combout\) # !\MUXA|o[5]~358_combout\ & !\R6|r5|d_ff|slave|q~64_combout\ & (\r_addr~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUXA|o[5]~358_combout\,
	datab => \R6|r5|d_ff|slave|q~64_combout\,
	datac => \R8|r5|d_ff|slave|q~64_combout\,
	datad => \r_addr~combout\(0),
	combout => \MUXA|o[5]~359_combout\);

\MUXA|o[5]~362\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[5]~362_combout\ = \r_addr~combout\(2) & (\MUXA|o[5]~359_combout\) # !\r_addr~combout\(2) & \MUXA|o[5]~361_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUXA|o[5]~361_combout\,
	datab => \MUXA|o[5]~359_combout\,
	datad => \r_addr~combout\(2),
	combout => \MUXA|o[5]~362_combout\);

\DEC|Equal0~71\ : cycloneii_lcell_comb
-- Equation(s):
-- \DEC|Equal0~71_combout\ = !\w_addr~combout\(0) & \w_addr~combout\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \w_addr~combout\(0),
	datad => \w_addr~combout\(2),
	combout => \DEC|Equal0~71_combout\);

\datain[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_datain(6),
	combout => \datain~combout\(6));

\R5|r6|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R5|r6|d_ff|master|q~65_combout\ = \AND6|o~38_combout\ & (\DEC|Equal0~71_combout\ & (!\datain~combout\(6)) # !\DEC|Equal0~71_combout\ & \R5|r6|d_ff|master|q~65_combout\) # !\AND6|o~38_combout\ & \R5|r6|d_ff|master|q~65_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND6|o~38_combout\,
	datab => \R5|r6|d_ff|master|q~65_combout\,
	datac => \DEC|Equal0~71_combout\,
	datad => \datain~combout\(6),
	combout => \R5|r6|d_ff|master|q~65_combout\);

\R5|r6|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R5|r6|d_ff|slave|q~64_combout\ = \DEC|Equal0~71_combout\ & (\AND6|o~38_combout\ & \R5|r6|d_ff|master|q~65_combout\ # !\AND6|o~38_combout\ & (\R5|r6|d_ff|slave|q~64_combout\)) # !\DEC|Equal0~71_combout\ & (\R5|r6|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DEC|Equal0~71_combout\,
	datab => \R5|r6|d_ff|master|q~65_combout\,
	datac => \AND6|o~38_combout\,
	datad => \R5|r6|d_ff|slave|q~64_combout\,
	combout => \R5|r6|d_ff|slave|q~64_combout\);

\MUXA|o[6]~365\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[6]~365_combout\ = \r_addr~combout\(1) & (\r_addr~combout\(0)) # !\r_addr~combout\(1) & (\r_addr~combout\(0) & (!\R5|r6|d_ff|slave|q~64_combout\) # !\r_addr~combout\(0) & !\R1|r6|d_ff|slave|q~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000111110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R1|r6|d_ff|slave|q~56_combout\,
	datab => \r_addr~combout\(1),
	datac => \r_addr~combout\(0),
	datad => \R5|r6|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[6]~365_combout\);

\R3|r6|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r6|d_ff|master|q~65_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & (\R3|r6|d_ff|master|q~65_combout\) # !\w_addr~combout\(0) & !\datain~combout\(6)) # !\AND3|o~27_combout\ & (\R3|r6|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(6),
	datab => \AND3|o~27_combout\,
	datac => \w_addr~combout\(0),
	datad => \R3|r6|d_ff|master|q~65_combout\,
	combout => \R3|r6|d_ff|master|q~65_combout\);

\R3|r6|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r6|d_ff|slave|q~64_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & \R3|r6|d_ff|slave|q~64_combout\ # !\w_addr~combout\(0) & (\R3|r6|d_ff|master|q~65_combout\)) # !\AND3|o~27_combout\ & \R3|r6|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R3|r6|d_ff|slave|q~64_combout\,
	datab => \AND3|o~27_combout\,
	datac => \w_addr~combout\(0),
	datad => \R3|r6|d_ff|master|q~65_combout\,
	combout => \R3|r6|d_ff|slave|q~64_combout\);

\MUXA|o[6]~366\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[6]~366_combout\ = \r_addr~combout\(1) & (\MUXA|o[6]~365_combout\ & !\R7|r6|d_ff|slave|q~64_combout\ # !\MUXA|o[6]~365_combout\ & (!\R3|r6|d_ff|slave|q~64_combout\)) # !\r_addr~combout\(1) & (\MUXA|o[6]~365_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R7|r6|d_ff|slave|q~64_combout\,
	datab => \r_addr~combout\(1),
	datac => \MUXA|o[6]~365_combout\,
	datad => \R3|r6|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[6]~366_combout\);

\R4|r6|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r6|d_ff|master|q~65_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & !\datain~combout\(6) # !\w_addr~combout\(0) & (\R4|r6|d_ff|master|q~65_combout\)) # !\AND3|o~27_combout\ & (\R4|r6|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(6),
	datab => \AND3|o~27_combout\,
	datac => \w_addr~combout\(0),
	datad => \R4|r6|d_ff|master|q~65_combout\,
	combout => \R4|r6|d_ff|master|q~65_combout\);

\R4|r6|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r6|d_ff|slave|q~64_combout\ = \AND3|o~27_combout\ & (\w_addr~combout\(0) & (\R4|r6|d_ff|master|q~65_combout\) # !\w_addr~combout\(0) & \R4|r6|d_ff|slave|q~64_combout\) # !\AND3|o~27_combout\ & \R4|r6|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R4|r6|d_ff|slave|q~64_combout\,
	datab => \AND3|o~27_combout\,
	datac => \w_addr~combout\(0),
	datad => \R4|r6|d_ff|master|q~65_combout\,
	combout => \R4|r6|d_ff|slave|q~64_combout\);

\MUXA|o[6]~363\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[6]~363_combout\ = \r_addr~combout\(1) & (\r_addr~combout\(0) # !\R4|r6|d_ff|slave|q~64_combout\) # !\r_addr~combout\(1) & !\R2|r6|d_ff|slave|q~56_combout\ & !\r_addr~combout\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R2|r6|d_ff|slave|q~56_combout\,
	datab => \r_addr~combout\(1),
	datac => \r_addr~combout\(0),
	datad => \R4|r6|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[6]~363_combout\);

\R6|r6|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R6|r6|d_ff|master|q~65_combout\ = GLOBAL(\AND6|o~37clkctrl_outclk\) & !\datain~combout\(6) # !GLOBAL(\AND6|o~37clkctrl_outclk\) & (\R6|r6|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(6),
	datac => \AND6|o~37clkctrl_outclk\,
	datad => \R6|r6|d_ff|master|q~65_combout\,
	combout => \R6|r6|d_ff|master|q~65_combout\);

\R6|r6|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R6|r6|d_ff|slave|q~64_combout\ = GLOBAL(\AND6|o~37clkctrl_outclk\) & (\R6|r6|d_ff|master|q~65_combout\) # !GLOBAL(\AND6|o~37clkctrl_outclk\) & \R6|r6|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \R6|r6|d_ff|slave|q~64_combout\,
	datac => \AND6|o~37clkctrl_outclk\,
	datad => \R6|r6|d_ff|master|q~65_combout\,
	combout => \R6|r6|d_ff|slave|q~64_combout\);

\MUXA|o[6]~364\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[6]~364_combout\ = \r_addr~combout\(0) & (\MUXA|o[6]~363_combout\ & !\R8|r6|d_ff|slave|q~64_combout\ # !\MUXA|o[6]~363_combout\ & (!\R6|r6|d_ff|slave|q~64_combout\)) # !\r_addr~combout\(0) & (\MUXA|o[6]~363_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R8|r6|d_ff|slave|q~64_combout\,
	datab => \r_addr~combout\(0),
	datac => \MUXA|o[6]~363_combout\,
	datad => \R6|r6|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[6]~364_combout\);

\MUXA|o[6]~367\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[6]~367_combout\ = \r_addr~combout\(2) & (\MUXA|o[6]~364_combout\) # !\r_addr~combout\(2) & \MUXA|o[6]~366_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MUXA|o[6]~366_combout\,
	datac => \r_addr~combout\(2),
	datad => \MUXA|o[6]~364_combout\,
	combout => \MUXA|o[6]~367_combout\);

\R5|r7|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R5|r7|d_ff|slave|q~64_combout\ = \DEC|Equal0~71_combout\ & (\AND6|o~38_combout\ & \R5|r7|d_ff|master|q~65_combout\ # !\AND6|o~38_combout\ & (\R5|r7|d_ff|slave|q~64_combout\)) # !\DEC|Equal0~71_combout\ & (\R5|r7|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R5|r7|d_ff|master|q~65_combout\,
	datab => \R5|r7|d_ff|slave|q~64_combout\,
	datac => \DEC|Equal0~71_combout\,
	datad => \AND6|o~38_combout\,
	combout => \R5|r7|d_ff|slave|q~64_combout\);

\MUXA|o[7]~370\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[7]~370_combout\ = \r_addr~combout\(1) & (\r_addr~combout\(0)) # !\r_addr~combout\(1) & (\r_addr~combout\(0) & (!\R5|r7|d_ff|slave|q~64_combout\) # !\r_addr~combout\(0) & !\R1|r7|d_ff|slave|q~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000111110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R1|r7|d_ff|slave|q~56_combout\,
	datab => \r_addr~combout\(1),
	datac => \r_addr~combout\(0),
	datad => \R5|r7|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[7]~370_combout\);

\datain[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_datain(7),
	combout => \datain~combout\(7));

\R7|r7|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R7|r7|d_ff|master|q~65_combout\ = \DEC|Equal0~72_combout\ & (\clock4~combout\ & !\datain~combout\(7) # !\clock4~combout\ & (\R7|r7|d_ff|master|q~65_combout\)) # !\DEC|Equal0~72_combout\ & (\R7|r7|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DEC|Equal0~72_combout\,
	datab => \datain~combout\(7),
	datac => \R7|r7|d_ff|master|q~65_combout\,
	datad => \clock4~combout\,
	combout => \R7|r7|d_ff|master|q~65_combout\);

\R7|r7|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R7|r7|d_ff|slave|q~64_combout\ = \DEC|Equal0~72_combout\ & (\clock4~combout\ & \R7|r7|d_ff|master|q~65_combout\ # !\clock4~combout\ & (\R7|r7|d_ff|slave|q~64_combout\)) # !\DEC|Equal0~72_combout\ & (\R7|r7|d_ff|slave|q~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DEC|Equal0~72_combout\,
	datab => \clock4~combout\,
	datac => \R7|r7|d_ff|master|q~65_combout\,
	datad => \R7|r7|d_ff|slave|q~64_combout\,
	combout => \R7|r7|d_ff|slave|q~64_combout\);

\MUXA|o[7]~371\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[7]~371_combout\ = \MUXA|o[7]~370_combout\ & (!\r_addr~combout\(1) # !\R7|r7|d_ff|slave|q~64_combout\) # !\MUXA|o[7]~370_combout\ & !\R3|r7|d_ff|slave|q~64_combout\ & (\r_addr~combout\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R3|r7|d_ff|slave|q~64_combout\,
	datab => \MUXA|o[7]~370_combout\,
	datac => \R7|r7|d_ff|slave|q~64_combout\,
	datad => \r_addr~combout\(1),
	combout => \MUXA|o[7]~371_combout\);

\R6|r7|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R6|r7|d_ff|master|q~65_combout\ = GLOBAL(\AND6|o~37clkctrl_outclk\) & !\datain~combout\(7) # !GLOBAL(\AND6|o~37clkctrl_outclk\) & (\R6|r7|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(7),
	datac => \AND6|o~37clkctrl_outclk\,
	datad => \R6|r7|d_ff|master|q~65_combout\,
	combout => \R6|r7|d_ff|master|q~65_combout\);

\R6|r7|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R6|r7|d_ff|slave|q~64_combout\ = GLOBAL(\AND6|o~37clkctrl_outclk\) & (\R6|r7|d_ff|master|q~65_combout\) # !GLOBAL(\AND6|o~37clkctrl_outclk\) & \R6|r7|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \R6|r7|d_ff|slave|q~64_combout\,
	datac => \AND6|o~37clkctrl_outclk\,
	datad => \R6|r7|d_ff|master|q~65_combout\,
	combout => \R6|r7|d_ff|slave|q~64_combout\);

\R8|r7|d_ff|master|q~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \R8|r7|d_ff|master|q~65_combout\ = GLOBAL(\AND8|o~clkctrl_outclk\) & !\datain~combout\(7) # !GLOBAL(\AND8|o~clkctrl_outclk\) & (\R8|r7|d_ff|master|q~65_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(7),
	datac => \R8|r7|d_ff|master|q~65_combout\,
	datad => \AND8|o~clkctrl_outclk\,
	combout => \R8|r7|d_ff|master|q~65_combout\);

\R8|r7|d_ff|slave|q~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \R8|r7|d_ff|slave|q~64_combout\ = GLOBAL(\AND8|o~clkctrl_outclk\) & (\R8|r7|d_ff|master|q~65_combout\) # !GLOBAL(\AND8|o~clkctrl_outclk\) & \R8|r7|d_ff|slave|q~64_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R8|r7|d_ff|slave|q~64_combout\,
	datab => \AND8|o~clkctrl_outclk\,
	datad => \R8|r7|d_ff|master|q~65_combout\,
	combout => \R8|r7|d_ff|slave|q~64_combout\);

\MUXA|o[7]~369\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[7]~369_combout\ = \MUXA|o[7]~368_combout\ & (!\R8|r7|d_ff|slave|q~64_combout\ # !\r_addr~combout\(0)) # !\MUXA|o[7]~368_combout\ & !\R6|r7|d_ff|slave|q~64_combout\ & \r_addr~combout\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUXA|o[7]~368_combout\,
	datab => \R6|r7|d_ff|slave|q~64_combout\,
	datac => \r_addr~combout\(0),
	datad => \R8|r7|d_ff|slave|q~64_combout\,
	combout => \MUXA|o[7]~369_combout\);

\MUXA|o[7]~372\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[7]~372_combout\ = \r_addr~combout\(2) & (\MUXA|o[7]~369_combout\) # !\r_addr~combout\(2) & \MUXA|o[7]~371_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MUXA|o[7]~371_combout\,
	datac => \r_addr~combout\(2),
	datad => \MUXA|o[7]~369_combout\,
	combout => \MUXA|o[7]~372_combout\);

\dataout[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \MUXA|o[0]~337_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataout(0));

\dataout[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \MUXA|o[1]~342_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataout(1));

\dataout[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \MUXA|o[2]~347_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataout(2));

\dataout[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \MUXA|o[3]~352_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataout(3));

\dataout[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \MUXA|o[4]~357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataout(4));

\dataout[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \MUXA|o[5]~362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataout(5));

\dataout[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \MUXA|o[6]~367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataout(6));

\dataout[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \MUXA|o[7]~372_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataout(7));
END structure;


