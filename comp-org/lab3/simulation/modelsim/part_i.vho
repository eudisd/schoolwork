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

-- DATE "09/22/2011 17:41:11"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE, cycloneii;
USE IEEE.std_logic_1164.all;
USE cycloneii.cycloneii_components.all;

ENTITY 	part_i IS
    PORT (
	w : IN std_logic;
	reset : IN std_logic;
	clock : IN std_logic;
	z : OUT std_logic
	);
END part_i;

ARCHITECTURE structure OF part_i IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_w : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_z : std_logic;
SIGNAL \clock~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~combout\ : std_logic;
SIGNAL \clock~combout\ : std_logic;
SIGNAL \clock~clkctrl_outclk\ : std_logic;
SIGNAL \w~combout\ : std_logic;
SIGNAL \y_q.e~regout\ : std_logic;
SIGNAL \y_q~152_combout\ : std_logic;
SIGNAL \y_q~153_combout\ : std_logic;
SIGNAL \y_q.b~regout\ : std_logic;
SIGNAL \y_q~149_combout\ : std_logic;
SIGNAL \y_q.c~regout\ : std_logic;
SIGNAL \y_q~147_combout\ : std_logic;
SIGNAL \y_q.d~regout\ : std_logic;
SIGNAL \z~111_combout\ : std_logic;
SIGNAL \y_q.i~regout\ : std_logic;
SIGNAL \y_q~150_combout\ : std_logic;
SIGNAL \y_q~151_combout\ : std_logic;
SIGNAL \y_q.f~regout\ : std_logic;
SIGNAL \y_q~148_combout\ : std_logic;
SIGNAL \y_q.g~regout\ : std_logic;
SIGNAL \y_q~146_combout\ : std_logic;
SIGNAL \y_q.h~regout\ : std_logic;
SIGNAL \y_q~145_combout\ : std_logic;
SIGNAL \z~112_combout\ : std_logic;
SIGNAL \z~reg0_regout\ : std_logic;

BEGIN

ww_w <= w;
ww_reset <= reset;
ww_clock <= clock;
z <= ww_z;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clock~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clock~combout\);

\reset~I\ : cycloneii_io
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
	padio => ww_reset,
	combout => \reset~combout\);

\clock~I\ : cycloneii_io
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
	padio => ww_clock,
	combout => \clock~combout\);

\clock~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "falling edge")
-- pragma translate_on
PORT MAP (
	inclk => \clock~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock~clkctrl_outclk\);

\w~I\ : cycloneii_io
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
	padio => ww_w,
	combout => \w~combout\);

\y_q.e\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \z~111_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.e~regout\);

\y_q~152\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~152_combout\ = \w~combout\ # \y_q.c~regout\ # \y_q.e~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w~combout\,
	datac => \y_q.c~regout\,
	datad => \y_q.e~regout\,
	combout => \y_q~152_combout\);

\y_q~153\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~153_combout\ = !\reset~combout\ & !\y_q.d~regout\ & !\y_q.b~regout\ & !\y_q~152_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => \y_q.d~regout\,
	datac => \y_q.b~regout\,
	datad => \y_q~152_combout\,
	combout => \y_q~153_combout\);

\y_q.b\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~153_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.b~regout\);

\y_q~149\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~149_combout\ = !\reset~combout\ & !\w~combout\ & \y_q.b~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => \w~combout\,
	datac => \y_q.b~regout\,
	combout => \y_q~149_combout\);

\y_q.c\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~149_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.c~regout\);

\y_q~147\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~147_combout\ = !\reset~combout\ & !\w~combout\ & \y_q.c~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => \w~combout\,
	datac => \y_q.c~regout\,
	combout => \y_q~147_combout\);

\y_q.d\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~147_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.d~regout\);

\z~111\ : cycloneii_lcell_comb
-- Equation(s):
-- \z~111_combout\ = !\reset~combout\ & !\w~combout\ & (\y_q.e~regout\ # \y_q.d~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => \w~combout\,
	datac => \y_q.e~regout\,
	datad => \y_q.d~regout\,
	combout => \z~111_combout\);

\y_q.i\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~145_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.i~regout\);

\y_q~150\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~150_combout\ = \reset~combout\ # \y_q.i~regout\ # \y_q.g~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datac => \y_q.i~regout\,
	datad => \y_q.g~regout\,
	combout => \y_q~150_combout\);

\y_q~151\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~151_combout\ = !\y_q.h~regout\ & \w~combout\ & !\y_q.f~regout\ & !\y_q~150_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \y_q.h~regout\,
	datab => \w~combout\,
	datac => \y_q.f~regout\,
	datad => \y_q~150_combout\,
	combout => \y_q~151_combout\);

\y_q.f\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~151_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.f~regout\);

\y_q~148\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~148_combout\ = !\reset~combout\ & \w~combout\ & \y_q.f~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datac => \w~combout\,
	datad => \y_q.f~regout\,
	combout => \y_q~148_combout\);

\y_q.g\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~148_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.g~regout\);

\y_q~146\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~146_combout\ = !\reset~combout\ & \w~combout\ & \y_q.g~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datac => \w~combout\,
	datad => \y_q.g~regout\,
	combout => \y_q~146_combout\);

\y_q.h\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~146_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.h~regout\);

\y_q~145\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~145_combout\ = !\reset~combout\ & \w~combout\ & (\y_q.i~regout\ # \y_q.h~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => \w~combout\,
	datac => \y_q.i~regout\,
	datad => \y_q.h~regout\,
	combout => \y_q~145_combout\);

\z~112\ : cycloneii_lcell_comb
-- Equation(s):
-- \z~112_combout\ = \z~111_combout\ # \y_q~145_combout\ # \reset~combout\ & \z~reg0_regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => \z~111_combout\,
	datac => \z~reg0_regout\,
	datad => \y_q~145_combout\,
	combout => \z~112_combout\);

\z~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \z~112_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \z~reg0_regout\);

\z~I\ : cycloneii_io
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
	datain => \z~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_z);
END structure;


