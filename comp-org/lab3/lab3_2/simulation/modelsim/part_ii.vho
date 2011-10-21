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

-- DATE "09/23/2011 11:29:31"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE, cycloneii;
USE IEEE.std_logic_1164.all;
USE cycloneii.cycloneii_components.all;

ENTITY 	part_ii IS
    PORT (
	w : IN std_logic;
	reset : IN std_logic;
	clock : IN std_logic;
	z : OUT std_logic
	);
END part_ii;

ARCHITECTURE structure OF part_ii IS
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
SIGNAL \y_q.i~regout\ : std_logic;
SIGNAL \y_q.q~regout\ : std_logic;
SIGNAL \y_q~270_combout\ : std_logic;
SIGNAL \y_q~272_combout\ : std_logic;
SIGNAL \y_q.k~regout\ : std_logic;
SIGNAL \y_q.b~regout\ : std_logic;
SIGNAL \y_q.j~regout\ : std_logic;
SIGNAL \y_q~283_combout\ : std_logic;
SIGNAL \y_q~284_combout\ : std_logic;
SIGNAL \y_q~285_combout\ : std_logic;
SIGNAL \y_q~286_combout\ : std_logic;
SIGNAL \y_q~287_combout\ : std_logic;
SIGNAL \y_q~288_combout\ : std_logic;
SIGNAL \y_q~289_combout\ : std_logic;
SIGNAL \clock~combout\ : std_logic;
SIGNAL \clock~clkctrl_outclk\ : std_logic;
SIGNAL \w~combout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \y_q~282_combout\ : std_logic;
SIGNAL \y_q.c~regout\ : std_logic;
SIGNAL \y_q~280_combout\ : std_logic;
SIGNAL \y_q.d~regout\ : std_logic;
SIGNAL \y_q~278_combout\ : std_logic;
SIGNAL \y_q.e~regout\ : std_logic;
SIGNAL \y_q~276_combout\ : std_logic;
SIGNAL \y_q.f~regout\ : std_logic;
SIGNAL \y_q~274_combout\ : std_logic;
SIGNAL \y_q.g~regout\ : std_logic;
SIGNAL \y_q~271_combout\ : std_logic;
SIGNAL \y_q.h~regout\ : std_logic;
SIGNAL \y_q~281_combout\ : std_logic;
SIGNAL \y_q.l~regout\ : std_logic;
SIGNAL \y_q~279_combout\ : std_logic;
SIGNAL \y_q.m~regout\ : std_logic;
SIGNAL \y_q~277_combout\ : std_logic;
SIGNAL \y_q.n~regout\ : std_logic;
SIGNAL \y_q~275_combout\ : std_logic;
SIGNAL \y_q.o~regout\ : std_logic;
SIGNAL \y_q~273_combout\ : std_logic;
SIGNAL \y_q.p~regout\ : std_logic;
SIGNAL \Selector2~116_combout\ : std_logic;
SIGNAL \Selector2~117_combout\ : std_logic;
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

\y_q.i\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~270_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.i~regout\);

\y_q.q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~272_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.q~regout\);

\y_q~270\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~270_combout\ = !\w~combout\ & !\reset~combout\ & (\y_q.h~regout\ # \y_q.i~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \y_q.h~regout\,
	datab => \w~combout\,
	datac => \y_q.i~regout\,
	datad => \reset~combout\,
	combout => \y_q~270_combout\);

\y_q~272\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~272_combout\ = \w~combout\ & !\reset~combout\ & (\y_q.p~regout\ # \y_q.q~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \y_q.p~regout\,
	datab => \w~combout\,
	datac => \y_q.q~regout\,
	datad => \reset~combout\,
	combout => \y_q~272_combout\);

\y_q.k\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~283_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.k~regout\);

\y_q.b\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~286_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.b~regout\);

\y_q.j\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~289_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.j~regout\);

\y_q~283\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~283_combout\ = \y_q.j~regout\ & \w~combout\ & !\reset~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \y_q.j~regout\,
	datab => \w~combout\,
	datac => \reset~combout\,
	combout => \y_q~283_combout\);

\y_q~284\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~284_combout\ = !\w~combout\ & !\reset~combout\ & !\y_q.h~regout\ & !\y_q.i~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w~combout\,
	datab => \reset~combout\,
	datac => \y_q.h~regout\,
	datad => \y_q.i~regout\,
	combout => \y_q~284_combout\);

\y_q~285\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~285_combout\ = !\y_q.g~regout\ & !\y_q.f~regout\ & !\y_q.e~regout\ & !\y_q.d~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \y_q.g~regout\,
	datab => \y_q.f~regout\,
	datac => \y_q.e~regout\,
	datad => \y_q.d~regout\,
	combout => \y_q~285_combout\);

\y_q~286\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~286_combout\ = !\y_q.c~regout\ & \y_q~285_combout\ & !\y_q.b~regout\ & \y_q~284_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \y_q.c~regout\,
	datab => \y_q~285_combout\,
	datac => \y_q.b~regout\,
	datad => \y_q~284_combout\,
	combout => \y_q~286_combout\);

\y_q~287\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~287_combout\ = \w~combout\ & !\reset~combout\ & !\y_q.p~regout\ & !\y_q.q~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w~combout\,
	datab => \reset~combout\,
	datac => \y_q.p~regout\,
	datad => \y_q.q~regout\,
	combout => \y_q~287_combout\);

\y_q~288\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~288_combout\ = !\y_q.n~regout\ & !\y_q.l~regout\ & !\y_q.o~regout\ & !\y_q.m~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \y_q.n~regout\,
	datab => \y_q.l~regout\,
	datac => \y_q.o~regout\,
	datad => \y_q.m~regout\,
	combout => \y_q~288_combout\);

\y_q~289\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~289_combout\ = !\y_q.k~regout\ & \y_q~287_combout\ & !\y_q.j~regout\ & \y_q~288_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \y_q.k~regout\,
	datab => \y_q~287_combout\,
	datac => \y_q.j~regout\,
	datad => \y_q~288_combout\,
	combout => \y_q~289_combout\);

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

\y_q~282\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~282_combout\ = \y_q.b~regout\ & !\w~combout\ & !\reset~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \y_q.b~regout\,
	datab => \w~combout\,
	datac => \reset~combout\,
	combout => \y_q~282_combout\);

\y_q.c\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~282_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.c~regout\);

\y_q~280\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~280_combout\ = !\w~combout\ & \y_q.c~regout\ & !\reset~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w~combout\,
	datac => \y_q.c~regout\,
	datad => \reset~combout\,
	combout => \y_q~280_combout\);

\y_q.d\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~280_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.d~regout\);

\y_q~278\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~278_combout\ = !\w~combout\ & \y_q.d~regout\ & !\reset~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w~combout\,
	datac => \y_q.d~regout\,
	datad => \reset~combout\,
	combout => \y_q~278_combout\);

\y_q.e\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~278_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.e~regout\);

\y_q~276\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~276_combout\ = !\w~combout\ & \y_q.e~regout\ & !\reset~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w~combout\,
	datac => \y_q.e~regout\,
	datad => \reset~combout\,
	combout => \y_q~276_combout\);

\y_q.f\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~276_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.f~regout\);

\y_q~274\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~274_combout\ = !\w~combout\ & \y_q.f~regout\ & !\reset~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w~combout\,
	datac => \y_q.f~regout\,
	datad => \reset~combout\,
	combout => \y_q~274_combout\);

\y_q.g\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~274_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.g~regout\);

\y_q~271\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~271_combout\ = !\w~combout\ & \y_q.g~regout\ & !\reset~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w~combout\,
	datac => \y_q.g~regout\,
	datad => \reset~combout\,
	combout => \y_q~271_combout\);

\y_q.h\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~271_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.h~regout\);

\y_q~281\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~281_combout\ = \y_q.k~regout\ & !\reset~combout\ & \w~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \y_q.k~regout\,
	datac => \reset~combout\,
	datad => \w~combout\,
	combout => \y_q~281_combout\);

\y_q.l\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~281_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.l~regout\);

\y_q~279\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~279_combout\ = \y_q.l~regout\ & !\reset~combout\ & \w~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \y_q.l~regout\,
	datac => \reset~combout\,
	datad => \w~combout\,
	combout => \y_q~279_combout\);

\y_q.m\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~279_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.m~regout\);

\y_q~277\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~277_combout\ = !\reset~combout\ & \w~combout\ & \y_q.m~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => \w~combout\,
	datac => \y_q.m~regout\,
	combout => \y_q~277_combout\);

\y_q.n\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~277_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.n~regout\);

\y_q~275\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~275_combout\ = \y_q.n~regout\ & !\reset~combout\ & \w~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \y_q.n~regout\,
	datac => \reset~combout\,
	datad => \w~combout\,
	combout => \y_q~275_combout\);

\y_q.o\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~275_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.o~regout\);

\y_q~273\ : cycloneii_lcell_comb
-- Equation(s):
-- \y_q~273_combout\ = \w~combout\ & \y_q.o~regout\ & !\reset~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w~combout\,
	datac => \y_q.o~regout\,
	datad => \reset~combout\,
	combout => \y_q~273_combout\);

\y_q.p\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \y_q~273_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \y_q.p~regout\);

\Selector2~116\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector2~116_combout\ = \w~combout\ & (\y_q.q~regout\ # \z~reg0_regout\ # \y_q.p~regout\) # !\w~combout\ & \z~reg0_regout\ & (\y_q.q~regout\ # \y_q.p~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \y_q.q~regout\,
	datab => \w~combout\,
	datac => \z~reg0_regout\,
	datad => \y_q.p~regout\,
	combout => \Selector2~116_combout\);

\Selector2~117\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector2~117_combout\ = \Selector2~116_combout\ # !\y_q.i~regout\ & !\y_q.h~regout\ & \z~reg0_regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \y_q.i~regout\,
	datab => \y_q.h~regout\,
	datac => \z~reg0_regout\,
	datad => \Selector2~116_combout\,
	combout => \Selector2~117_combout\);

\z~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \Selector2~117_combout\,
	sclr => \reset~combout\,
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


