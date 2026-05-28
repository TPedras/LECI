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

-- DATE "05/31/2025 21:27:40"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	TrafficLightsTop IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(0 DOWNTO 0);
	SW : IN std_logic_vector(0 DOWNTO 0);
	LEDR : BUFFER std_logic_vector(17 DOWNTO 0)
	);
END TrafficLightsTop;

ARCHITECTURE structure OF TrafficLightsTop IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(0 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(0 DOWNTO 0);
SIGNAL ww_LEDR : std_logic_vector(17 DOWNTO 0);
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \LEDR[1]~output_o\ : std_logic;
SIGNAL \LEDR[2]~output_o\ : std_logic;
SIGNAL \LEDR[3]~output_o\ : std_logic;
SIGNAL \LEDR[4]~output_o\ : std_logic;
SIGNAL \LEDR[5]~output_o\ : std_logic;
SIGNAL \LEDR[6]~output_o\ : std_logic;
SIGNAL \LEDR[7]~output_o\ : std_logic;
SIGNAL \LEDR[8]~output_o\ : std_logic;
SIGNAL \LEDR[9]~output_o\ : std_logic;
SIGNAL \LEDR[10]~output_o\ : std_logic;
SIGNAL \LEDR[11]~output_o\ : std_logic;
SIGNAL \LEDR[12]~output_o\ : std_logic;
SIGNAL \LEDR[13]~output_o\ : std_logic;
SIGNAL \LEDR[14]~output_o\ : std_logic;
SIGNAL \LEDR[15]~output_o\ : std_logic;
SIGNAL \LEDR[16]~output_o\ : std_logic;
SIGNAL \LEDR[17]~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \clk_div_1hz|Add0~0_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~1\ : std_logic;
SIGNAL \clk_div_1hz|Add0~2_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~3\ : std_logic;
SIGNAL \clk_div_1hz|Add0~4_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~5\ : std_logic;
SIGNAL \clk_div_1hz|Add0~6_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~7\ : std_logic;
SIGNAL \clk_div_1hz|Add0~8_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~9\ : std_logic;
SIGNAL \clk_div_1hz|Add0~10_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~11\ : std_logic;
SIGNAL \clk_div_1hz|Add0~12_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~13\ : std_logic;
SIGNAL \clk_div_1hz|Add0~14_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~49\ : std_logic;
SIGNAL \clk_div_1hz|Add0~50_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~0_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~51\ : std_logic;
SIGNAL \clk_div_1hz|Add0~52_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~53\ : std_logic;
SIGNAL \clk_div_1hz|Add0~54_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~55\ : std_logic;
SIGNAL \clk_div_1hz|Add0~56_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~57\ : std_logic;
SIGNAL \clk_div_1hz|Add0~58_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~59\ : std_logic;
SIGNAL \clk_div_1hz|Add0~60_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~0_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~1_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~2_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~3_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~4_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~5_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~10_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~7_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~8_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~9_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~11_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~11_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~15\ : std_logic;
SIGNAL \clk_div_1hz|Add0~16_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~17\ : std_logic;
SIGNAL \clk_div_1hz|Add0~18_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~19\ : std_logic;
SIGNAL \clk_div_1hz|Add0~20_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~21\ : std_logic;
SIGNAL \clk_div_1hz|Add0~22_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~23\ : std_logic;
SIGNAL \clk_div_1hz|Add0~24_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~10_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~25\ : std_logic;
SIGNAL \clk_div_1hz|Add0~26_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~9_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~27\ : std_logic;
SIGNAL \clk_div_1hz|Add0~28_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~8_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~29\ : std_logic;
SIGNAL \clk_div_1hz|Add0~30_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~3_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~31\ : std_logic;
SIGNAL \clk_div_1hz|Add0~32_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~33\ : std_logic;
SIGNAL \clk_div_1hz|Add0~34_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~2_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~35\ : std_logic;
SIGNAL \clk_div_1hz|Add0~36_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~37\ : std_logic;
SIGNAL \clk_div_1hz|Add0~38_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~7_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~39\ : std_logic;
SIGNAL \clk_div_1hz|Add0~40_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~6_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~41\ : std_logic;
SIGNAL \clk_div_1hz|Add0~42_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~5_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~43\ : std_logic;
SIGNAL \clk_div_1hz|Add0~44_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~4_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~45\ : std_logic;
SIGNAL \clk_div_1hz|Add0~46_combout\ : std_logic;
SIGNAL \clk_div_1hz|s_divCounter~1_combout\ : std_logic;
SIGNAL \clk_div_1hz|Add0~47\ : std_logic;
SIGNAL \clk_div_1hz|Add0~48_combout\ : std_logic;
SIGNAL \clk_div_1hz|clkOut~0_combout\ : std_logic;
SIGNAL \clk_div_1hz|clkOut~1_combout\ : std_logic;
SIGNAL \clk_div_1hz|clkOut~2_combout\ : std_logic;
SIGNAL \clk_div_1hz|Equal0~6_combout\ : std_logic;
SIGNAL \clk_div_1hz|clkOut~3_combout\ : std_logic;
SIGNAL \clk_div_1hz|clkOut~q\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \main_fsm|sync_proc~8_combout\ : std_logic;
SIGNAL \main_fsm|s_stateChanged~0_combout\ : std_logic;
SIGNAL \main_fsm|Selector9~0_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState~11_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState.TYellow2~q\ : std_logic;
SIGNAL \main_fsm|sync_proc~9_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState~16_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState.TRed2~q\ : std_logic;
SIGNAL \main_fsm|Selector4~0_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState~12_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState.TIntermit~q\ : std_logic;
SIGNAL \main_fsm|s_currentState.TInit~q\ : std_logic;
SIGNAL \main_fsm|Selector4~1_combout\ : std_logic;
SIGNAL \main_fsm|s_stateChanged~1_combout\ : std_logic;
SIGNAL \main_fsm|Selector7~0_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState~14_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState.TGreen1~q\ : std_logic;
SIGNAL \main_fsm|sync_proc~10_combout\ : std_logic;
SIGNAL \main_fsm|Selector6~0_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState~13_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState.TYellow1~q\ : std_logic;
SIGNAL \main_fsm|sync_proc~11_combout\ : std_logic;
SIGNAL \main_fsm|s_stateChanged~2_combout\ : std_logic;
SIGNAL \main_fsm|s_stateChanged~3_combout\ : std_logic;
SIGNAL \main_fsm|s_stateChanged~4_combout\ : std_logic;
SIGNAL \main_fsm|s_stateChanged~q\ : std_logic;
SIGNAL \timer_fsm|Add1~0_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~1_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~3_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~23_combout\ : std_logic;
SIGNAL \main_fsm|WideOr6~combout\ : std_logic;
SIGNAL \timer_fsm|Add1~8_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~4_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~2\ : std_logic;
SIGNAL \timer_fsm|Add1~5_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~7_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~6\ : std_logic;
SIGNAL \timer_fsm|Add1~9_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~11_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~10\ : std_logic;
SIGNAL \timer_fsm|Add1~12_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~24_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~13\ : std_logic;
SIGNAL \timer_fsm|Add1~14_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~25_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~15\ : std_logic;
SIGNAL \timer_fsm|Add1~16_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~26_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~17\ : std_logic;
SIGNAL \timer_fsm|Add1~18_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~27_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~19\ : std_logic;
SIGNAL \timer_fsm|Add1~20_combout\ : std_logic;
SIGNAL \timer_fsm|Add1~22_combout\ : std_logic;
SIGNAL \timer_fsm|s_cntZero~1_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter[4]~0_combout\ : std_logic;
SIGNAL \timer_fsm|s_cntZero~0_combout\ : std_logic;
SIGNAL \timer_fsm|s_cntZero~2_combout\ : std_logic;
SIGNAL \timer_fsm|s_cntZero~q\ : std_logic;
SIGNAL \main_fsm|Selector5~0_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState~15_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState.TRed1~q\ : std_logic;
SIGNAL \main_fsm|Selector10~0_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState~10_combout\ : std_logic;
SIGNAL \main_fsm|s_currentState.TGreen2~q\ : std_logic;
SIGNAL \LEDR~0_combout\ : std_logic;
SIGNAL \main_fsm|WideOr2~0_combout\ : std_logic;
SIGNAL \main_fsm|WideOr1~0_combout\ : std_logic;
SIGNAL \LEDR~1_combout\ : std_logic;
SIGNAL \timer_fsm|s_counter\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \clk_div_1hz|s_divCounter\ : std_logic_vector(30 DOWNTO 0);
SIGNAL \clk_div_1hz|ALT_INV_clkOut~q\ : std_logic;
SIGNAL \main_fsm|ALT_INV_WideOr2~0_combout\ : std_logic;
SIGNAL \main_fsm|ALT_INV_WideOr1~0_combout\ : std_logic;
SIGNAL \ALT_INV_KEY[0]~input_o\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
ww_SW <= SW;
LEDR <= ww_LEDR;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\clk_div_1hz|ALT_INV_clkOut~q\ <= NOT \clk_div_1hz|clkOut~q\;
\main_fsm|ALT_INV_WideOr2~0_combout\ <= NOT \main_fsm|WideOr2~0_combout\;
\main_fsm|ALT_INV_WideOr1~0_combout\ <= NOT \main_fsm|WideOr1~0_combout\;
\ALT_INV_KEY[0]~input_o\ <= NOT \KEY[0]~input_o\;

\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \main_fsm|s_currentState.TGreen2~q\,
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

\LEDR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDR~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[1]~output_o\);

\LEDR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \main_fsm|ALT_INV_WideOr2~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[2]~output_o\);

\LEDR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[3]~output_o\);

\LEDR[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[4]~output_o\);

\LEDR[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[5]~output_o\);

\LEDR[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[6]~output_o\);

\LEDR[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[7]~output_o\);

\LEDR[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[8]~output_o\);

\LEDR[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[9]~output_o\);

\LEDR[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[10]~output_o\);

\LEDR[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[11]~output_o\);

\LEDR[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[12]~output_o\);

\LEDR[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[13]~output_o\);

\LEDR[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[14]~output_o\);

\LEDR[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \main_fsm|ALT_INV_WideOr1~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[15]~output_o\);

\LEDR[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDR~1_combout\,
	devoe => ww_devoe,
	o => \LEDR[16]~output_o\);

\LEDR[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \main_fsm|s_currentState.TGreen1~q\,
	devoe => ww_devoe,
	o => \LEDR[17]~output_o\);

\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

\clk_div_1hz|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~0_combout\ = \clk_div_1hz|s_divCounter\(0) $ (VCC)
-- \clk_div_1hz|Add0~1\ = CARRY(\clk_div_1hz|s_divCounter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(0),
	datad => VCC,
	combout => \clk_div_1hz|Add0~0_combout\,
	cout => \clk_div_1hz|Add0~1\);

\clk_div_1hz|s_divCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(0));

\clk_div_1hz|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~2_combout\ = (\clk_div_1hz|s_divCounter\(1) & (!\clk_div_1hz|Add0~1\)) # (!\clk_div_1hz|s_divCounter\(1) & ((\clk_div_1hz|Add0~1\) # (GND)))
-- \clk_div_1hz|Add0~3\ = CARRY((!\clk_div_1hz|Add0~1\) # (!\clk_div_1hz|s_divCounter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(1),
	datad => VCC,
	cin => \clk_div_1hz|Add0~1\,
	combout => \clk_div_1hz|Add0~2_combout\,
	cout => \clk_div_1hz|Add0~3\);

\clk_div_1hz|s_divCounter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(1));

\clk_div_1hz|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~4_combout\ = (\clk_div_1hz|s_divCounter\(2) & (\clk_div_1hz|Add0~3\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(2) & (!\clk_div_1hz|Add0~3\ & VCC))
-- \clk_div_1hz|Add0~5\ = CARRY((\clk_div_1hz|s_divCounter\(2) & !\clk_div_1hz|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(2),
	datad => VCC,
	cin => \clk_div_1hz|Add0~3\,
	combout => \clk_div_1hz|Add0~4_combout\,
	cout => \clk_div_1hz|Add0~5\);

\clk_div_1hz|s_divCounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(2));

\clk_div_1hz|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~6_combout\ = (\clk_div_1hz|s_divCounter\(3) & (!\clk_div_1hz|Add0~5\)) # (!\clk_div_1hz|s_divCounter\(3) & ((\clk_div_1hz|Add0~5\) # (GND)))
-- \clk_div_1hz|Add0~7\ = CARRY((!\clk_div_1hz|Add0~5\) # (!\clk_div_1hz|s_divCounter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(3),
	datad => VCC,
	cin => \clk_div_1hz|Add0~5\,
	combout => \clk_div_1hz|Add0~6_combout\,
	cout => \clk_div_1hz|Add0~7\);

\clk_div_1hz|s_divCounter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(3));

\clk_div_1hz|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~8_combout\ = (\clk_div_1hz|s_divCounter\(4) & (\clk_div_1hz|Add0~7\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(4) & (!\clk_div_1hz|Add0~7\ & VCC))
-- \clk_div_1hz|Add0~9\ = CARRY((\clk_div_1hz|s_divCounter\(4) & !\clk_div_1hz|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(4),
	datad => VCC,
	cin => \clk_div_1hz|Add0~7\,
	combout => \clk_div_1hz|Add0~8_combout\,
	cout => \clk_div_1hz|Add0~9\);

\clk_div_1hz|s_divCounter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(4));

\clk_div_1hz|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~10_combout\ = (\clk_div_1hz|s_divCounter\(5) & (!\clk_div_1hz|Add0~9\)) # (!\clk_div_1hz|s_divCounter\(5) & ((\clk_div_1hz|Add0~9\) # (GND)))
-- \clk_div_1hz|Add0~11\ = CARRY((!\clk_div_1hz|Add0~9\) # (!\clk_div_1hz|s_divCounter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(5),
	datad => VCC,
	cin => \clk_div_1hz|Add0~9\,
	combout => \clk_div_1hz|Add0~10_combout\,
	cout => \clk_div_1hz|Add0~11\);

\clk_div_1hz|s_divCounter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(5));

\clk_div_1hz|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~12_combout\ = (\clk_div_1hz|s_divCounter\(6) & (\clk_div_1hz|Add0~11\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(6) & (!\clk_div_1hz|Add0~11\ & VCC))
-- \clk_div_1hz|Add0~13\ = CARRY((\clk_div_1hz|s_divCounter\(6) & !\clk_div_1hz|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(6),
	datad => VCC,
	cin => \clk_div_1hz|Add0~11\,
	combout => \clk_div_1hz|Add0~12_combout\,
	cout => \clk_div_1hz|Add0~13\);

\clk_div_1hz|s_divCounter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(6));

\clk_div_1hz|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~14_combout\ = (\clk_div_1hz|s_divCounter\(7) & (!\clk_div_1hz|Add0~13\)) # (!\clk_div_1hz|s_divCounter\(7) & ((\clk_div_1hz|Add0~13\) # (GND)))
-- \clk_div_1hz|Add0~15\ = CARRY((!\clk_div_1hz|Add0~13\) # (!\clk_div_1hz|s_divCounter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(7),
	datad => VCC,
	cin => \clk_div_1hz|Add0~13\,
	combout => \clk_div_1hz|Add0~14_combout\,
	cout => \clk_div_1hz|Add0~15\);

\clk_div_1hz|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~48_combout\ = (\clk_div_1hz|s_divCounter\(24) & (\clk_div_1hz|Add0~47\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(24) & (!\clk_div_1hz|Add0~47\ & VCC))
-- \clk_div_1hz|Add0~49\ = CARRY((\clk_div_1hz|s_divCounter\(24) & !\clk_div_1hz|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(24),
	datad => VCC,
	cin => \clk_div_1hz|Add0~47\,
	combout => \clk_div_1hz|Add0~48_combout\,
	cout => \clk_div_1hz|Add0~49\);

\clk_div_1hz|Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~50_combout\ = (\clk_div_1hz|s_divCounter\(25) & (!\clk_div_1hz|Add0~49\)) # (!\clk_div_1hz|s_divCounter\(25) & ((\clk_div_1hz|Add0~49\) # (GND)))
-- \clk_div_1hz|Add0~51\ = CARRY((!\clk_div_1hz|Add0~49\) # (!\clk_div_1hz|s_divCounter\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(25),
	datad => VCC,
	cin => \clk_div_1hz|Add0~49\,
	combout => \clk_div_1hz|Add0~50_combout\,
	cout => \clk_div_1hz|Add0~51\);

\clk_div_1hz|s_divCounter~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~0_combout\ = (\clk_div_1hz|Add0~50_combout\ & !\clk_div_1hz|Equal0~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Add0~50_combout\,
	datad => \clk_div_1hz|Equal0~11_combout\,
	combout => \clk_div_1hz|s_divCounter~0_combout\);

\clk_div_1hz|s_divCounter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|s_divCounter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(25));

\clk_div_1hz|Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~52_combout\ = (\clk_div_1hz|s_divCounter\(26) & (\clk_div_1hz|Add0~51\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(26) & (!\clk_div_1hz|Add0~51\ & VCC))
-- \clk_div_1hz|Add0~53\ = CARRY((\clk_div_1hz|s_divCounter\(26) & !\clk_div_1hz|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(26),
	datad => VCC,
	cin => \clk_div_1hz|Add0~51\,
	combout => \clk_div_1hz|Add0~52_combout\,
	cout => \clk_div_1hz|Add0~53\);

\clk_div_1hz|s_divCounter[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|Add0~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(26));

\clk_div_1hz|Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~54_combout\ = (\clk_div_1hz|s_divCounter\(27) & (!\clk_div_1hz|Add0~53\)) # (!\clk_div_1hz|s_divCounter\(27) & ((\clk_div_1hz|Add0~53\) # (GND)))
-- \clk_div_1hz|Add0~55\ = CARRY((!\clk_div_1hz|Add0~53\) # (!\clk_div_1hz|s_divCounter\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(27),
	datad => VCC,
	cin => \clk_div_1hz|Add0~53\,
	combout => \clk_div_1hz|Add0~54_combout\,
	cout => \clk_div_1hz|Add0~55\);

\clk_div_1hz|s_divCounter[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|Add0~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(27));

\clk_div_1hz|Add0~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~56_combout\ = (\clk_div_1hz|s_divCounter\(28) & (\clk_div_1hz|Add0~55\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(28) & (!\clk_div_1hz|Add0~55\ & VCC))
-- \clk_div_1hz|Add0~57\ = CARRY((\clk_div_1hz|s_divCounter\(28) & !\clk_div_1hz|Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(28),
	datad => VCC,
	cin => \clk_div_1hz|Add0~55\,
	combout => \clk_div_1hz|Add0~56_combout\,
	cout => \clk_div_1hz|Add0~57\);

\clk_div_1hz|s_divCounter[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|Add0~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(28));

\clk_div_1hz|Add0~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~58_combout\ = (\clk_div_1hz|s_divCounter\(29) & (!\clk_div_1hz|Add0~57\)) # (!\clk_div_1hz|s_divCounter\(29) & ((\clk_div_1hz|Add0~57\) # (GND)))
-- \clk_div_1hz|Add0~59\ = CARRY((!\clk_div_1hz|Add0~57\) # (!\clk_div_1hz|s_divCounter\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(29),
	datad => VCC,
	cin => \clk_div_1hz|Add0~57\,
	combout => \clk_div_1hz|Add0~58_combout\,
	cout => \clk_div_1hz|Add0~59\);

\clk_div_1hz|s_divCounter[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|Add0~58_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(29));

\clk_div_1hz|Add0~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~60_combout\ = \clk_div_1hz|s_divCounter\(30) $ (!\clk_div_1hz|Add0~59\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(30),
	cin => \clk_div_1hz|Add0~59\,
	combout => \clk_div_1hz|Add0~60_combout\);

\clk_div_1hz|s_divCounter[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|Add0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(30));

\clk_div_1hz|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~0_combout\ = (!\clk_div_1hz|s_divCounter\(30) & (!\clk_div_1hz|s_divCounter\(29) & (!\clk_div_1hz|s_divCounter\(28) & !\clk_div_1hz|s_divCounter\(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(30),
	datab => \clk_div_1hz|s_divCounter\(29),
	datac => \clk_div_1hz|s_divCounter\(28),
	datad => \clk_div_1hz|s_divCounter\(27),
	combout => \clk_div_1hz|Equal0~0_combout\);

\clk_div_1hz|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~1_combout\ = (\clk_div_1hz|s_divCounter\(22) & (\clk_div_1hz|s_divCounter\(21) & (\clk_div_1hz|s_divCounter\(20) & !\clk_div_1hz|s_divCounter\(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(22),
	datab => \clk_div_1hz|s_divCounter\(21),
	datac => \clk_div_1hz|s_divCounter\(20),
	datad => \clk_div_1hz|s_divCounter\(26),
	combout => \clk_div_1hz|Equal0~1_combout\);

\clk_div_1hz|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~2_combout\ = (\clk_div_1hz|s_divCounter\(19) & (\clk_div_1hz|s_divCounter\(14) & (\clk_div_1hz|s_divCounter\(13) & \clk_div_1hz|s_divCounter\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(19),
	datab => \clk_div_1hz|s_divCounter\(14),
	datac => \clk_div_1hz|s_divCounter\(13),
	datad => \clk_div_1hz|s_divCounter\(12),
	combout => \clk_div_1hz|Equal0~2_combout\);

\clk_div_1hz|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~3_combout\ = (!\clk_div_1hz|s_divCounter\(10) & (!\clk_div_1hz|s_divCounter\(9) & (!\clk_div_1hz|s_divCounter\(8) & !\clk_div_1hz|s_divCounter\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(10),
	datab => \clk_div_1hz|s_divCounter\(9),
	datac => \clk_div_1hz|s_divCounter\(8),
	datad => \clk_div_1hz|s_divCounter\(7),
	combout => \clk_div_1hz|Equal0~3_combout\);

\clk_div_1hz|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~4_combout\ = (\clk_div_1hz|Equal0~0_combout\ & (\clk_div_1hz|Equal0~1_combout\ & (\clk_div_1hz|Equal0~2_combout\ & \clk_div_1hz|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Equal0~0_combout\,
	datab => \clk_div_1hz|Equal0~1_combout\,
	datac => \clk_div_1hz|Equal0~2_combout\,
	datad => \clk_div_1hz|Equal0~3_combout\,
	combout => \clk_div_1hz|Equal0~4_combout\);

\clk_div_1hz|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~5_combout\ = (\clk_div_1hz|s_divCounter\(5) & (\clk_div_1hz|s_divCounter\(4) & (\clk_div_1hz|s_divCounter\(3) & \clk_div_1hz|s_divCounter\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(5),
	datab => \clk_div_1hz|s_divCounter\(4),
	datac => \clk_div_1hz|s_divCounter\(3),
	datad => \clk_div_1hz|s_divCounter\(2),
	combout => \clk_div_1hz|Equal0~5_combout\);

\clk_div_1hz|Equal0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~10_combout\ = (\clk_div_1hz|s_divCounter\(1) & \clk_div_1hz|s_divCounter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(1),
	datab => \clk_div_1hz|s_divCounter\(0),
	combout => \clk_div_1hz|Equal0~10_combout\);

\clk_div_1hz|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~7_combout\ = (\clk_div_1hz|s_divCounter\(25) & (\clk_div_1hz|s_divCounter\(23) & (!\clk_div_1hz|s_divCounter\(24) & !\clk_div_1hz|s_divCounter\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(25),
	datab => \clk_div_1hz|s_divCounter\(23),
	datac => \clk_div_1hz|s_divCounter\(24),
	datad => \clk_div_1hz|s_divCounter\(18),
	combout => \clk_div_1hz|Equal0~7_combout\);

\clk_div_1hz|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~8_combout\ = (\clk_div_1hz|s_divCounter\(17) & (\clk_div_1hz|s_divCounter\(15) & (!\clk_div_1hz|s_divCounter\(16) & !\clk_div_1hz|s_divCounter\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(17),
	datab => \clk_div_1hz|s_divCounter\(15),
	datac => \clk_div_1hz|s_divCounter\(16),
	datad => \clk_div_1hz|s_divCounter\(11),
	combout => \clk_div_1hz|Equal0~8_combout\);

\clk_div_1hz|Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~9_combout\ = (\clk_div_1hz|s_divCounter\(6) & (\clk_div_1hz|Equal0~7_combout\ & \clk_div_1hz|Equal0~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(6),
	datab => \clk_div_1hz|Equal0~7_combout\,
	datac => \clk_div_1hz|Equal0~8_combout\,
	combout => \clk_div_1hz|Equal0~9_combout\);

\clk_div_1hz|Equal0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~11_combout\ = (\clk_div_1hz|Equal0~4_combout\ & (\clk_div_1hz|Equal0~5_combout\ & (\clk_div_1hz|Equal0~10_combout\ & \clk_div_1hz|Equal0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Equal0~4_combout\,
	datab => \clk_div_1hz|Equal0~5_combout\,
	datac => \clk_div_1hz|Equal0~10_combout\,
	datad => \clk_div_1hz|Equal0~9_combout\,
	combout => \clk_div_1hz|Equal0~11_combout\);

\clk_div_1hz|s_divCounter~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~11_combout\ = (\clk_div_1hz|Add0~14_combout\ & !\clk_div_1hz|Equal0~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Add0~14_combout\,
	datad => \clk_div_1hz|Equal0~11_combout\,
	combout => \clk_div_1hz|s_divCounter~11_combout\);

\clk_div_1hz|s_divCounter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|s_divCounter~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(7));

\clk_div_1hz|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~16_combout\ = (\clk_div_1hz|s_divCounter\(8) & (\clk_div_1hz|Add0~15\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(8) & (!\clk_div_1hz|Add0~15\ & VCC))
-- \clk_div_1hz|Add0~17\ = CARRY((\clk_div_1hz|s_divCounter\(8) & !\clk_div_1hz|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(8),
	datad => VCC,
	cin => \clk_div_1hz|Add0~15\,
	combout => \clk_div_1hz|Add0~16_combout\,
	cout => \clk_div_1hz|Add0~17\);

\clk_div_1hz|s_divCounter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|Add0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(8));

\clk_div_1hz|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~18_combout\ = (\clk_div_1hz|s_divCounter\(9) & (!\clk_div_1hz|Add0~17\)) # (!\clk_div_1hz|s_divCounter\(9) & ((\clk_div_1hz|Add0~17\) # (GND)))
-- \clk_div_1hz|Add0~19\ = CARRY((!\clk_div_1hz|Add0~17\) # (!\clk_div_1hz|s_divCounter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(9),
	datad => VCC,
	cin => \clk_div_1hz|Add0~17\,
	combout => \clk_div_1hz|Add0~18_combout\,
	cout => \clk_div_1hz|Add0~19\);

\clk_div_1hz|s_divCounter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(9));

\clk_div_1hz|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~20_combout\ = (\clk_div_1hz|s_divCounter\(10) & (\clk_div_1hz|Add0~19\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(10) & (!\clk_div_1hz|Add0~19\ & VCC))
-- \clk_div_1hz|Add0~21\ = CARRY((\clk_div_1hz|s_divCounter\(10) & !\clk_div_1hz|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(10),
	datad => VCC,
	cin => \clk_div_1hz|Add0~19\,
	combout => \clk_div_1hz|Add0~20_combout\,
	cout => \clk_div_1hz|Add0~21\);

\clk_div_1hz|s_divCounter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|Add0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(10));

\clk_div_1hz|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~22_combout\ = (\clk_div_1hz|s_divCounter\(11) & (!\clk_div_1hz|Add0~21\)) # (!\clk_div_1hz|s_divCounter\(11) & ((\clk_div_1hz|Add0~21\) # (GND)))
-- \clk_div_1hz|Add0~23\ = CARRY((!\clk_div_1hz|Add0~21\) # (!\clk_div_1hz|s_divCounter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(11),
	datad => VCC,
	cin => \clk_div_1hz|Add0~21\,
	combout => \clk_div_1hz|Add0~22_combout\,
	cout => \clk_div_1hz|Add0~23\);

\clk_div_1hz|s_divCounter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|Add0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(11));

\clk_div_1hz|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~24_combout\ = (\clk_div_1hz|s_divCounter\(12) & (\clk_div_1hz|Add0~23\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(12) & (!\clk_div_1hz|Add0~23\ & VCC))
-- \clk_div_1hz|Add0~25\ = CARRY((\clk_div_1hz|s_divCounter\(12) & !\clk_div_1hz|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(12),
	datad => VCC,
	cin => \clk_div_1hz|Add0~23\,
	combout => \clk_div_1hz|Add0~24_combout\,
	cout => \clk_div_1hz|Add0~25\);

\clk_div_1hz|s_divCounter~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~10_combout\ = (\clk_div_1hz|Add0~24_combout\ & !\clk_div_1hz|Equal0~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Add0~24_combout\,
	datad => \clk_div_1hz|Equal0~11_combout\,
	combout => \clk_div_1hz|s_divCounter~10_combout\);

\clk_div_1hz|s_divCounter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|s_divCounter~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(12));

\clk_div_1hz|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~26_combout\ = (\clk_div_1hz|s_divCounter\(13) & (!\clk_div_1hz|Add0~25\)) # (!\clk_div_1hz|s_divCounter\(13) & ((\clk_div_1hz|Add0~25\) # (GND)))
-- \clk_div_1hz|Add0~27\ = CARRY((!\clk_div_1hz|Add0~25\) # (!\clk_div_1hz|s_divCounter\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(13),
	datad => VCC,
	cin => \clk_div_1hz|Add0~25\,
	combout => \clk_div_1hz|Add0~26_combout\,
	cout => \clk_div_1hz|Add0~27\);

\clk_div_1hz|s_divCounter~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~9_combout\ = (\clk_div_1hz|Add0~26_combout\ & !\clk_div_1hz|Equal0~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Add0~26_combout\,
	datad => \clk_div_1hz|Equal0~11_combout\,
	combout => \clk_div_1hz|s_divCounter~9_combout\);

\clk_div_1hz|s_divCounter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|s_divCounter~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(13));

\clk_div_1hz|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~28_combout\ = (\clk_div_1hz|s_divCounter\(14) & (\clk_div_1hz|Add0~27\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(14) & (!\clk_div_1hz|Add0~27\ & VCC))
-- \clk_div_1hz|Add0~29\ = CARRY((\clk_div_1hz|s_divCounter\(14) & !\clk_div_1hz|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(14),
	datad => VCC,
	cin => \clk_div_1hz|Add0~27\,
	combout => \clk_div_1hz|Add0~28_combout\,
	cout => \clk_div_1hz|Add0~29\);

\clk_div_1hz|s_divCounter~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~8_combout\ = (\clk_div_1hz|Add0~28_combout\ & !\clk_div_1hz|Equal0~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Add0~28_combout\,
	datad => \clk_div_1hz|Equal0~11_combout\,
	combout => \clk_div_1hz|s_divCounter~8_combout\);

\clk_div_1hz|s_divCounter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|s_divCounter~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(14));

\clk_div_1hz|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~30_combout\ = (\clk_div_1hz|s_divCounter\(15) & (!\clk_div_1hz|Add0~29\)) # (!\clk_div_1hz|s_divCounter\(15) & ((\clk_div_1hz|Add0~29\) # (GND)))
-- \clk_div_1hz|Add0~31\ = CARRY((!\clk_div_1hz|Add0~29\) # (!\clk_div_1hz|s_divCounter\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(15),
	datad => VCC,
	cin => \clk_div_1hz|Add0~29\,
	combout => \clk_div_1hz|Add0~30_combout\,
	cout => \clk_div_1hz|Add0~31\);

\clk_div_1hz|s_divCounter~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~3_combout\ = (\clk_div_1hz|Add0~30_combout\ & !\clk_div_1hz|Equal0~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Add0~30_combout\,
	datad => \clk_div_1hz|Equal0~11_combout\,
	combout => \clk_div_1hz|s_divCounter~3_combout\);

\clk_div_1hz|s_divCounter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|s_divCounter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(15));

\clk_div_1hz|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~32_combout\ = (\clk_div_1hz|s_divCounter\(16) & (\clk_div_1hz|Add0~31\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(16) & (!\clk_div_1hz|Add0~31\ & VCC))
-- \clk_div_1hz|Add0~33\ = CARRY((\clk_div_1hz|s_divCounter\(16) & !\clk_div_1hz|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(16),
	datad => VCC,
	cin => \clk_div_1hz|Add0~31\,
	combout => \clk_div_1hz|Add0~32_combout\,
	cout => \clk_div_1hz|Add0~33\);

\clk_div_1hz|s_divCounter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|Add0~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(16));

\clk_div_1hz|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~34_combout\ = (\clk_div_1hz|s_divCounter\(17) & (!\clk_div_1hz|Add0~33\)) # (!\clk_div_1hz|s_divCounter\(17) & ((\clk_div_1hz|Add0~33\) # (GND)))
-- \clk_div_1hz|Add0~35\ = CARRY((!\clk_div_1hz|Add0~33\) # (!\clk_div_1hz|s_divCounter\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(17),
	datad => VCC,
	cin => \clk_div_1hz|Add0~33\,
	combout => \clk_div_1hz|Add0~34_combout\,
	cout => \clk_div_1hz|Add0~35\);

\clk_div_1hz|s_divCounter~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~2_combout\ = (\clk_div_1hz|Add0~34_combout\ & !\clk_div_1hz|Equal0~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Add0~34_combout\,
	datad => \clk_div_1hz|Equal0~11_combout\,
	combout => \clk_div_1hz|s_divCounter~2_combout\);

\clk_div_1hz|s_divCounter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|s_divCounter~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(17));

\clk_div_1hz|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~36_combout\ = (\clk_div_1hz|s_divCounter\(18) & (\clk_div_1hz|Add0~35\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(18) & (!\clk_div_1hz|Add0~35\ & VCC))
-- \clk_div_1hz|Add0~37\ = CARRY((\clk_div_1hz|s_divCounter\(18) & !\clk_div_1hz|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(18),
	datad => VCC,
	cin => \clk_div_1hz|Add0~35\,
	combout => \clk_div_1hz|Add0~36_combout\,
	cout => \clk_div_1hz|Add0~37\);

\clk_div_1hz|s_divCounter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|Add0~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(18));

\clk_div_1hz|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~38_combout\ = (\clk_div_1hz|s_divCounter\(19) & (!\clk_div_1hz|Add0~37\)) # (!\clk_div_1hz|s_divCounter\(19) & ((\clk_div_1hz|Add0~37\) # (GND)))
-- \clk_div_1hz|Add0~39\ = CARRY((!\clk_div_1hz|Add0~37\) # (!\clk_div_1hz|s_divCounter\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(19),
	datad => VCC,
	cin => \clk_div_1hz|Add0~37\,
	combout => \clk_div_1hz|Add0~38_combout\,
	cout => \clk_div_1hz|Add0~39\);

\clk_div_1hz|s_divCounter~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~7_combout\ = (\clk_div_1hz|Add0~38_combout\ & !\clk_div_1hz|Equal0~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Add0~38_combout\,
	datad => \clk_div_1hz|Equal0~11_combout\,
	combout => \clk_div_1hz|s_divCounter~7_combout\);

\clk_div_1hz|s_divCounter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|s_divCounter~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(19));

\clk_div_1hz|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~40_combout\ = (\clk_div_1hz|s_divCounter\(20) & (\clk_div_1hz|Add0~39\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(20) & (!\clk_div_1hz|Add0~39\ & VCC))
-- \clk_div_1hz|Add0~41\ = CARRY((\clk_div_1hz|s_divCounter\(20) & !\clk_div_1hz|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(20),
	datad => VCC,
	cin => \clk_div_1hz|Add0~39\,
	combout => \clk_div_1hz|Add0~40_combout\,
	cout => \clk_div_1hz|Add0~41\);

\clk_div_1hz|s_divCounter~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~6_combout\ = (\clk_div_1hz|Add0~40_combout\ & !\clk_div_1hz|Equal0~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Add0~40_combout\,
	datad => \clk_div_1hz|Equal0~11_combout\,
	combout => \clk_div_1hz|s_divCounter~6_combout\);

\clk_div_1hz|s_divCounter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|s_divCounter~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(20));

\clk_div_1hz|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~42_combout\ = (\clk_div_1hz|s_divCounter\(21) & (!\clk_div_1hz|Add0~41\)) # (!\clk_div_1hz|s_divCounter\(21) & ((\clk_div_1hz|Add0~41\) # (GND)))
-- \clk_div_1hz|Add0~43\ = CARRY((!\clk_div_1hz|Add0~41\) # (!\clk_div_1hz|s_divCounter\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(21),
	datad => VCC,
	cin => \clk_div_1hz|Add0~41\,
	combout => \clk_div_1hz|Add0~42_combout\,
	cout => \clk_div_1hz|Add0~43\);

\clk_div_1hz|s_divCounter~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~5_combout\ = (\clk_div_1hz|Add0~42_combout\ & !\clk_div_1hz|Equal0~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Add0~42_combout\,
	datad => \clk_div_1hz|Equal0~11_combout\,
	combout => \clk_div_1hz|s_divCounter~5_combout\);

\clk_div_1hz|s_divCounter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|s_divCounter~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(21));

\clk_div_1hz|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~44_combout\ = (\clk_div_1hz|s_divCounter\(22) & (\clk_div_1hz|Add0~43\ $ (GND))) # (!\clk_div_1hz|s_divCounter\(22) & (!\clk_div_1hz|Add0~43\ & VCC))
-- \clk_div_1hz|Add0~45\ = CARRY((\clk_div_1hz|s_divCounter\(22) & !\clk_div_1hz|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(22),
	datad => VCC,
	cin => \clk_div_1hz|Add0~43\,
	combout => \clk_div_1hz|Add0~44_combout\,
	cout => \clk_div_1hz|Add0~45\);

\clk_div_1hz|s_divCounter~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~4_combout\ = (\clk_div_1hz|Add0~44_combout\ & !\clk_div_1hz|Equal0~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Add0~44_combout\,
	datad => \clk_div_1hz|Equal0~11_combout\,
	combout => \clk_div_1hz|s_divCounter~4_combout\);

\clk_div_1hz|s_divCounter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|s_divCounter~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(22));

\clk_div_1hz|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Add0~46_combout\ = (\clk_div_1hz|s_divCounter\(23) & (!\clk_div_1hz|Add0~45\)) # (!\clk_div_1hz|s_divCounter\(23) & ((\clk_div_1hz|Add0~45\) # (GND)))
-- \clk_div_1hz|Add0~47\ = CARRY((!\clk_div_1hz|Add0~45\) # (!\clk_div_1hz|s_divCounter\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(23),
	datad => VCC,
	cin => \clk_div_1hz|Add0~45\,
	combout => \clk_div_1hz|Add0~46_combout\,
	cout => \clk_div_1hz|Add0~47\);

\clk_div_1hz|s_divCounter~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|s_divCounter~1_combout\ = (\clk_div_1hz|Add0~46_combout\ & !\clk_div_1hz|Equal0~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Add0~46_combout\,
	datad => \clk_div_1hz|Equal0~11_combout\,
	combout => \clk_div_1hz|s_divCounter~1_combout\);

\clk_div_1hz|s_divCounter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|s_divCounter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(23));

\clk_div_1hz|s_divCounter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|Add0~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|s_divCounter\(24));

\clk_div_1hz|clkOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|clkOut~0_combout\ = (\clk_div_1hz|s_divCounter\(24) & (\clk_div_1hz|s_divCounter\(18) & (!\clk_div_1hz|s_divCounter\(25) & !\clk_div_1hz|s_divCounter\(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(24),
	datab => \clk_div_1hz|s_divCounter\(18),
	datac => \clk_div_1hz|s_divCounter\(25),
	datad => \clk_div_1hz|s_divCounter\(23),
	combout => \clk_div_1hz|clkOut~0_combout\);

\clk_div_1hz|clkOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|clkOut~1_combout\ = (\clk_div_1hz|s_divCounter\(16) & (\clk_div_1hz|s_divCounter\(11) & (!\clk_div_1hz|s_divCounter\(17) & !\clk_div_1hz|s_divCounter\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|s_divCounter\(16),
	datab => \clk_div_1hz|s_divCounter\(11),
	datac => \clk_div_1hz|s_divCounter\(17),
	datad => \clk_div_1hz|s_divCounter\(15),
	combout => \clk_div_1hz|clkOut~1_combout\);

\clk_div_1hz|clkOut~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|clkOut~2_combout\ = (\clk_div_1hz|clkOut~0_combout\ & (\clk_div_1hz|clkOut~1_combout\ & !\clk_div_1hz|s_divCounter\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|clkOut~0_combout\,
	datab => \clk_div_1hz|clkOut~1_combout\,
	datad => \clk_div_1hz|s_divCounter\(6),
	combout => \clk_div_1hz|clkOut~2_combout\);

\clk_div_1hz|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|Equal0~6_combout\ = (\clk_div_1hz|Equal0~4_combout\ & (\clk_div_1hz|Equal0~5_combout\ & (\clk_div_1hz|s_divCounter\(1) & \clk_div_1hz|s_divCounter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|Equal0~4_combout\,
	datab => \clk_div_1hz|Equal0~5_combout\,
	datac => \clk_div_1hz|s_divCounter\(1),
	datad => \clk_div_1hz|s_divCounter\(0),
	combout => \clk_div_1hz|Equal0~6_combout\);

\clk_div_1hz|clkOut~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_div_1hz|clkOut~3_combout\ = (\clk_div_1hz|Equal0~6_combout\ & (!\clk_div_1hz|Equal0~9_combout\ & ((\clk_div_1hz|clkOut~q\) # (\clk_div_1hz|clkOut~2_combout\)))) # (!\clk_div_1hz|Equal0~6_combout\ & (\clk_div_1hz|clkOut~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|clkOut~q\,
	datab => \clk_div_1hz|clkOut~2_combout\,
	datac => \clk_div_1hz|Equal0~6_combout\,
	datad => \clk_div_1hz|Equal0~9_combout\,
	combout => \clk_div_1hz|clkOut~3_combout\);

\clk_div_1hz|clkOut\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \clk_div_1hz|clkOut~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_div_1hz|clkOut~q\);

\KEY[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

\main_fsm|sync_proc~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|sync_proc~8_combout\ = (\SW[0]~input_o\ & (\main_fsm|s_currentState.TGreen2~q\)) # (!\SW[0]~input_o\ & (\timer_fsm|s_cntZero~q\ & (\main_fsm|s_currentState.TGreen2~q\ $ (\main_fsm|s_currentState.TRed1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.TGreen2~q\,
	datab => \SW[0]~input_o\,
	datac => \timer_fsm|s_cntZero~q\,
	datad => \main_fsm|s_currentState.TRed1~q\,
	combout => \main_fsm|sync_proc~8_combout\);

\main_fsm|s_stateChanged~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_stateChanged~0_combout\ = (\main_fsm|sync_proc~8_combout\) # ((\main_fsm|Selector5~0_combout\ & ((!\main_fsm|s_currentState.TRed1~q\))) # (!\main_fsm|Selector5~0_combout\ & (\timer_fsm|s_cntZero~q\ & \main_fsm|s_currentState.TRed1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|sync_proc~8_combout\,
	datab => \timer_fsm|s_cntZero~q\,
	datac => \main_fsm|Selector5~0_combout\,
	datad => \main_fsm|s_currentState.TRed1~q\,
	combout => \main_fsm|s_stateChanged~0_combout\);

\main_fsm|Selector9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|Selector9~0_combout\ = (\timer_fsm|s_cntZero~q\ & (\main_fsm|s_currentState.TGreen2~q\)) # (!\timer_fsm|s_cntZero~q\ & ((\main_fsm|s_currentState.TYellow2~q\) # ((\main_fsm|s_currentState.TGreen2~q\ & \SW[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.TGreen2~q\,
	datab => \main_fsm|s_currentState.TYellow2~q\,
	datac => \SW[0]~input_o\,
	datad => \timer_fsm|s_cntZero~q\,
	combout => \main_fsm|Selector9~0_combout\);

\main_fsm|s_currentState~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~11_combout\ = (\KEY[0]~input_o\ & \main_fsm|Selector9~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \main_fsm|Selector9~0_combout\,
	combout => \main_fsm|s_currentState~11_combout\);

\main_fsm|s_currentState.TYellow2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_div_1hz|clkOut~q\,
	d => \main_fsm|s_currentState~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_fsm|s_currentState.TYellow2~q\);

\main_fsm|sync_proc~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|sync_proc~9_combout\ = (\timer_fsm|s_cntZero~q\ & ((\main_fsm|s_currentState.TGreen2~q\ $ (\main_fsm|s_currentState.TYellow2~q\)))) # (!\timer_fsm|s_cntZero~q\ & (\SW[0]~input_o\ & (\main_fsm|s_currentState.TGreen2~q\ & 
-- !\main_fsm|s_currentState.TYellow2~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_cntZero~q\,
	datab => \SW[0]~input_o\,
	datac => \main_fsm|s_currentState.TGreen2~q\,
	datad => \main_fsm|s_currentState.TYellow2~q\,
	combout => \main_fsm|sync_proc~9_combout\);

\main_fsm|s_currentState~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~16_combout\ = (\KEY[0]~input_o\ & ((\timer_fsm|s_cntZero~q\ & (\main_fsm|s_currentState.TYellow2~q\)) # (!\timer_fsm|s_cntZero~q\ & ((\main_fsm|s_currentState.TRed2~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \main_fsm|s_currentState.TYellow2~q\,
	datac => \main_fsm|s_currentState.TRed2~q\,
	datad => \timer_fsm|s_cntZero~q\,
	combout => \main_fsm|s_currentState~16_combout\);

\main_fsm|s_currentState.TRed2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_div_1hz|clkOut~q\,
	d => \main_fsm|s_currentState~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_fsm|s_currentState.TRed2~q\);

\main_fsm|Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|Selector4~0_combout\ = (\SW[0]~input_o\ & (\timer_fsm|s_cntZero~q\ & ((\main_fsm|s_currentState.TRed1~q\) # (\main_fsm|s_currentState.TRed2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \timer_fsm|s_cntZero~q\,
	datac => \main_fsm|s_currentState.TRed1~q\,
	datad => \main_fsm|s_currentState.TRed2~q\,
	combout => \main_fsm|Selector4~0_combout\);

\main_fsm|s_currentState~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~12_combout\ = (\KEY[0]~input_o\ & ((\main_fsm|Selector4~0_combout\) # (\main_fsm|Selector4~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \main_fsm|Selector4~0_combout\,
	datac => \main_fsm|Selector4~1_combout\,
	combout => \main_fsm|s_currentState~12_combout\);

\main_fsm|s_currentState.TIntermit\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_div_1hz|clkOut~q\,
	d => \main_fsm|s_currentState~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_fsm|s_currentState.TIntermit~q\);

\main_fsm|s_currentState.TInit\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_div_1hz|clkOut~q\,
	d => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_fsm|s_currentState.TInit~q\);

\main_fsm|Selector4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|Selector4~1_combout\ = ((\main_fsm|s_currentState.TIntermit~q\ & ((\SW[0]~input_o\) # (!\timer_fsm|s_cntZero~q\)))) # (!\main_fsm|s_currentState.TInit~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.TIntermit~q\,
	datab => \SW[0]~input_o\,
	datac => \timer_fsm|s_cntZero~q\,
	datad => \main_fsm|s_currentState.TInit~q\,
	combout => \main_fsm|Selector4~1_combout\);

\main_fsm|s_stateChanged~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_stateChanged~1_combout\ = (\main_fsm|sync_proc~9_combout\) # (\main_fsm|s_currentState.TIntermit~q\ $ (((\main_fsm|Selector4~0_combout\) # (\main_fsm|Selector4~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|sync_proc~9_combout\,
	datab => \main_fsm|Selector4~0_combout\,
	datac => \main_fsm|Selector4~1_combout\,
	datad => \main_fsm|s_currentState.TIntermit~q\,
	combout => \main_fsm|s_stateChanged~1_combout\);

\main_fsm|Selector7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|Selector7~0_combout\ = (!\SW[0]~input_o\ & ((\timer_fsm|s_cntZero~q\ & (\main_fsm|s_currentState.TRed2~q\)) # (!\timer_fsm|s_cntZero~q\ & ((\main_fsm|s_currentState.TGreen1~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.TRed2~q\,
	datab => \main_fsm|s_currentState.TGreen1~q\,
	datac => \timer_fsm|s_cntZero~q\,
	datad => \SW[0]~input_o\,
	combout => \main_fsm|Selector7~0_combout\);

\main_fsm|s_currentState~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~14_combout\ = (\KEY[0]~input_o\ & \main_fsm|Selector7~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \main_fsm|Selector7~0_combout\,
	combout => \main_fsm|s_currentState~14_combout\);

\main_fsm|s_currentState.TGreen1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_div_1hz|clkOut~q\,
	d => \main_fsm|s_currentState~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_fsm|s_currentState.TGreen1~q\);

\main_fsm|sync_proc~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|sync_proc~10_combout\ = (\SW[0]~input_o\ & (\main_fsm|s_currentState.TGreen1~q\)) # (!\SW[0]~input_o\ & (\timer_fsm|s_cntZero~q\ & (\main_fsm|s_currentState.TGreen1~q\ $ (\main_fsm|s_currentState.TRed2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.TGreen1~q\,
	datab => \SW[0]~input_o\,
	datac => \timer_fsm|s_cntZero~q\,
	datad => \main_fsm|s_currentState.TRed2~q\,
	combout => \main_fsm|sync_proc~10_combout\);

\main_fsm|Selector6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|Selector6~0_combout\ = (\timer_fsm|s_cntZero~q\ & (\main_fsm|s_currentState.TGreen1~q\)) # (!\timer_fsm|s_cntZero~q\ & ((\main_fsm|s_currentState.TYellow1~q\) # ((\main_fsm|s_currentState.TGreen1~q\ & \SW[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.TGreen1~q\,
	datab => \main_fsm|s_currentState.TYellow1~q\,
	datac => \SW[0]~input_o\,
	datad => \timer_fsm|s_cntZero~q\,
	combout => \main_fsm|Selector6~0_combout\);

\main_fsm|s_currentState~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~13_combout\ = (\KEY[0]~input_o\ & \main_fsm|Selector6~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \main_fsm|Selector6~0_combout\,
	combout => \main_fsm|s_currentState~13_combout\);

\main_fsm|s_currentState.TYellow1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_div_1hz|clkOut~q\,
	d => \main_fsm|s_currentState~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_fsm|s_currentState.TYellow1~q\);

\main_fsm|sync_proc~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|sync_proc~11_combout\ = (\timer_fsm|s_cntZero~q\ & ((\main_fsm|s_currentState.TGreen1~q\ $ (\main_fsm|s_currentState.TYellow1~q\)))) # (!\timer_fsm|s_cntZero~q\ & (\SW[0]~input_o\ & (\main_fsm|s_currentState.TGreen1~q\ & 
-- !\main_fsm|s_currentState.TYellow1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_cntZero~q\,
	datab => \SW[0]~input_o\,
	datac => \main_fsm|s_currentState.TGreen1~q\,
	datad => \main_fsm|s_currentState.TYellow1~q\,
	combout => \main_fsm|sync_proc~11_combout\);

\main_fsm|s_stateChanged~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_stateChanged~2_combout\ = ((\timer_fsm|s_cntZero~q\ & (\main_fsm|s_currentState.TYellow2~q\ $ (\main_fsm|s_currentState.TRed2~q\)))) # (!\KEY[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_cntZero~q\,
	datab => \main_fsm|s_currentState.TYellow2~q\,
	datac => \main_fsm|s_currentState.TRed2~q\,
	datad => \KEY[0]~input_o\,
	combout => \main_fsm|s_stateChanged~2_combout\);

\main_fsm|s_stateChanged~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_stateChanged~3_combout\ = (\main_fsm|sync_proc~10_combout\) # ((\main_fsm|sync_proc~11_combout\) # ((\main_fsm|s_stateChanged~2_combout\) # (!\main_fsm|s_currentState.TInit~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|sync_proc~10_combout\,
	datab => \main_fsm|sync_proc~11_combout\,
	datac => \main_fsm|s_stateChanged~2_combout\,
	datad => \main_fsm|s_currentState.TInit~q\,
	combout => \main_fsm|s_stateChanged~3_combout\);

\main_fsm|s_stateChanged~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_stateChanged~4_combout\ = (!\main_fsm|s_stateChanged~0_combout\ & (!\main_fsm|s_stateChanged~1_combout\ & !\main_fsm|s_stateChanged~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_stateChanged~0_combout\,
	datab => \main_fsm|s_stateChanged~1_combout\,
	datac => \main_fsm|s_stateChanged~3_combout\,
	combout => \main_fsm|s_stateChanged~4_combout\);

\main_fsm|s_stateChanged\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_div_1hz|clkOut~q\,
	d => \main_fsm|s_stateChanged~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_fsm|s_stateChanged~q\);

\timer_fsm|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~0_combout\ = (!\main_fsm|s_currentState.TYellow2~q\ & (!\main_fsm|s_currentState.TYellow1~q\ & !\main_fsm|s_stateChanged~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \main_fsm|s_currentState.TYellow2~q\,
	datac => \main_fsm|s_currentState.TYellow1~q\,
	datad => \main_fsm|s_stateChanged~q\,
	combout => \timer_fsm|Add1~0_combout\);

\timer_fsm|Add1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~1_combout\ = \timer_fsm|s_counter\(0) $ (GND)
-- \timer_fsm|Add1~2\ = CARRY(!\timer_fsm|s_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(0),
	datad => VCC,
	combout => \timer_fsm|Add1~1_combout\,
	cout => \timer_fsm|Add1~2\);

\timer_fsm|Add1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~3_combout\ = (!\timer_fsm|Add1~0_combout\ & (\KEY[0]~input_o\ & ((!\timer_fsm|Add1~1_combout\) # (!\main_fsm|s_stateChanged~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|Add1~0_combout\,
	datab => \main_fsm|s_stateChanged~q\,
	datac => \timer_fsm|Add1~1_combout\,
	datad => \KEY[0]~input_o\,
	combout => \timer_fsm|Add1~3_combout\);

\timer_fsm|Add1~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~23_combout\ = (!\main_fsm|s_stateChanged~q\ & ((\main_fsm|s_currentState.TGreen2~q\) # (\main_fsm|s_currentState.TGreen1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.TGreen2~q\,
	datab => \main_fsm|s_currentState.TGreen1~q\,
	datad => \main_fsm|s_stateChanged~q\,
	combout => \timer_fsm|Add1~23_combout\);

\main_fsm|WideOr6\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|WideOr6~combout\ = (\main_fsm|s_currentState.TGreen2~q\) # ((\main_fsm|s_currentState.TRed1~q\) # (\main_fsm|s_currentState.TRed2~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.TGreen2~q\,
	datab => \main_fsm|s_currentState.TRed1~q\,
	datac => \main_fsm|s_currentState.TRed2~q\,
	combout => \main_fsm|WideOr6~combout\);

\timer_fsm|Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~8_combout\ = (!\main_fsm|s_currentState.TYellow2~q\ & (!\main_fsm|s_currentState.TYellow1~q\ & (!\main_fsm|s_stateChanged~q\ & !\main_fsm|WideOr6~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.TYellow2~q\,
	datab => \main_fsm|s_currentState.TYellow1~q\,
	datac => \main_fsm|s_stateChanged~q\,
	datad => \main_fsm|WideOr6~combout\,
	combout => \timer_fsm|Add1~8_combout\);

\timer_fsm|Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~4_combout\ = (!\main_fsm|s_stateChanged~q\ & (\main_fsm|WideOr6~combout\ $ (((\main_fsm|s_currentState.TYellow2~q\) # (\main_fsm|s_currentState.TYellow1~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.TYellow2~q\,
	datab => \main_fsm|s_currentState.TYellow1~q\,
	datac => \main_fsm|WideOr6~combout\,
	datad => \main_fsm|s_stateChanged~q\,
	combout => \timer_fsm|Add1~4_combout\);

\timer_fsm|Add1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~5_combout\ = (\timer_fsm|s_counter\(1) & (!\timer_fsm|Add1~2\)) # (!\timer_fsm|s_counter\(1) & (\timer_fsm|Add1~2\ & VCC))
-- \timer_fsm|Add1~6\ = CARRY((\timer_fsm|s_counter\(1) & !\timer_fsm|Add1~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(1),
	datad => VCC,
	cin => \timer_fsm|Add1~2\,
	combout => \timer_fsm|Add1~5_combout\,
	cout => \timer_fsm|Add1~6\);

\timer_fsm|Add1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~7_combout\ = (!\timer_fsm|Add1~4_combout\ & (\KEY[0]~input_o\ & ((!\timer_fsm|Add1~5_combout\) # (!\main_fsm|s_stateChanged~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|Add1~4_combout\,
	datab => \main_fsm|s_stateChanged~q\,
	datac => \timer_fsm|Add1~5_combout\,
	datad => \KEY[0]~input_o\,
	combout => \timer_fsm|Add1~7_combout\);

\timer_fsm|s_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_div_1hz|ALT_INV_clkOut~q\,
	d => \timer_fsm|Add1~7_combout\,
	ena => \timer_fsm|s_counter[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(1));

\timer_fsm|Add1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~9_combout\ = (\timer_fsm|s_counter\(2) & (\timer_fsm|Add1~6\ $ (GND))) # (!\timer_fsm|s_counter\(2) & ((GND) # (!\timer_fsm|Add1~6\)))
-- \timer_fsm|Add1~10\ = CARRY((!\timer_fsm|Add1~6\) # (!\timer_fsm|s_counter\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(2),
	datad => VCC,
	cin => \timer_fsm|Add1~6\,
	combout => \timer_fsm|Add1~9_combout\,
	cout => \timer_fsm|Add1~10\);

\timer_fsm|Add1~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~11_combout\ = (!\timer_fsm|Add1~8_combout\ & (\KEY[0]~input_o\ & ((!\timer_fsm|Add1~9_combout\) # (!\main_fsm|s_stateChanged~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|Add1~8_combout\,
	datab => \main_fsm|s_stateChanged~q\,
	datac => \timer_fsm|Add1~9_combout\,
	datad => \KEY[0]~input_o\,
	combout => \timer_fsm|Add1~11_combout\);

\timer_fsm|s_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_div_1hz|ALT_INV_clkOut~q\,
	d => \timer_fsm|Add1~11_combout\,
	ena => \timer_fsm|s_counter[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(2));

\timer_fsm|Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~12_combout\ = (\timer_fsm|s_counter\(3) & (!\timer_fsm|Add1~10\)) # (!\timer_fsm|s_counter\(3) & (\timer_fsm|Add1~10\ & VCC))
-- \timer_fsm|Add1~13\ = CARRY((\timer_fsm|s_counter\(3) & !\timer_fsm|Add1~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(3),
	datad => VCC,
	cin => \timer_fsm|Add1~10\,
	combout => \timer_fsm|Add1~12_combout\,
	cout => \timer_fsm|Add1~13\);

\timer_fsm|Add1~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~24_combout\ = (!\timer_fsm|Add1~23_combout\ & (\KEY[0]~input_o\ & ((!\timer_fsm|Add1~12_combout\) # (!\main_fsm|s_stateChanged~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|Add1~23_combout\,
	datab => \main_fsm|s_stateChanged~q\,
	datac => \timer_fsm|Add1~12_combout\,
	datad => \KEY[0]~input_o\,
	combout => \timer_fsm|Add1~24_combout\);

\timer_fsm|s_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_div_1hz|ALT_INV_clkOut~q\,
	d => \timer_fsm|Add1~24_combout\,
	ena => \timer_fsm|s_counter[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(3));

\timer_fsm|Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~14_combout\ = (\timer_fsm|s_counter\(4) & (\timer_fsm|Add1~13\ $ (GND))) # (!\timer_fsm|s_counter\(4) & ((GND) # (!\timer_fsm|Add1~13\)))
-- \timer_fsm|Add1~15\ = CARRY((!\timer_fsm|Add1~13\) # (!\timer_fsm|s_counter\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(4),
	datad => VCC,
	cin => \timer_fsm|Add1~13\,
	combout => \timer_fsm|Add1~14_combout\,
	cout => \timer_fsm|Add1~15\);

\timer_fsm|Add1~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~25_combout\ = (\KEY[0]~input_o\ & ((!\timer_fsm|Add1~14_combout\) # (!\main_fsm|s_stateChanged~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_stateChanged~q\,
	datab => \timer_fsm|Add1~14_combout\,
	datad => \KEY[0]~input_o\,
	combout => \timer_fsm|Add1~25_combout\);

\timer_fsm|s_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_div_1hz|ALT_INV_clkOut~q\,
	d => \timer_fsm|Add1~25_combout\,
	ena => \timer_fsm|s_counter[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(4));

\timer_fsm|Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~16_combout\ = (\timer_fsm|s_counter\(5) & (!\timer_fsm|Add1~15\)) # (!\timer_fsm|s_counter\(5) & (\timer_fsm|Add1~15\ & VCC))
-- \timer_fsm|Add1~17\ = CARRY((\timer_fsm|s_counter\(5) & !\timer_fsm|Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(5),
	datad => VCC,
	cin => \timer_fsm|Add1~15\,
	combout => \timer_fsm|Add1~16_combout\,
	cout => \timer_fsm|Add1~17\);

\timer_fsm|Add1~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~26_combout\ = (\KEY[0]~input_o\ & ((!\timer_fsm|Add1~16_combout\) # (!\main_fsm|s_stateChanged~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_stateChanged~q\,
	datab => \timer_fsm|Add1~16_combout\,
	datad => \KEY[0]~input_o\,
	combout => \timer_fsm|Add1~26_combout\);

\timer_fsm|s_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_div_1hz|ALT_INV_clkOut~q\,
	d => \timer_fsm|Add1~26_combout\,
	ena => \timer_fsm|s_counter[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(5));

\timer_fsm|Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~18_combout\ = (\timer_fsm|s_counter\(6) & (\timer_fsm|Add1~17\ $ (GND))) # (!\timer_fsm|s_counter\(6) & ((GND) # (!\timer_fsm|Add1~17\)))
-- \timer_fsm|Add1~19\ = CARRY((!\timer_fsm|Add1~17\) # (!\timer_fsm|s_counter\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(6),
	datad => VCC,
	cin => \timer_fsm|Add1~17\,
	combout => \timer_fsm|Add1~18_combout\,
	cout => \timer_fsm|Add1~19\);

\timer_fsm|Add1~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~27_combout\ = (\KEY[0]~input_o\ & ((!\timer_fsm|Add1~18_combout\) # (!\main_fsm|s_stateChanged~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_stateChanged~q\,
	datab => \timer_fsm|Add1~18_combout\,
	datad => \KEY[0]~input_o\,
	combout => \timer_fsm|Add1~27_combout\);

\timer_fsm|s_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_div_1hz|ALT_INV_clkOut~q\,
	d => \timer_fsm|Add1~27_combout\,
	ena => \timer_fsm|s_counter[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(6));

\timer_fsm|Add1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~20_combout\ = \timer_fsm|s_counter\(7) $ (\timer_fsm|Add1~19\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(7),
	cin => \timer_fsm|Add1~19\,
	combout => \timer_fsm|Add1~20_combout\);

\timer_fsm|Add1~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|Add1~22_combout\ = (\KEY[0]~input_o\ & ((!\timer_fsm|Add1~20_combout\) # (!\main_fsm|s_stateChanged~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_stateChanged~q\,
	datab => \timer_fsm|Add1~20_combout\,
	datad => \KEY[0]~input_o\,
	combout => \timer_fsm|Add1~22_combout\);

\timer_fsm|s_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_div_1hz|ALT_INV_clkOut~q\,
	d => \timer_fsm|Add1~22_combout\,
	ena => \timer_fsm|s_counter[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(7));

\timer_fsm|s_cntZero~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_cntZero~1_combout\ = (\timer_fsm|s_counter\(3) & (\timer_fsm|s_counter\(4) & (\timer_fsm|s_counter\(5) & \timer_fsm|s_counter\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_counter\(3),
	datab => \timer_fsm|s_counter\(4),
	datac => \timer_fsm|s_counter\(5),
	datad => \timer_fsm|s_counter\(6),
	combout => \timer_fsm|s_cntZero~1_combout\);

\timer_fsm|s_counter[4]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_counter[4]~0_combout\ = (((!\timer_fsm|s_cntZero~1_combout\) # (!\timer_fsm|s_counter\(7))) # (!\timer_fsm|s_cntZero~0_combout\)) # (!\KEY[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \timer_fsm|s_cntZero~0_combout\,
	datac => \timer_fsm|s_counter\(7),
	datad => \timer_fsm|s_cntZero~1_combout\,
	combout => \timer_fsm|s_counter[4]~0_combout\);

\timer_fsm|s_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_div_1hz|ALT_INV_clkOut~q\,
	d => \timer_fsm|Add1~3_combout\,
	ena => \timer_fsm|s_counter[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_counter\(0));

\timer_fsm|s_cntZero~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_cntZero~0_combout\ = (\main_fsm|s_stateChanged~q\ & (\timer_fsm|s_counter\(0) & (\timer_fsm|s_counter\(1) & \timer_fsm|s_counter\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_stateChanged~q\,
	datab => \timer_fsm|s_counter\(0),
	datac => \timer_fsm|s_counter\(1),
	datad => \timer_fsm|s_counter\(2),
	combout => \timer_fsm|s_cntZero~0_combout\);

\timer_fsm|s_cntZero~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer_fsm|s_cntZero~2_combout\ = (\timer_fsm|s_cntZero~0_combout\ & (\timer_fsm|s_counter\(7) & \timer_fsm|s_cntZero~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_cntZero~0_combout\,
	datab => \timer_fsm|s_counter\(7),
	datac => \timer_fsm|s_cntZero~1_combout\,
	combout => \timer_fsm|s_cntZero~2_combout\);

\timer_fsm|s_cntZero\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_div_1hz|ALT_INV_clkOut~q\,
	d => \timer_fsm|s_cntZero~2_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_fsm|s_cntZero~q\);

\main_fsm|Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|Selector5~0_combout\ = (\timer_fsm|s_cntZero~q\ & ((\main_fsm|s_currentState.TYellow1~q\) # ((\main_fsm|s_currentState.TIntermit~q\ & !\SW[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer_fsm|s_cntZero~q\,
	datab => \main_fsm|s_currentState.TYellow1~q\,
	datac => \main_fsm|s_currentState.TIntermit~q\,
	datad => \SW[0]~input_o\,
	combout => \main_fsm|Selector5~0_combout\);

\main_fsm|s_currentState~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~15_combout\ = (\KEY[0]~input_o\ & ((\main_fsm|Selector5~0_combout\) # ((\main_fsm|s_currentState.TRed1~q\ & !\timer_fsm|s_cntZero~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \main_fsm|Selector5~0_combout\,
	datac => \main_fsm|s_currentState.TRed1~q\,
	datad => \timer_fsm|s_cntZero~q\,
	combout => \main_fsm|s_currentState~15_combout\);

\main_fsm|s_currentState.TRed1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_div_1hz|clkOut~q\,
	d => \main_fsm|s_currentState~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_fsm|s_currentState.TRed1~q\);

\main_fsm|Selector10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|Selector10~0_combout\ = (!\SW[0]~input_o\ & ((\timer_fsm|s_cntZero~q\ & (\main_fsm|s_currentState.TRed1~q\)) # (!\timer_fsm|s_cntZero~q\ & ((\main_fsm|s_currentState.TGreen2~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.TRed1~q\,
	datab => \main_fsm|s_currentState.TGreen2~q\,
	datac => \timer_fsm|s_cntZero~q\,
	datad => \SW[0]~input_o\,
	combout => \main_fsm|Selector10~0_combout\);

\main_fsm|s_currentState~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|s_currentState~10_combout\ = (\KEY[0]~input_o\ & \main_fsm|Selector10~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \main_fsm|Selector10~0_combout\,
	combout => \main_fsm|s_currentState~10_combout\);

\main_fsm|s_currentState.TGreen2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_div_1hz|clkOut~q\,
	d => \main_fsm|s_currentState~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_fsm|s_currentState.TGreen2~q\);

\LEDR~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LEDR~0_combout\ = (\main_fsm|s_currentState.TIntermit~q\ & (\clk_div_1hz|clkOut~q\)) # (!\main_fsm|s_currentState.TIntermit~q\ & ((\main_fsm|s_currentState.TYellow2~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|clkOut~q\,
	datab => \main_fsm|s_currentState.TYellow2~q\,
	datad => \main_fsm|s_currentState.TIntermit~q\,
	combout => \LEDR~0_combout\);

\main_fsm|WideOr2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|WideOr2~0_combout\ = (\main_fsm|s_currentState.TGreen2~q\) # ((\main_fsm|s_currentState.TIntermit~q\) # ((\main_fsm|s_currentState.TYellow2~q\) # (!\main_fsm|s_currentState.TInit~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.TGreen2~q\,
	datab => \main_fsm|s_currentState.TIntermit~q\,
	datac => \main_fsm|s_currentState.TYellow2~q\,
	datad => \main_fsm|s_currentState.TInit~q\,
	combout => \main_fsm|WideOr2~0_combout\);

\main_fsm|WideOr1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \main_fsm|WideOr1~0_combout\ = (\main_fsm|s_currentState.TIntermit~q\) # ((\main_fsm|s_currentState.TYellow1~q\) # ((\main_fsm|s_currentState.TGreen1~q\) # (!\main_fsm|s_currentState.TInit~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \main_fsm|s_currentState.TIntermit~q\,
	datab => \main_fsm|s_currentState.TYellow1~q\,
	datac => \main_fsm|s_currentState.TGreen1~q\,
	datad => \main_fsm|s_currentState.TInit~q\,
	combout => \main_fsm|WideOr1~0_combout\);

\LEDR~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LEDR~1_combout\ = (\main_fsm|s_currentState.TIntermit~q\ & (\clk_div_1hz|clkOut~q\)) # (!\main_fsm|s_currentState.TIntermit~q\ & ((\main_fsm|s_currentState.TYellow1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_div_1hz|clkOut~q\,
	datab => \main_fsm|s_currentState.TYellow1~q\,
	datad => \main_fsm|s_currentState.TIntermit~q\,
	combout => \LEDR~1_combout\);

ww_LEDR(0) <= \LEDR[0]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(3) <= \LEDR[3]~output_o\;

ww_LEDR(4) <= \LEDR[4]~output_o\;

ww_LEDR(5) <= \LEDR[5]~output_o\;

ww_LEDR(6) <= \LEDR[6]~output_o\;

ww_LEDR(7) <= \LEDR[7]~output_o\;

ww_LEDR(8) <= \LEDR[8]~output_o\;

ww_LEDR(9) <= \LEDR[9]~output_o\;

ww_LEDR(10) <= \LEDR[10]~output_o\;

ww_LEDR(11) <= \LEDR[11]~output_o\;

ww_LEDR(12) <= \LEDR[12]~output_o\;

ww_LEDR(13) <= \LEDR[13]~output_o\;

ww_LEDR(14) <= \LEDR[14]~output_o\;

ww_LEDR(15) <= \LEDR[15]~output_o\;

ww_LEDR(16) <= \LEDR[16]~output_o\;

ww_LEDR(17) <= \LEDR[17]~output_o\;
END structure;


