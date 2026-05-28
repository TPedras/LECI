-- Copyright (C) 2023  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 23.1std.0 Build 991 11/28/2023 SC Lite Edition"

-- DATE "04/07/2025 18:16:31"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Dec2_4 IS
    PORT (
	SW : IN std_logic_vector(1 DOWNTO 0);
	PROG : OUT std_logic_vector(3 DOWNTO 0);
	HEX_N : OUT std_logic_vector(6 DOWNTO 0)
	);
END Dec2_4;

ARCHITECTURE structure OF Dec2_4 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_SW : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_PROG : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_HEX_N : std_logic_vector(6 DOWNTO 0);
SIGNAL \PROG[0]~output_o\ : std_logic;
SIGNAL \PROG[1]~output_o\ : std_logic;
SIGNAL \PROG[2]~output_o\ : std_logic;
SIGNAL \PROG[3]~output_o\ : std_logic;
SIGNAL \HEX_N[0]~output_o\ : std_logic;
SIGNAL \HEX_N[1]~output_o\ : std_logic;
SIGNAL \HEX_N[2]~output_o\ : std_logic;
SIGNAL \HEX_N[3]~output_o\ : std_logic;
SIGNAL \HEX_N[4]~output_o\ : std_logic;
SIGNAL \HEX_N[5]~output_o\ : std_logic;
SIGNAL \HEX_N[6]~output_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \Equal3~0_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \Equal1~2_combout\ : std_logic;
SIGNAL \HEX_N~0_combout\ : std_logic;
SIGNAL \ALT_INV_Equal3~0_combout\ : std_logic;
SIGNAL \ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \ALT_INV_Equal1~2_combout\ : std_logic;
SIGNAL \ALT_INV_HEX_N~0_combout\ : std_logic;

BEGIN

ww_SW <= SW;
PROG <= ww_PROG;
HEX_N <= ww_HEX_N;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Equal3~0_combout\ <= NOT \Equal3~0_combout\;
\ALT_INV_Equal1~0_combout\ <= NOT \Equal1~0_combout\;
\ALT_INV_Equal1~2_combout\ <= NOT \Equal1~2_combout\;
\ALT_INV_HEX_N~0_combout\ <= NOT \HEX_N~0_combout\;

\PROG[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Equal3~0_combout\,
	devoe => ww_devoe,
	o => \PROG[0]~output_o\);

\PROG[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal1~0_combout\,
	devoe => ww_devoe,
	o => \PROG[1]~output_o\);

\PROG[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal1~1_combout\,
	devoe => ww_devoe,
	o => \PROG[2]~output_o\);

\PROG[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal1~2_combout\,
	devoe => ww_devoe,
	o => \PROG[3]~output_o\);

\HEX_N[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_HEX_N~0_combout\,
	devoe => ww_devoe,
	o => \HEX_N[0]~output_o\);

\HEX_N[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX_N[1]~output_o\);

\HEX_N[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal1~0_combout\,
	devoe => ww_devoe,
	o => \HEX_N[2]~output_o\);

\HEX_N[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_HEX_N~0_combout\,
	devoe => ww_devoe,
	o => \HEX_N[3]~output_o\);

\HEX_N[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Equal1~0_combout\,
	devoe => ww_devoe,
	o => \HEX_N[4]~output_o\);

\HEX_N[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Equal1~2_combout\,
	devoe => ww_devoe,
	o => \HEX_N[5]~output_o\);

\HEX_N[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Equal3~0_combout\,
	devoe => ww_devoe,
	o => \HEX_N[6]~output_o\);

\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

\SW[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

\Equal3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal3~0_combout\ = (\SW[0]~input_o\) # (\SW[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[1]~input_o\,
	combout => \Equal3~0_combout\);

\Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (\SW[0]~input_o\ & !\SW[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \Equal1~0_combout\);

\Equal1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = (\SW[1]~input_o\ & !\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \Equal1~1_combout\);

\Equal1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~2_combout\ = (\SW[0]~input_o\ & \SW[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[1]~input_o\,
	combout => \Equal1~2_combout\);

\HEX_N~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \HEX_N~0_combout\ = \SW[0]~input_o\ $ (\SW[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[0]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \HEX_N~0_combout\);

ww_PROG(0) <= \PROG[0]~output_o\;

ww_PROG(1) <= \PROG[1]~output_o\;

ww_PROG(2) <= \PROG[2]~output_o\;

ww_PROG(3) <= \PROG[3]~output_o\;

ww_HEX_N(0) <= \HEX_N[0]~output_o\;

ww_HEX_N(1) <= \HEX_N[1]~output_o\;

ww_HEX_N(2) <= \HEX_N[2]~output_o\;

ww_HEX_N(3) <= \HEX_N[3]~output_o\;

ww_HEX_N(4) <= \HEX_N[4]~output_o\;

ww_HEX_N(5) <= \HEX_N[5]~output_o\;

ww_HEX_N(6) <= \HEX_N[6]~output_o\;
END structure;


