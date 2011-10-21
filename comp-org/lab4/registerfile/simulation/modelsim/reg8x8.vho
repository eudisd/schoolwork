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

-- DATE "10/07/2011 12:39:44"

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
	w_addr : IN std_logic_vector(1 DOWNTO 0);
	datain : IN std_logic_vector(3 DOWNTO 0);
	r_addr_a : IN std_logic_vector(1 DOWNTO 0);
	r_addr_b : IN std_logic_vector(1 DOWNTO 0);
	dataouta : OUT std_logic_vector(3 DOWNTO 0);
	dataoutb : OUT std_logic_vector(3 DOWNTO 0)
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
SIGNAL ww_w_addr : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_datain : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_r_addr_a : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_r_addr_b : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_dataouta : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_dataoutb : std_logic_vector(3 DOWNTO 0);
SIGNAL \R4|r1|d_ff|master|q~61_combout\ : std_logic;
SIGNAL \clock4~combout\ : std_logic;
SIGNAL \AND1|o~17_combout\ : std_logic;
SIGNAL \R3|r0|d_ff|master|q~61_combout\ : std_logic;
SIGNAL \R3|r0|d_ff|slave|q~60_combout\ : std_logic;
SIGNAL \R1|r0|d_ff|master|q~61_combout\ : std_logic;
SIGNAL \R1|r0|d_ff|slave|q~60_combout\ : std_logic;
SIGNAL \MUXA|o[0]~68_combout\ : std_logic;
SIGNAL \DEC|Mux1~61_combout\ : std_logic;
SIGNAL \R2|r0|d_ff|master|q~61_combout\ : std_logic;
SIGNAL \R2|r0|d_ff|slave|q~60_combout\ : std_logic;
SIGNAL \R4|r0|d_ff|master|q~61_combout\ : std_logic;
SIGNAL \R4|r0|d_ff|slave|q~60_combout\ : std_logic;
SIGNAL \MUXA|o[0]~69_combout\ : std_logic;
SIGNAL \R3|r1|d_ff|master|q~61_combout\ : std_logic;
SIGNAL \R3|r1|d_ff|slave|q~60_combout\ : std_logic;
SIGNAL \R2|r1|d_ff|master|q~61_combout\ : std_logic;
SIGNAL \R2|r1|d_ff|slave|q~60_combout\ : std_logic;
SIGNAL \R1|r1|d_ff|master|q~61_combout\ : std_logic;
SIGNAL \R1|r1|d_ff|slave|q~60_combout\ : std_logic;
SIGNAL \MUXA|o[1]~70_combout\ : std_logic;
SIGNAL \R4|r1|d_ff|slave|q~60_combout\ : std_logic;
SIGNAL \MUXA|o[1]~71_combout\ : std_logic;
SIGNAL \R2|r2|d_ff|master|q~61_combout\ : std_logic;
SIGNAL \R2|r2|d_ff|slave|q~60_combout\ : std_logic;
SIGNAL \R1|r2|d_ff|master|q~61_combout\ : std_logic;
SIGNAL \R1|r2|d_ff|slave|q~60_combout\ : std_logic;
SIGNAL \R3|r2|d_ff|master|q~61_combout\ : std_logic;
SIGNAL \R3|r2|d_ff|slave|q~60_combout\ : std_logic;
SIGNAL \MUXA|o[2]~72_combout\ : std_logic;
SIGNAL \R4|r2|d_ff|master|q~61_combout\ : std_logic;
SIGNAL \R4|r2|d_ff|slave|q~60_combout\ : std_logic;
SIGNAL \MUXA|o[2]~73_combout\ : std_logic;
SIGNAL \R2|r3|d_ff|master|q~61_combout\ : std_logic;
SIGNAL \R2|r3|d_ff|slave|q~60_combout\ : std_logic;
SIGNAL \R1|r3|d_ff|master|q~61_combout\ : std_logic;
SIGNAL \R1|r3|d_ff|slave|q~60_combout\ : std_logic;
SIGNAL \MUXA|o[3]~74_combout\ : std_logic;
SIGNAL \R4|r3|d_ff|master|q~61_combout\ : std_logic;
SIGNAL \R4|r3|d_ff|slave|q~60_combout\ : std_logic;
SIGNAL \R3|r3|d_ff|master|q~61_combout\ : std_logic;
SIGNAL \R3|r3|d_ff|slave|q~60_combout\ : std_logic;
SIGNAL \MUXA|o[3]~75_combout\ : std_logic;
SIGNAL \MUXB|o[0]~68_combout\ : std_logic;
SIGNAL \MUXB|o[0]~69_combout\ : std_logic;
SIGNAL \MUXB|o[1]~70_combout\ : std_logic;
SIGNAL \MUXB|o[1]~71_combout\ : std_logic;
SIGNAL \MUXB|o[2]~72_combout\ : std_logic;
SIGNAL \MUXB|o[2]~73_combout\ : std_logic;
SIGNAL \MUXB|o[3]~74_combout\ : std_logic;
SIGNAL \MUXB|o[3]~75_combout\ : std_logic;
SIGNAL \datain~combout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \r_addr_a~combout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \r_addr_b~combout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \w_addr~combout\ : std_logic_vector(1 DOWNTO 0);

BEGIN

ww_clock4 <= clock4;
ww_w_addr <= w_addr;
ww_datain <= datain;
ww_r_addr_a <= r_addr_a;
ww_r_addr_b <= r_addr_b;
dataouta <= ww_dataouta;
dataoutb <= ww_dataoutb;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\R4|r1|d_ff|master|q~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r1|d_ff|master|q~61_combout\ = \w_addr~combout\(1) & (\DEC|Mux1~61_combout\ & !\datain~combout\(1) # !\DEC|Mux1~61_combout\ & (\R4|r1|d_ff|master|q~61_combout\)) # !\w_addr~combout\(1) & (\R4|r1|d_ff|master|q~61_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(1),
	datab => \datain~combout\(1),
	datac => \R4|r1|d_ff|master|q~61_combout\,
	datad => \DEC|Mux1~61_combout\,
	combout => \R4|r1|d_ff|master|q~61_combout\);

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

\AND1|o~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \AND1|o~17_combout\ = !\w_addr~combout\(0) & \clock4~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w_addr~combout\(0),
	datac => \clock4~combout\,
	combout => \AND1|o~17_combout\);

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

\R3|r0|d_ff|master|q~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r0|d_ff|master|q~61_combout\ = \w_addr~combout\(1) & (\AND1|o~17_combout\ & !\datain~combout\(0) # !\AND1|o~17_combout\ & (\R3|r0|d_ff|master|q~61_combout\)) # !\w_addr~combout\(1) & (\R3|r0|d_ff|master|q~61_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(1),
	datab => \AND1|o~17_combout\,
	datac => \datain~combout\(0),
	datad => \R3|r0|d_ff|master|q~61_combout\,
	combout => \R3|r0|d_ff|master|q~61_combout\);

\R3|r0|d_ff|slave|q~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r0|d_ff|slave|q~60_combout\ = \w_addr~combout\(1) & (\AND1|o~17_combout\ & (\R3|r0|d_ff|master|q~61_combout\) # !\AND1|o~17_combout\ & \R3|r0|d_ff|slave|q~60_combout\) # !\w_addr~combout\(1) & \R3|r0|d_ff|slave|q~60_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(1),
	datab => \R3|r0|d_ff|slave|q~60_combout\,
	datac => \AND1|o~17_combout\,
	datad => \R3|r0|d_ff|master|q~61_combout\,
	combout => \R3|r0|d_ff|slave|q~60_combout\);

\r_addr_a[1]~I\ : cycloneii_io
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
	padio => ww_r_addr_a(1),
	combout => \r_addr_a~combout\(1));

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

\R1|r0|d_ff|master|q~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r0|d_ff|master|q~61_combout\ = \AND1|o~17_combout\ & (\w_addr~combout\(1) & (\R1|r0|d_ff|master|q~61_combout\) # !\w_addr~combout\(1) & !\datain~combout\(0)) # !\AND1|o~17_combout\ & (\R1|r0|d_ff|master|q~61_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(0),
	datab => \AND1|o~17_combout\,
	datac => \R1|r0|d_ff|master|q~61_combout\,
	datad => \w_addr~combout\(1),
	combout => \R1|r0|d_ff|master|q~61_combout\);

\R1|r0|d_ff|slave|q~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r0|d_ff|slave|q~60_combout\ = \w_addr~combout\(1) & (\R1|r0|d_ff|slave|q~60_combout\) # !\w_addr~combout\(1) & (\AND1|o~17_combout\ & \R1|r0|d_ff|master|q~61_combout\ # !\AND1|o~17_combout\ & (\R1|r0|d_ff|slave|q~60_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(1),
	datab => \AND1|o~17_combout\,
	datac => \R1|r0|d_ff|master|q~61_combout\,
	datad => \R1|r0|d_ff|slave|q~60_combout\,
	combout => \R1|r0|d_ff|slave|q~60_combout\);

\MUXA|o[0]~68\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[0]~68_combout\ = \r_addr_a~combout\(0) & (\r_addr_a~combout\(1)) # !\r_addr_a~combout\(0) & (\r_addr_a~combout\(1) & !\R3|r0|d_ff|slave|q~60_combout\ # !\r_addr_a~combout\(1) & (!\R1|r0|d_ff|slave|q~60_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_addr_a~combout\(0),
	datab => \R3|r0|d_ff|slave|q~60_combout\,
	datac => \r_addr_a~combout\(1),
	datad => \R1|r0|d_ff|slave|q~60_combout\,
	combout => \MUXA|o[0]~68_combout\);

\r_addr_a[0]~I\ : cycloneii_io
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
	padio => ww_r_addr_a(0),
	combout => \r_addr_a~combout\(0));

\DEC|Mux1~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \DEC|Mux1~61_combout\ = \w_addr~combout\(0) & \clock4~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w_addr~combout\(0),
	datac => \clock4~combout\,
	combout => \DEC|Mux1~61_combout\);

\R2|r0|d_ff|master|q~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r0|d_ff|master|q~61_combout\ = \DEC|Mux1~61_combout\ & (\w_addr~combout\(1) & (\R2|r0|d_ff|master|q~61_combout\) # !\w_addr~combout\(1) & !\datain~combout\(0)) # !\DEC|Mux1~61_combout\ & (\R2|r0|d_ff|master|q~61_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(0),
	datab => \R2|r0|d_ff|master|q~61_combout\,
	datac => \DEC|Mux1~61_combout\,
	datad => \w_addr~combout\(1),
	combout => \R2|r0|d_ff|master|q~61_combout\);

\R2|r0|d_ff|slave|q~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r0|d_ff|slave|q~60_combout\ = \DEC|Mux1~61_combout\ & (\w_addr~combout\(1) & \R2|r0|d_ff|slave|q~60_combout\ # !\w_addr~combout\(1) & (\R2|r0|d_ff|master|q~61_combout\)) # !\DEC|Mux1~61_combout\ & \R2|r0|d_ff|slave|q~60_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R2|r0|d_ff|slave|q~60_combout\,
	datab => \R2|r0|d_ff|master|q~61_combout\,
	datac => \DEC|Mux1~61_combout\,
	datad => \w_addr~combout\(1),
	combout => \R2|r0|d_ff|slave|q~60_combout\);

\R4|r0|d_ff|master|q~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r0|d_ff|master|q~61_combout\ = \DEC|Mux1~61_combout\ & (\w_addr~combout\(1) & !\datain~combout\(0) # !\w_addr~combout\(1) & (\R4|r0|d_ff|master|q~61_combout\)) # !\DEC|Mux1~61_combout\ & (\R4|r0|d_ff|master|q~61_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(0),
	datab => \R4|r0|d_ff|master|q~61_combout\,
	datac => \DEC|Mux1~61_combout\,
	datad => \w_addr~combout\(1),
	combout => \R4|r0|d_ff|master|q~61_combout\);

\R4|r0|d_ff|slave|q~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r0|d_ff|slave|q~60_combout\ = \DEC|Mux1~61_combout\ & (\w_addr~combout\(1) & (\R4|r0|d_ff|master|q~61_combout\) # !\w_addr~combout\(1) & \R4|r0|d_ff|slave|q~60_combout\) # !\DEC|Mux1~61_combout\ & \R4|r0|d_ff|slave|q~60_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R4|r0|d_ff|slave|q~60_combout\,
	datab => \R4|r0|d_ff|master|q~61_combout\,
	datac => \DEC|Mux1~61_combout\,
	datad => \w_addr~combout\(1),
	combout => \R4|r0|d_ff|slave|q~60_combout\);

\MUXA|o[0]~69\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[0]~69_combout\ = \MUXA|o[0]~68_combout\ & (!\R4|r0|d_ff|slave|q~60_combout\ # !\r_addr_a~combout\(0)) # !\MUXA|o[0]~68_combout\ & \r_addr_a~combout\(0) & !\R2|r0|d_ff|slave|q~60_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010011010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUXA|o[0]~68_combout\,
	datab => \r_addr_a~combout\(0),
	datac => \R2|r0|d_ff|slave|q~60_combout\,
	datad => \R4|r0|d_ff|slave|q~60_combout\,
	combout => \MUXA|o[0]~69_combout\);

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

\R3|r1|d_ff|master|q~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r1|d_ff|master|q~61_combout\ = \AND1|o~17_combout\ & (\w_addr~combout\(1) & (!\datain~combout\(1)) # !\w_addr~combout\(1) & \R3|r1|d_ff|master|q~61_combout\) # !\AND1|o~17_combout\ & \R3|r1|d_ff|master|q~61_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND1|o~17_combout\,
	datab => \R3|r1|d_ff|master|q~61_combout\,
	datac => \w_addr~combout\(1),
	datad => \datain~combout\(1),
	combout => \R3|r1|d_ff|master|q~61_combout\);

\R3|r1|d_ff|slave|q~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r1|d_ff|slave|q~60_combout\ = \AND1|o~17_combout\ & (\w_addr~combout\(1) & (\R3|r1|d_ff|master|q~61_combout\) # !\w_addr~combout\(1) & \R3|r1|d_ff|slave|q~60_combout\) # !\AND1|o~17_combout\ & \R3|r1|d_ff|slave|q~60_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AND1|o~17_combout\,
	datab => \R3|r1|d_ff|slave|q~60_combout\,
	datac => \w_addr~combout\(1),
	datad => \R3|r1|d_ff|master|q~61_combout\,
	combout => \R3|r1|d_ff|slave|q~60_combout\);

\R2|r1|d_ff|master|q~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r1|d_ff|master|q~61_combout\ = \w_addr~combout\(1) & (\R2|r1|d_ff|master|q~61_combout\) # !\w_addr~combout\(1) & (\DEC|Mux1~61_combout\ & !\datain~combout\(1) # !\DEC|Mux1~61_combout\ & (\R2|r1|d_ff|master|q~61_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(1),
	datab => \datain~combout\(1),
	datac => \R2|r1|d_ff|master|q~61_combout\,
	datad => \DEC|Mux1~61_combout\,
	combout => \R2|r1|d_ff|master|q~61_combout\);

\R2|r1|d_ff|slave|q~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r1|d_ff|slave|q~60_combout\ = \w_addr~combout\(1) & \R2|r1|d_ff|slave|q~60_combout\ # !\w_addr~combout\(1) & (\DEC|Mux1~61_combout\ & (\R2|r1|d_ff|master|q~61_combout\) # !\DEC|Mux1~61_combout\ & \R2|r1|d_ff|slave|q~60_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(1),
	datab => \R2|r1|d_ff|slave|q~60_combout\,
	datac => \R2|r1|d_ff|master|q~61_combout\,
	datad => \DEC|Mux1~61_combout\,
	combout => \R2|r1|d_ff|slave|q~60_combout\);

\R1|r1|d_ff|master|q~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r1|d_ff|master|q~61_combout\ = \w_addr~combout\(1) & (\R1|r1|d_ff|master|q~61_combout\) # !\w_addr~combout\(1) & (\AND1|o~17_combout\ & !\datain~combout\(1) # !\AND1|o~17_combout\ & (\R1|r1|d_ff|master|q~61_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(1),
	datab => \datain~combout\(1),
	datac => \R1|r1|d_ff|master|q~61_combout\,
	datad => \AND1|o~17_combout\,
	combout => \R1|r1|d_ff|master|q~61_combout\);

\R1|r1|d_ff|slave|q~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r1|d_ff|slave|q~60_combout\ = \w_addr~combout\(1) & \R1|r1|d_ff|slave|q~60_combout\ # !\w_addr~combout\(1) & (\AND1|o~17_combout\ & (\R1|r1|d_ff|master|q~61_combout\) # !\AND1|o~17_combout\ & \R1|r1|d_ff|slave|q~60_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R1|r1|d_ff|slave|q~60_combout\,
	datab => \R1|r1|d_ff|master|q~61_combout\,
	datac => \w_addr~combout\(1),
	datad => \AND1|o~17_combout\,
	combout => \R1|r1|d_ff|slave|q~60_combout\);

\MUXA|o[1]~70\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[1]~70_combout\ = \r_addr_a~combout\(1) & (\r_addr_a~combout\(0)) # !\r_addr_a~combout\(1) & (\r_addr_a~combout\(0) & !\R2|r1|d_ff|slave|q~60_combout\ # !\r_addr_a~combout\(0) & (!\R1|r1|d_ff|slave|q~60_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_addr_a~combout\(1),
	datab => \R2|r1|d_ff|slave|q~60_combout\,
	datac => \R1|r1|d_ff|slave|q~60_combout\,
	datad => \r_addr_a~combout\(0),
	combout => \MUXA|o[1]~70_combout\);

\R4|r1|d_ff|slave|q~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r1|d_ff|slave|q~60_combout\ = \DEC|Mux1~61_combout\ & (\w_addr~combout\(1) & \R4|r1|d_ff|master|q~61_combout\ # !\w_addr~combout\(1) & (\R4|r1|d_ff|slave|q~60_combout\)) # !\DEC|Mux1~61_combout\ & (\R4|r1|d_ff|slave|q~60_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R4|r1|d_ff|master|q~61_combout\,
	datab => \DEC|Mux1~61_combout\,
	datac => \w_addr~combout\(1),
	datad => \R4|r1|d_ff|slave|q~60_combout\,
	combout => \R4|r1|d_ff|slave|q~60_combout\);

\MUXA|o[1]~71\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[1]~71_combout\ = \r_addr_a~combout\(1) & (\MUXA|o[1]~70_combout\ & (!\R4|r1|d_ff|slave|q~60_combout\) # !\MUXA|o[1]~70_combout\ & !\R3|r1|d_ff|slave|q~60_combout\) # !\r_addr_a~combout\(1) & (\MUXA|o[1]~70_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101001011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_addr_a~combout\(1),
	datab => \R3|r1|d_ff|slave|q~60_combout\,
	datac => \MUXA|o[1]~70_combout\,
	datad => \R4|r1|d_ff|slave|q~60_combout\,
	combout => \MUXA|o[1]~71_combout\);

\R2|r2|d_ff|master|q~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r2|d_ff|master|q~61_combout\ = \DEC|Mux1~61_combout\ & (\w_addr~combout\(1) & (\R2|r2|d_ff|master|q~61_combout\) # !\w_addr~combout\(1) & !\datain~combout\(2)) # !\DEC|Mux1~61_combout\ & (\R2|r2|d_ff|master|q~61_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(2),
	datab => \DEC|Mux1~61_combout\,
	datac => \w_addr~combout\(1),
	datad => \R2|r2|d_ff|master|q~61_combout\,
	combout => \R2|r2|d_ff|master|q~61_combout\);

\R2|r2|d_ff|slave|q~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r2|d_ff|slave|q~60_combout\ = \w_addr~combout\(1) & \R2|r2|d_ff|slave|q~60_combout\ # !\w_addr~combout\(1) & (\DEC|Mux1~61_combout\ & (\R2|r2|d_ff|master|q~61_combout\) # !\DEC|Mux1~61_combout\ & \R2|r2|d_ff|slave|q~60_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R2|r2|d_ff|slave|q~60_combout\,
	datab => \R2|r2|d_ff|master|q~61_combout\,
	datac => \w_addr~combout\(1),
	datad => \DEC|Mux1~61_combout\,
	combout => \R2|r2|d_ff|slave|q~60_combout\);

\R1|r2|d_ff|master|q~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r2|d_ff|master|q~61_combout\ = \AND1|o~17_combout\ & (\w_addr~combout\(1) & (\R1|r2|d_ff|master|q~61_combout\) # !\w_addr~combout\(1) & !\datain~combout\(2)) # !\AND1|o~17_combout\ & (\R1|r2|d_ff|master|q~61_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datain~combout\(2),
	datab => \AND1|o~17_combout\,
	datac => \w_addr~combout\(1),
	datad => \R1|r2|d_ff|master|q~61_combout\,
	combout => \R1|r2|d_ff|master|q~61_combout\);

\R1|r2|d_ff|slave|q~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r2|d_ff|slave|q~60_combout\ = \w_addr~combout\(1) & (\R1|r2|d_ff|slave|q~60_combout\) # !\w_addr~combout\(1) & (\AND1|o~17_combout\ & \R1|r2|d_ff|master|q~61_combout\ # !\AND1|o~17_combout\ & (\R1|r2|d_ff|slave|q~60_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(1),
	datab => \R1|r2|d_ff|master|q~61_combout\,
	datac => \R1|r2|d_ff|slave|q~60_combout\,
	datad => \AND1|o~17_combout\,
	combout => \R1|r2|d_ff|slave|q~60_combout\);

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

\R3|r2|d_ff|master|q~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r2|d_ff|master|q~61_combout\ = \w_addr~combout\(1) & (\AND1|o~17_combout\ & (!\datain~combout\(2)) # !\AND1|o~17_combout\ & \R3|r2|d_ff|master|q~61_combout\) # !\w_addr~combout\(1) & (\R3|r2|d_ff|master|q~61_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(1),
	datab => \AND1|o~17_combout\,
	datac => \R3|r2|d_ff|master|q~61_combout\,
	datad => \datain~combout\(2),
	combout => \R3|r2|d_ff|master|q~61_combout\);

\R3|r2|d_ff|slave|q~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r2|d_ff|slave|q~60_combout\ = \w_addr~combout\(1) & (\AND1|o~17_combout\ & (\R3|r2|d_ff|master|q~61_combout\) # !\AND1|o~17_combout\ & \R3|r2|d_ff|slave|q~60_combout\) # !\w_addr~combout\(1) & \R3|r2|d_ff|slave|q~60_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R3|r2|d_ff|slave|q~60_combout\,
	datab => \R3|r2|d_ff|master|q~61_combout\,
	datac => \w_addr~combout\(1),
	datad => \AND1|o~17_combout\,
	combout => \R3|r2|d_ff|slave|q~60_combout\);

\MUXA|o[2]~72\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[2]~72_combout\ = \r_addr_a~combout\(1) & (\r_addr_a~combout\(0) # !\R3|r2|d_ff|slave|q~60_combout\) # !\r_addr_a~combout\(1) & !\R1|r2|d_ff|slave|q~60_combout\ & !\r_addr_a~combout\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_addr_a~combout\(1),
	datab => \R1|r2|d_ff|slave|q~60_combout\,
	datac => \r_addr_a~combout\(0),
	datad => \R3|r2|d_ff|slave|q~60_combout\,
	combout => \MUXA|o[2]~72_combout\);

\R4|r2|d_ff|master|q~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r2|d_ff|master|q~61_combout\ = \w_addr~combout\(1) & (\DEC|Mux1~61_combout\ & (!\datain~combout\(2)) # !\DEC|Mux1~61_combout\ & \R4|r2|d_ff|master|q~61_combout\) # !\w_addr~combout\(1) & \R4|r2|d_ff|master|q~61_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(1),
	datab => \R4|r2|d_ff|master|q~61_combout\,
	datac => \datain~combout\(2),
	datad => \DEC|Mux1~61_combout\,
	combout => \R4|r2|d_ff|master|q~61_combout\);

\R4|r2|d_ff|slave|q~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r2|d_ff|slave|q~60_combout\ = \w_addr~combout\(1) & (\DEC|Mux1~61_combout\ & \R4|r2|d_ff|master|q~61_combout\ # !\DEC|Mux1~61_combout\ & (\R4|r2|d_ff|slave|q~60_combout\)) # !\w_addr~combout\(1) & (\R4|r2|d_ff|slave|q~60_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(1),
	datab => \DEC|Mux1~61_combout\,
	datac => \R4|r2|d_ff|master|q~61_combout\,
	datad => \R4|r2|d_ff|slave|q~60_combout\,
	combout => \R4|r2|d_ff|slave|q~60_combout\);

\MUXA|o[2]~73\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[2]~73_combout\ = \MUXA|o[2]~72_combout\ & (!\R4|r2|d_ff|slave|q~60_combout\ # !\r_addr_a~combout\(0)) # !\MUXA|o[2]~72_combout\ & !\R2|r2|d_ff|slave|q~60_combout\ & \r_addr_a~combout\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001110011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R2|r2|d_ff|slave|q~60_combout\,
	datab => \MUXA|o[2]~72_combout\,
	datac => \r_addr_a~combout\(0),
	datad => \R4|r2|d_ff|slave|q~60_combout\,
	combout => \MUXA|o[2]~73_combout\);

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

\R2|r3|d_ff|master|q~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r3|d_ff|master|q~61_combout\ = \w_addr~combout\(1) & (\R2|r3|d_ff|master|q~61_combout\) # !\w_addr~combout\(1) & (\DEC|Mux1~61_combout\ & !\datain~combout\(3) # !\DEC|Mux1~61_combout\ & (\R2|r3|d_ff|master|q~61_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(1),
	datab => \DEC|Mux1~61_combout\,
	datac => \datain~combout\(3),
	datad => \R2|r3|d_ff|master|q~61_combout\,
	combout => \R2|r3|d_ff|master|q~61_combout\);

\R2|r3|d_ff|slave|q~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \R2|r3|d_ff|slave|q~60_combout\ = \w_addr~combout\(1) & (\R2|r3|d_ff|slave|q~60_combout\) # !\w_addr~combout\(1) & (\DEC|Mux1~61_combout\ & (\R2|r3|d_ff|master|q~61_combout\) # !\DEC|Mux1~61_combout\ & \R2|r3|d_ff|slave|q~60_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(1),
	datab => \DEC|Mux1~61_combout\,
	datac => \R2|r3|d_ff|slave|q~60_combout\,
	datad => \R2|r3|d_ff|master|q~61_combout\,
	combout => \R2|r3|d_ff|slave|q~60_combout\);

\R1|r3|d_ff|master|q~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r3|d_ff|master|q~61_combout\ = \w_addr~combout\(1) & (\R1|r3|d_ff|master|q~61_combout\) # !\w_addr~combout\(1) & (\AND1|o~17_combout\ & !\datain~combout\(3) # !\AND1|o~17_combout\ & (\R1|r3|d_ff|master|q~61_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(1),
	datab => \datain~combout\(3),
	datac => \AND1|o~17_combout\,
	datad => \R1|r3|d_ff|master|q~61_combout\,
	combout => \R1|r3|d_ff|master|q~61_combout\);

\R1|r3|d_ff|slave|q~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \R1|r3|d_ff|slave|q~60_combout\ = \w_addr~combout\(1) & (\R1|r3|d_ff|slave|q~60_combout\) # !\w_addr~combout\(1) & (\AND1|o~17_combout\ & \R1|r3|d_ff|master|q~61_combout\ # !\AND1|o~17_combout\ & (\R1|r3|d_ff|slave|q~60_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(1),
	datab => \R1|r3|d_ff|master|q~61_combout\,
	datac => \AND1|o~17_combout\,
	datad => \R1|r3|d_ff|slave|q~60_combout\,
	combout => \R1|r3|d_ff|slave|q~60_combout\);

\MUXA|o[3]~74\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[3]~74_combout\ = \r_addr_a~combout\(1) & \r_addr_a~combout\(0) # !\r_addr_a~combout\(1) & (\r_addr_a~combout\(0) & !\R2|r3|d_ff|slave|q~60_combout\ # !\r_addr_a~combout\(0) & (!\R1|r3|d_ff|slave|q~60_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_addr_a~combout\(1),
	datab => \r_addr_a~combout\(0),
	datac => \R2|r3|d_ff|slave|q~60_combout\,
	datad => \R1|r3|d_ff|slave|q~60_combout\,
	combout => \MUXA|o[3]~74_combout\);

\R4|r3|d_ff|master|q~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r3|d_ff|master|q~61_combout\ = \w_addr~combout\(1) & (\DEC|Mux1~61_combout\ & !\datain~combout\(3) # !\DEC|Mux1~61_combout\ & (\R4|r3|d_ff|master|q~61_combout\)) # !\w_addr~combout\(1) & (\R4|r3|d_ff|master|q~61_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(1),
	datab => \DEC|Mux1~61_combout\,
	datac => \datain~combout\(3),
	datad => \R4|r3|d_ff|master|q~61_combout\,
	combout => \R4|r3|d_ff|master|q~61_combout\);

\R4|r3|d_ff|slave|q~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \R4|r3|d_ff|slave|q~60_combout\ = \w_addr~combout\(1) & (\DEC|Mux1~61_combout\ & (\R4|r3|d_ff|master|q~61_combout\) # !\DEC|Mux1~61_combout\ & \R4|r3|d_ff|slave|q~60_combout\) # !\w_addr~combout\(1) & (\R4|r3|d_ff|slave|q~60_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(1),
	datab => \DEC|Mux1~61_combout\,
	datac => \R4|r3|d_ff|slave|q~60_combout\,
	datad => \R4|r3|d_ff|master|q~61_combout\,
	combout => \R4|r3|d_ff|slave|q~60_combout\);

\R3|r3|d_ff|master|q~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r3|d_ff|master|q~61_combout\ = \w_addr~combout\(1) & (\AND1|o~17_combout\ & !\datain~combout\(3) # !\AND1|o~17_combout\ & (\R3|r3|d_ff|master|q~61_combout\)) # !\w_addr~combout\(1) & (\R3|r3|d_ff|master|q~61_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(1),
	datab => \datain~combout\(3),
	datac => \AND1|o~17_combout\,
	datad => \R3|r3|d_ff|master|q~61_combout\,
	combout => \R3|r3|d_ff|master|q~61_combout\);

\R3|r3|d_ff|slave|q~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \R3|r3|d_ff|slave|q~60_combout\ = \w_addr~combout\(1) & (\AND1|o~17_combout\ & \R3|r3|d_ff|master|q~61_combout\ # !\AND1|o~17_combout\ & (\R3|r3|d_ff|slave|q~60_combout\)) # !\w_addr~combout\(1) & (\R3|r3|d_ff|slave|q~60_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_addr~combout\(1),
	datab => \R3|r3|d_ff|master|q~61_combout\,
	datac => \AND1|o~17_combout\,
	datad => \R3|r3|d_ff|slave|q~60_combout\,
	combout => \R3|r3|d_ff|slave|q~60_combout\);

\MUXA|o[3]~75\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXA|o[3]~75_combout\ = \r_addr_a~combout\(1) & (\MUXA|o[3]~74_combout\ & !\R4|r3|d_ff|slave|q~60_combout\ # !\MUXA|o[3]~74_combout\ & (!\R3|r3|d_ff|slave|q~60_combout\)) # !\r_addr_a~combout\(1) & \MUXA|o[3]~74_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_addr_a~combout\(1),
	datab => \MUXA|o[3]~74_combout\,
	datac => \R4|r3|d_ff|slave|q~60_combout\,
	datad => \R3|r3|d_ff|slave|q~60_combout\,
	combout => \MUXA|o[3]~75_combout\);

\r_addr_b[1]~I\ : cycloneii_io
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
	padio => ww_r_addr_b(1),
	combout => \r_addr_b~combout\(1));

\r_addr_b[0]~I\ : cycloneii_io
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
	padio => ww_r_addr_b(0),
	combout => \r_addr_b~combout\(0));

\MUXB|o[0]~68\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXB|o[0]~68_combout\ = \r_addr_b~combout\(1) & (\r_addr_b~combout\(0) # !\R3|r0|d_ff|slave|q~60_combout\) # !\r_addr_b~combout\(1) & !\R1|r0|d_ff|slave|q~60_combout\ & (!\r_addr_b~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R1|r0|d_ff|slave|q~60_combout\,
	datab => \R3|r0|d_ff|slave|q~60_combout\,
	datac => \r_addr_b~combout\(1),
	datad => \r_addr_b~combout\(0),
	combout => \MUXB|o[0]~68_combout\);

\MUXB|o[0]~69\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXB|o[0]~69_combout\ = \MUXB|o[0]~68_combout\ & (!\r_addr_b~combout\(0) # !\R4|r0|d_ff|slave|q~60_combout\) # !\MUXB|o[0]~68_combout\ & (!\R2|r0|d_ff|slave|q~60_combout\ & \r_addr_b~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100011111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R4|r0|d_ff|slave|q~60_combout\,
	datab => \MUXB|o[0]~68_combout\,
	datac => \R2|r0|d_ff|slave|q~60_combout\,
	datad => \r_addr_b~combout\(0),
	combout => \MUXB|o[0]~69_combout\);

\MUXB|o[1]~70\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXB|o[1]~70_combout\ = \r_addr_b~combout\(1) & (\r_addr_b~combout\(0)) # !\r_addr_b~combout\(1) & (\r_addr_b~combout\(0) & (!\R2|r1|d_ff|slave|q~60_combout\) # !\r_addr_b~combout\(0) & !\R1|r1|d_ff|slave|q~60_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R1|r1|d_ff|slave|q~60_combout\,
	datab => \R2|r1|d_ff|slave|q~60_combout\,
	datac => \r_addr_b~combout\(1),
	datad => \r_addr_b~combout\(0),
	combout => \MUXB|o[1]~70_combout\);

\MUXB|o[1]~71\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXB|o[1]~71_combout\ = \r_addr_b~combout\(1) & (\MUXB|o[1]~70_combout\ & !\R4|r1|d_ff|slave|q~60_combout\ # !\MUXB|o[1]~70_combout\ & (!\R3|r1|d_ff|slave|q~60_combout\)) # !\r_addr_b~combout\(1) & (\MUXB|o[1]~70_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R4|r1|d_ff|slave|q~60_combout\,
	datab => \R3|r1|d_ff|slave|q~60_combout\,
	datac => \r_addr_b~combout\(1),
	datad => \MUXB|o[1]~70_combout\,
	combout => \MUXB|o[1]~71_combout\);

\MUXB|o[2]~72\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXB|o[2]~72_combout\ = \r_addr_b~combout\(0) & (\r_addr_b~combout\(1)) # !\r_addr_b~combout\(0) & (\r_addr_b~combout\(1) & (!\R3|r2|d_ff|slave|q~60_combout\) # !\r_addr_b~combout\(1) & !\R1|r2|d_ff|slave|q~60_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000111110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_addr_b~combout\(0),
	datab => \R1|r2|d_ff|slave|q~60_combout\,
	datac => \r_addr_b~combout\(1),
	datad => \R3|r2|d_ff|slave|q~60_combout\,
	combout => \MUXB|o[2]~72_combout\);

\MUXB|o[2]~73\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXB|o[2]~73_combout\ = \r_addr_b~combout\(0) & (\MUXB|o[2]~72_combout\ & !\R4|r2|d_ff|slave|q~60_combout\ # !\MUXB|o[2]~72_combout\ & (!\R2|r2|d_ff|slave|q~60_combout\)) # !\r_addr_b~combout\(0) & (\MUXB|o[2]~72_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R4|r2|d_ff|slave|q~60_combout\,
	datab => \R2|r2|d_ff|slave|q~60_combout\,
	datac => \r_addr_b~combout\(0),
	datad => \MUXB|o[2]~72_combout\,
	combout => \MUXB|o[2]~73_combout\);

\MUXB|o[3]~74\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXB|o[3]~74_combout\ = \r_addr_b~combout\(1) & (\r_addr_b~combout\(0)) # !\r_addr_b~combout\(1) & (\r_addr_b~combout\(0) & (!\R2|r3|d_ff|slave|q~60_combout\) # !\r_addr_b~combout\(0) & !\R1|r3|d_ff|slave|q~60_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_addr_b~combout\(1),
	datab => \R1|r3|d_ff|slave|q~60_combout\,
	datac => \R2|r3|d_ff|slave|q~60_combout\,
	datad => \r_addr_b~combout\(0),
	combout => \MUXB|o[3]~74_combout\);

\MUXB|o[3]~75\ : cycloneii_lcell_comb
-- Equation(s):
-- \MUXB|o[3]~75_combout\ = \MUXB|o[3]~74_combout\ & (!\r_addr_b~combout\(1) # !\R4|r3|d_ff|slave|q~60_combout\) # !\MUXB|o[3]~74_combout\ & (!\R3|r3|d_ff|slave|q~60_combout\ & \r_addr_b~combout\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R4|r3|d_ff|slave|q~60_combout\,
	datab => \R3|r3|d_ff|slave|q~60_combout\,
	datac => \MUXB|o[3]~74_combout\,
	datad => \r_addr_b~combout\(1),
	combout => \MUXB|o[3]~75_combout\);

\dataouta[0]~I\ : cycloneii_io
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
	datain => \MUXA|o[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataouta(0));

\dataouta[1]~I\ : cycloneii_io
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
	datain => \MUXA|o[1]~71_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataouta(1));

\dataouta[2]~I\ : cycloneii_io
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
	datain => \MUXA|o[2]~73_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataouta(2));

\dataouta[3]~I\ : cycloneii_io
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
	datain => \MUXA|o[3]~75_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataouta(3));

\dataoutb[0]~I\ : cycloneii_io
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
	datain => \MUXB|o[0]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataoutb(0));

\dataoutb[1]~I\ : cycloneii_io
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
	datain => \MUXB|o[1]~71_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataoutb(1));

\dataoutb[2]~I\ : cycloneii_io
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
	datain => \MUXB|o[2]~73_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataoutb(2));

\dataoutb[3]~I\ : cycloneii_io
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
	datain => \MUXB|o[3]~75_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataoutb(3));
END structure;


