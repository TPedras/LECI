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

-- DATE "06/03/2025 06:12:51"

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

ENTITY 	semaforos_top IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(0 DOWNTO 0);
	SW : IN std_logic_vector(0 DOWNTO 0);
	LEDR : OUT std_logic_vector(12 DOWNTO 0);
	HEX0 : OUT std_logic_vector(6 DOWNTO 0);
	HEX1 : OUT std_logic_vector(6 DOWNTO 0);
	HEX2 : OUT std_logic_vector(6 DOWNTO 0);
	HEX3 : OUT std_logic_vector(6 DOWNTO 0);
	HEX4 : OUT std_logic_vector(6 DOWNTO 0);
	HEX5 : OUT std_logic_vector(6 DOWNTO 0)
	);
END semaforos_top;

ARCHITECTURE structure OF semaforos_top IS
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
SIGNAL ww_LEDR : std_logic_vector(12 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX5 : std_logic_vector(6 DOWNTO 0);
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
SIGNAL \HEX0[0]~output_o\ : std_logic;
SIGNAL \HEX0[1]~output_o\ : std_logic;
SIGNAL \HEX0[2]~output_o\ : std_logic;
SIGNAL \HEX0[3]~output_o\ : std_logic;
SIGNAL \HEX0[4]~output_o\ : std_logic;
SIGNAL \HEX0[5]~output_o\ : std_logic;
SIGNAL \HEX0[6]~output_o\ : std_logic;
SIGNAL \HEX1[0]~output_o\ : std_logic;
SIGNAL \HEX1[1]~output_o\ : std_logic;
SIGNAL \HEX1[2]~output_o\ : std_logic;
SIGNAL \HEX1[3]~output_o\ : std_logic;
SIGNAL \HEX1[4]~output_o\ : std_logic;
SIGNAL \HEX1[5]~output_o\ : std_logic;
SIGNAL \HEX1[6]~output_o\ : std_logic;
SIGNAL \HEX2[0]~output_o\ : std_logic;
SIGNAL \HEX2[1]~output_o\ : std_logic;
SIGNAL \HEX2[2]~output_o\ : std_logic;
SIGNAL \HEX2[3]~output_o\ : std_logic;
SIGNAL \HEX2[4]~output_o\ : std_logic;
SIGNAL \HEX2[5]~output_o\ : std_logic;
SIGNAL \HEX2[6]~output_o\ : std_logic;
SIGNAL \HEX3[0]~output_o\ : std_logic;
SIGNAL \HEX3[1]~output_o\ : std_logic;
SIGNAL \HEX3[2]~output_o\ : std_logic;
SIGNAL \HEX3[3]~output_o\ : std_logic;
SIGNAL \HEX3[4]~output_o\ : std_logic;
SIGNAL \HEX3[5]~output_o\ : std_logic;
SIGNAL \HEX3[6]~output_o\ : std_logic;
SIGNAL \HEX4[0]~output_o\ : std_logic;
SIGNAL \HEX4[1]~output_o\ : std_logic;
SIGNAL \HEX4[2]~output_o\ : std_logic;
SIGNAL \HEX4[3]~output_o\ : std_logic;
SIGNAL \HEX4[4]~output_o\ : std_logic;
SIGNAL \HEX4[5]~output_o\ : std_logic;
SIGNAL \HEX4[6]~output_o\ : std_logic;
SIGNAL \HEX5[0]~output_o\ : std_logic;
SIGNAL \HEX5[1]~output_o\ : std_logic;
SIGNAL \HEX5[2]~output_o\ : std_logic;
SIGNAL \HEX5[3]~output_o\ : std_logic;
SIGNAL \HEX5[4]~output_o\ : std_logic;
SIGNAL \HEX5[5]~output_o\ : std_logic;
SIGNAL \HEX5[6]~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \TrafficFSM|state~10_combout\ : std_logic;
SIGNAL \TrafficFSM|timer~7_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~0_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~1\ : std_logic;
SIGNAL \FreqDiv|Add0~2_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~3\ : std_logic;
SIGNAL \FreqDiv|Add0~4_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~5\ : std_logic;
SIGNAL \FreqDiv|Add0~6_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~7\ : std_logic;
SIGNAL \FreqDiv|Add0~8_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~9\ : std_logic;
SIGNAL \FreqDiv|Add0~10_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~11\ : std_logic;
SIGNAL \FreqDiv|Add0~12_combout\ : std_logic;
SIGNAL \FreqDiv|cnt1~4_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~13\ : std_logic;
SIGNAL \FreqDiv|Add0~14_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~15\ : std_logic;
SIGNAL \FreqDiv|Add0~16_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~17\ : std_logic;
SIGNAL \FreqDiv|Add0~18_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~19\ : std_logic;
SIGNAL \FreqDiv|Add0~20_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~21\ : std_logic;
SIGNAL \FreqDiv|Add0~22_combout\ : std_logic;
SIGNAL \FreqDiv|cnt1~3_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~23\ : std_logic;
SIGNAL \FreqDiv|Add0~24_combout\ : std_logic;
SIGNAL \FreqDiv|cnt1~2_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~25\ : std_logic;
SIGNAL \FreqDiv|Add0~26_combout\ : std_logic;
SIGNAL \FreqDiv|cnt1~1_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~27\ : std_logic;
SIGNAL \FreqDiv|Add0~28_combout\ : std_logic;
SIGNAL \FreqDiv|cnt1~0_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~29\ : std_logic;
SIGNAL \FreqDiv|Add0~30_combout\ : std_logic;
SIGNAL \FreqDiv|Equal0~0_combout\ : std_logic;
SIGNAL \FreqDiv|Equal0~1_combout\ : std_logic;
SIGNAL \FreqDiv|Equal0~2_combout\ : std_logic;
SIGNAL \FreqDiv|Equal0~3_combout\ : std_logic;
SIGNAL \FreqDiv|Equal0~4_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~31\ : std_logic;
SIGNAL \FreqDiv|Add0~32_combout\ : std_logic;
SIGNAL \FreqDiv|cnt1~5_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~33\ : std_logic;
SIGNAL \FreqDiv|Add0~34_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~35\ : std_logic;
SIGNAL \FreqDiv|Add0~36_combout\ : std_logic;
SIGNAL \FreqDiv|cnt1~6_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~37\ : std_logic;
SIGNAL \FreqDiv|Add0~38_combout\ : std_logic;
SIGNAL \FreqDiv|cnt1~7_combout\ : std_logic;
SIGNAL \FreqDiv|Equal0~5_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~39\ : std_logic;
SIGNAL \FreqDiv|Add0~40_combout\ : std_logic;
SIGNAL \FreqDiv|cnt1~8_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~41\ : std_logic;
SIGNAL \FreqDiv|Add0~42_combout\ : std_logic;
SIGNAL \FreqDiv|cnt1~9_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~43\ : std_logic;
SIGNAL \FreqDiv|Add0~44_combout\ : std_logic;
SIGNAL \FreqDiv|cnt1~10_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~45\ : std_logic;
SIGNAL \FreqDiv|Add0~46_combout\ : std_logic;
SIGNAL \FreqDiv|Equal0~6_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~47\ : std_logic;
SIGNAL \FreqDiv|Add0~48_combout\ : std_logic;
SIGNAL \FreqDiv|cnt1~11_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~49\ : std_logic;
SIGNAL \FreqDiv|Add0~50_combout\ : std_logic;
SIGNAL \FreqDiv|Equal0~7_combout\ : std_logic;
SIGNAL \FreqDiv|Equal0~8_combout\ : std_logic;
SIGNAL \FreqDiv|s_en~q\ : std_logic;
SIGNAL \TrafficFSM|timer[3]~2_combout\ : std_logic;
SIGNAL \TrafficFSM|timer~5_combout\ : std_logic;
SIGNAL \TrafficFSM|timer~6_combout\ : std_logic;
SIGNAL \TrafficFSM|timer~3_combout\ : std_logic;
SIGNAL \TrafficFSM|timer~4_combout\ : std_logic;
SIGNAL \TrafficFSM|timer~0_combout\ : std_logic;
SIGNAL \TrafficFSM|timer~1_combout\ : std_logic;
SIGNAL \TrafficFSM|Equal0~0_combout\ : std_logic;
SIGNAL \TrafficFSM|state~9_combout\ : std_logic;
SIGNAL \TrafficFSM|state.S1_S2_GREEN~q\ : std_logic;
SIGNAL \TrafficFSM|state~8_combout\ : std_logic;
SIGNAL \TrafficFSM|state.S1_S2_YELLOW~q\ : std_logic;
SIGNAL \TrafficFSM|state~12_combout\ : std_logic;
SIGNAL \TrafficFSM|state.S3_GREEN~q\ : std_logic;
SIGNAL \TrafficFSM|state~11_combout\ : std_logic;
SIGNAL \TrafficFSM|state.S3_YELLOW~q\ : std_logic;
SIGNAL \TrafficFSM|s_intermitente~0_combout\ : std_logic;
SIGNAL \TrafficFSM|s_intermitente~1_combout\ : std_logic;
SIGNAL \TrafficFSM|s_intermitente~q\ : std_logic;
SIGNAL \TrafficFSM|S1[0]~0_combout\ : std_logic;
SIGNAL \FreqDiv|s_clk1hz~0_combout\ : std_logic;
SIGNAL \FreqDiv|s_clk1hz~q\ : std_logic;
SIGNAL \TrafficFSM|S1[1]~1_combout\ : std_logic;
SIGNAL \TrafficFSM|S1[2]~2_combout\ : std_logic;
SIGNAL \TrafficFSM|S3[0]~0_combout\ : std_logic;
SIGNAL \TrafficFSM|S3[1]~1_combout\ : std_logic;
SIGNAL \TrafficFSM|S3[2]~2_combout\ : std_logic;
SIGNAL \FreqDiv|cnt1\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \TrafficFSM|timer\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \TrafficFSM|ALT_INV_S1[0]~0_combout\ : std_logic;
SIGNAL \TrafficFSM|ALT_INV_S1[2]~2_combout\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
ww_SW <= SW;
LEDR <= ww_LEDR;
HEX0 <= ww_HEX0;
HEX1 <= ww_HEX1;
HEX2 <= ww_HEX2;
HEX3 <= ww_HEX3;
HEX4 <= ww_HEX4;
HEX5 <= ww_HEX5;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\TrafficFSM|ALT_INV_S1[0]~0_combout\ <= NOT \TrafficFSM|S1[0]~0_combout\;
\TrafficFSM|ALT_INV_S1[2]~2_combout\ <= NOT \TrafficFSM|S1[2]~2_combout\;

\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TrafficFSM|ALT_INV_S1[0]~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

\LEDR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TrafficFSM|S1[1]~1_combout\,
	devoe => ww_devoe,
	o => \LEDR[1]~output_o\);

\LEDR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TrafficFSM|ALT_INV_S1[2]~2_combout\,
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
	i => \TrafficFSM|ALT_INV_S1[0]~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[5]~output_o\);

\LEDR[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TrafficFSM|S1[1]~1_combout\,
	devoe => ww_devoe,
	o => \LEDR[6]~output_o\);

\LEDR[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TrafficFSM|ALT_INV_S1[2]~2_combout\,
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
	i => \TrafficFSM|S3[0]~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[10]~output_o\);

\LEDR[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TrafficFSM|S3[1]~1_combout\,
	devoe => ww_devoe,
	o => \LEDR[11]~output_o\);

\LEDR[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TrafficFSM|S3[2]~2_combout\,
	devoe => ww_devoe,
	o => \LEDR[12]~output_o\);

\HEX0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX0[0]~output_o\);

\HEX0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX0[1]~output_o\);

\HEX0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX0[2]~output_o\);

\HEX0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX0[3]~output_o\);

\HEX0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX0[4]~output_o\);

\HEX0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX0[5]~output_o\);

\HEX0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX0[6]~output_o\);

\HEX1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX1[0]~output_o\);

\HEX1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX1[1]~output_o\);

\HEX1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX1[2]~output_o\);

\HEX1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX1[3]~output_o\);

\HEX1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX1[4]~output_o\);

\HEX1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX1[5]~output_o\);

\HEX1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX1[6]~output_o\);

\HEX2[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX2[0]~output_o\);

\HEX2[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX2[1]~output_o\);

\HEX2[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX2[2]~output_o\);

\HEX2[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX2[3]~output_o\);

\HEX2[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX2[4]~output_o\);

\HEX2[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX2[5]~output_o\);

\HEX2[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX2[6]~output_o\);

\HEX3[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX3[0]~output_o\);

\HEX3[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX3[1]~output_o\);

\HEX3[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX3[2]~output_o\);

\HEX3[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX3[3]~output_o\);

\HEX3[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX3[4]~output_o\);

\HEX3[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX3[5]~output_o\);

\HEX3[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX3[6]~output_o\);

\HEX4[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX4[0]~output_o\);

\HEX4[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX4[1]~output_o\);

\HEX4[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX4[2]~output_o\);

\HEX4[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX4[3]~output_o\);

\HEX4[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX4[4]~output_o\);

\HEX4[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX4[5]~output_o\);

\HEX4[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX4[6]~output_o\);

\HEX5[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX5[0]~output_o\);

\HEX5[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX5[1]~output_o\);

\HEX5[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX5[2]~output_o\);

\HEX5[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX5[3]~output_o\);

\HEX5[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX5[4]~output_o\);

\HEX5[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX5[5]~output_o\);

\HEX5[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX5[6]~output_o\);

\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

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

\TrafficFSM|state~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|state~10_combout\ = (\KEY[0]~input_o\ & !\TrafficFSM|state.S3_YELLOW~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datad => \TrafficFSM|state.S3_YELLOW~q\,
	combout => \TrafficFSM|state~10_combout\);

\TrafficFSM|timer~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|timer~7_combout\ = ((!\TrafficFSM|timer\(0) & ((!\TrafficFSM|Equal0~0_combout\) # (!\TrafficFSM|state.S1_S2_YELLOW~q\)))) # (!\KEY[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TrafficFSM|state.S1_S2_YELLOW~q\,
	datab => \TrafficFSM|Equal0~0_combout\,
	datac => \TrafficFSM|timer\(0),
	datad => \KEY[0]~input_o\,
	combout => \TrafficFSM|timer~7_combout\);

\FreqDiv|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~0_combout\ = \FreqDiv|cnt1\(0) $ (VCC)
-- \FreqDiv|Add0~1\ = CARRY(\FreqDiv|cnt1\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(0),
	datad => VCC,
	combout => \FreqDiv|Add0~0_combout\,
	cout => \FreqDiv|Add0~1\);

\FreqDiv|cnt1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(0));

\FreqDiv|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~2_combout\ = (\FreqDiv|cnt1\(1) & (!\FreqDiv|Add0~1\)) # (!\FreqDiv|cnt1\(1) & ((\FreqDiv|Add0~1\) # (GND)))
-- \FreqDiv|Add0~3\ = CARRY((!\FreqDiv|Add0~1\) # (!\FreqDiv|cnt1\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(1),
	datad => VCC,
	cin => \FreqDiv|Add0~1\,
	combout => \FreqDiv|Add0~2_combout\,
	cout => \FreqDiv|Add0~3\);

\FreqDiv|cnt1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(1));

\FreqDiv|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~4_combout\ = (\FreqDiv|cnt1\(2) & (\FreqDiv|Add0~3\ $ (GND))) # (!\FreqDiv|cnt1\(2) & (!\FreqDiv|Add0~3\ & VCC))
-- \FreqDiv|Add0~5\ = CARRY((\FreqDiv|cnt1\(2) & !\FreqDiv|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(2),
	datad => VCC,
	cin => \FreqDiv|Add0~3\,
	combout => \FreqDiv|Add0~4_combout\,
	cout => \FreqDiv|Add0~5\);

\FreqDiv|cnt1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(2));

\FreqDiv|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~6_combout\ = (\FreqDiv|cnt1\(3) & (!\FreqDiv|Add0~5\)) # (!\FreqDiv|cnt1\(3) & ((\FreqDiv|Add0~5\) # (GND)))
-- \FreqDiv|Add0~7\ = CARRY((!\FreqDiv|Add0~5\) # (!\FreqDiv|cnt1\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(3),
	datad => VCC,
	cin => \FreqDiv|Add0~5\,
	combout => \FreqDiv|Add0~6_combout\,
	cout => \FreqDiv|Add0~7\);

\FreqDiv|cnt1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(3));

\FreqDiv|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~8_combout\ = (\FreqDiv|cnt1\(4) & (\FreqDiv|Add0~7\ $ (GND))) # (!\FreqDiv|cnt1\(4) & (!\FreqDiv|Add0~7\ & VCC))
-- \FreqDiv|Add0~9\ = CARRY((\FreqDiv|cnt1\(4) & !\FreqDiv|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(4),
	datad => VCC,
	cin => \FreqDiv|Add0~7\,
	combout => \FreqDiv|Add0~8_combout\,
	cout => \FreqDiv|Add0~9\);

\FreqDiv|cnt1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(4));

\FreqDiv|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~10_combout\ = (\FreqDiv|cnt1\(5) & (!\FreqDiv|Add0~9\)) # (!\FreqDiv|cnt1\(5) & ((\FreqDiv|Add0~9\) # (GND)))
-- \FreqDiv|Add0~11\ = CARRY((!\FreqDiv|Add0~9\) # (!\FreqDiv|cnt1\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(5),
	datad => VCC,
	cin => \FreqDiv|Add0~9\,
	combout => \FreqDiv|Add0~10_combout\,
	cout => \FreqDiv|Add0~11\);

\FreqDiv|cnt1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(5));

\FreqDiv|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~12_combout\ = (\FreqDiv|cnt1\(6) & (\FreqDiv|Add0~11\ $ (GND))) # (!\FreqDiv|cnt1\(6) & (!\FreqDiv|Add0~11\ & VCC))
-- \FreqDiv|Add0~13\ = CARRY((\FreqDiv|cnt1\(6) & !\FreqDiv|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(6),
	datad => VCC,
	cin => \FreqDiv|Add0~11\,
	combout => \FreqDiv|Add0~12_combout\,
	cout => \FreqDiv|Add0~13\);

\FreqDiv|cnt1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt1~4_combout\ = (\FreqDiv|Add0~12_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Add0~12_combout\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt1~4_combout\);

\FreqDiv|cnt1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|cnt1~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(6));

\FreqDiv|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~14_combout\ = (\FreqDiv|cnt1\(7) & (!\FreqDiv|Add0~13\)) # (!\FreqDiv|cnt1\(7) & ((\FreqDiv|Add0~13\) # (GND)))
-- \FreqDiv|Add0~15\ = CARRY((!\FreqDiv|Add0~13\) # (!\FreqDiv|cnt1\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(7),
	datad => VCC,
	cin => \FreqDiv|Add0~13\,
	combout => \FreqDiv|Add0~14_combout\,
	cout => \FreqDiv|Add0~15\);

\FreqDiv|cnt1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|Add0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(7));

\FreqDiv|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~16_combout\ = (\FreqDiv|cnt1\(8) & (\FreqDiv|Add0~15\ $ (GND))) # (!\FreqDiv|cnt1\(8) & (!\FreqDiv|Add0~15\ & VCC))
-- \FreqDiv|Add0~17\ = CARRY((\FreqDiv|cnt1\(8) & !\FreqDiv|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(8),
	datad => VCC,
	cin => \FreqDiv|Add0~15\,
	combout => \FreqDiv|Add0~16_combout\,
	cout => \FreqDiv|Add0~17\);

\FreqDiv|cnt1[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|Add0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(8));

\FreqDiv|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~18_combout\ = (\FreqDiv|cnt1\(9) & (!\FreqDiv|Add0~17\)) # (!\FreqDiv|cnt1\(9) & ((\FreqDiv|Add0~17\) # (GND)))
-- \FreqDiv|Add0~19\ = CARRY((!\FreqDiv|Add0~17\) # (!\FreqDiv|cnt1\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(9),
	datad => VCC,
	cin => \FreqDiv|Add0~17\,
	combout => \FreqDiv|Add0~18_combout\,
	cout => \FreqDiv|Add0~19\);

\FreqDiv|cnt1[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(9));

\FreqDiv|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~20_combout\ = (\FreqDiv|cnt1\(10) & (\FreqDiv|Add0~19\ $ (GND))) # (!\FreqDiv|cnt1\(10) & (!\FreqDiv|Add0~19\ & VCC))
-- \FreqDiv|Add0~21\ = CARRY((\FreqDiv|cnt1\(10) & !\FreqDiv|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(10),
	datad => VCC,
	cin => \FreqDiv|Add0~19\,
	combout => \FreqDiv|Add0~20_combout\,
	cout => \FreqDiv|Add0~21\);

\FreqDiv|cnt1[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|Add0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(10));

\FreqDiv|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~22_combout\ = (\FreqDiv|cnt1\(11) & (!\FreqDiv|Add0~21\)) # (!\FreqDiv|cnt1\(11) & ((\FreqDiv|Add0~21\) # (GND)))
-- \FreqDiv|Add0~23\ = CARRY((!\FreqDiv|Add0~21\) # (!\FreqDiv|cnt1\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(11),
	datad => VCC,
	cin => \FreqDiv|Add0~21\,
	combout => \FreqDiv|Add0~22_combout\,
	cout => \FreqDiv|Add0~23\);

\FreqDiv|cnt1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt1~3_combout\ = (\FreqDiv|Add0~22_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Add0~22_combout\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt1~3_combout\);

\FreqDiv|cnt1[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|cnt1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(11));

\FreqDiv|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~24_combout\ = (\FreqDiv|cnt1\(12) & (\FreqDiv|Add0~23\ $ (GND))) # (!\FreqDiv|cnt1\(12) & (!\FreqDiv|Add0~23\ & VCC))
-- \FreqDiv|Add0~25\ = CARRY((\FreqDiv|cnt1\(12) & !\FreqDiv|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(12),
	datad => VCC,
	cin => \FreqDiv|Add0~23\,
	combout => \FreqDiv|Add0~24_combout\,
	cout => \FreqDiv|Add0~25\);

\FreqDiv|cnt1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt1~2_combout\ = (\FreqDiv|Add0~24_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Add0~24_combout\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt1~2_combout\);

\FreqDiv|cnt1[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|cnt1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(12));

\FreqDiv|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~26_combout\ = (\FreqDiv|cnt1\(13) & (!\FreqDiv|Add0~25\)) # (!\FreqDiv|cnt1\(13) & ((\FreqDiv|Add0~25\) # (GND)))
-- \FreqDiv|Add0~27\ = CARRY((!\FreqDiv|Add0~25\) # (!\FreqDiv|cnt1\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(13),
	datad => VCC,
	cin => \FreqDiv|Add0~25\,
	combout => \FreqDiv|Add0~26_combout\,
	cout => \FreqDiv|Add0~27\);

\FreqDiv|cnt1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt1~1_combout\ = (\FreqDiv|Add0~26_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Add0~26_combout\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt1~1_combout\);

\FreqDiv|cnt1[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|cnt1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(13));

\FreqDiv|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~28_combout\ = (\FreqDiv|cnt1\(14) & (\FreqDiv|Add0~27\ $ (GND))) # (!\FreqDiv|cnt1\(14) & (!\FreqDiv|Add0~27\ & VCC))
-- \FreqDiv|Add0~29\ = CARRY((\FreqDiv|cnt1\(14) & !\FreqDiv|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(14),
	datad => VCC,
	cin => \FreqDiv|Add0~27\,
	combout => \FreqDiv|Add0~28_combout\,
	cout => \FreqDiv|Add0~29\);

\FreqDiv|cnt1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt1~0_combout\ = (\FreqDiv|Add0~28_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Add0~28_combout\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt1~0_combout\);

\FreqDiv|cnt1[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|cnt1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(14));

\FreqDiv|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~30_combout\ = (\FreqDiv|cnt1\(15) & (!\FreqDiv|Add0~29\)) # (!\FreqDiv|cnt1\(15) & ((\FreqDiv|Add0~29\) # (GND)))
-- \FreqDiv|Add0~31\ = CARRY((!\FreqDiv|Add0~29\) # (!\FreqDiv|cnt1\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(15),
	datad => VCC,
	cin => \FreqDiv|Add0~29\,
	combout => \FreqDiv|Add0~30_combout\,
	cout => \FreqDiv|Add0~31\);

\FreqDiv|cnt1[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|Add0~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(15));

\FreqDiv|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Equal0~0_combout\ = (\FreqDiv|cnt1\(14) & (\FreqDiv|cnt1\(13) & (\FreqDiv|cnt1\(12) & !\FreqDiv|cnt1\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(14),
	datab => \FreqDiv|cnt1\(13),
	datac => \FreqDiv|cnt1\(12),
	datad => \FreqDiv|cnt1\(15),
	combout => \FreqDiv|Equal0~0_combout\);

\FreqDiv|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Equal0~1_combout\ = (\FreqDiv|cnt1\(11) & (!\FreqDiv|cnt1\(10) & (!\FreqDiv|cnt1\(9) & !\FreqDiv|cnt1\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(11),
	datab => \FreqDiv|cnt1\(10),
	datac => \FreqDiv|cnt1\(9),
	datad => \FreqDiv|cnt1\(8),
	combout => \FreqDiv|Equal0~1_combout\);

\FreqDiv|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Equal0~2_combout\ = (\FreqDiv|cnt1\(5) & (\FreqDiv|cnt1\(4) & (!\FreqDiv|cnt1\(7) & !\FreqDiv|cnt1\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(5),
	datab => \FreqDiv|cnt1\(4),
	datac => \FreqDiv|cnt1\(7),
	datad => \FreqDiv|cnt1\(6),
	combout => \FreqDiv|Equal0~2_combout\);

\FreqDiv|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Equal0~3_combout\ = (\FreqDiv|cnt1\(3) & (\FreqDiv|cnt1\(2) & (\FreqDiv|cnt1\(1) & \FreqDiv|cnt1\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(3),
	datab => \FreqDiv|cnt1\(2),
	datac => \FreqDiv|cnt1\(1),
	datad => \FreqDiv|cnt1\(0),
	combout => \FreqDiv|Equal0~3_combout\);

\FreqDiv|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Equal0~4_combout\ = (\FreqDiv|Equal0~0_combout\ & (\FreqDiv|Equal0~1_combout\ & (\FreqDiv|Equal0~2_combout\ & \FreqDiv|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Equal0~0_combout\,
	datab => \FreqDiv|Equal0~1_combout\,
	datac => \FreqDiv|Equal0~2_combout\,
	datad => \FreqDiv|Equal0~3_combout\,
	combout => \FreqDiv|Equal0~4_combout\);

\FreqDiv|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~32_combout\ = (\FreqDiv|cnt1\(16) & (\FreqDiv|Add0~31\ $ (GND))) # (!\FreqDiv|cnt1\(16) & (!\FreqDiv|Add0~31\ & VCC))
-- \FreqDiv|Add0~33\ = CARRY((\FreqDiv|cnt1\(16) & !\FreqDiv|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(16),
	datad => VCC,
	cin => \FreqDiv|Add0~31\,
	combout => \FreqDiv|Add0~32_combout\,
	cout => \FreqDiv|Add0~33\);

\FreqDiv|cnt1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt1~5_combout\ = (\FreqDiv|Add0~32_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Add0~32_combout\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt1~5_combout\);

\FreqDiv|cnt1[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|cnt1~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(16));

\FreqDiv|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~34_combout\ = (\FreqDiv|cnt1\(17) & (!\FreqDiv|Add0~33\)) # (!\FreqDiv|cnt1\(17) & ((\FreqDiv|Add0~33\) # (GND)))
-- \FreqDiv|Add0~35\ = CARRY((!\FreqDiv|Add0~33\) # (!\FreqDiv|cnt1\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(17),
	datad => VCC,
	cin => \FreqDiv|Add0~33\,
	combout => \FreqDiv|Add0~34_combout\,
	cout => \FreqDiv|Add0~35\);

\FreqDiv|cnt1[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|Add0~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(17));

\FreqDiv|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~36_combout\ = (\FreqDiv|cnt1\(18) & (\FreqDiv|Add0~35\ $ (GND))) # (!\FreqDiv|cnt1\(18) & (!\FreqDiv|Add0~35\ & VCC))
-- \FreqDiv|Add0~37\ = CARRY((\FreqDiv|cnt1\(18) & !\FreqDiv|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(18),
	datad => VCC,
	cin => \FreqDiv|Add0~35\,
	combout => \FreqDiv|Add0~36_combout\,
	cout => \FreqDiv|Add0~37\);

\FreqDiv|cnt1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt1~6_combout\ = (\FreqDiv|Add0~36_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Add0~36_combout\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt1~6_combout\);

\FreqDiv|cnt1[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|cnt1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(18));

\FreqDiv|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~38_combout\ = (\FreqDiv|cnt1\(19) & (!\FreqDiv|Add0~37\)) # (!\FreqDiv|cnt1\(19) & ((\FreqDiv|Add0~37\) # (GND)))
-- \FreqDiv|Add0~39\ = CARRY((!\FreqDiv|Add0~37\) # (!\FreqDiv|cnt1\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(19),
	datad => VCC,
	cin => \FreqDiv|Add0~37\,
	combout => \FreqDiv|Add0~38_combout\,
	cout => \FreqDiv|Add0~39\);

\FreqDiv|cnt1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt1~7_combout\ = (\FreqDiv|Add0~38_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Add0~38_combout\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt1~7_combout\);

\FreqDiv|cnt1[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|cnt1~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(19));

\FreqDiv|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Equal0~5_combout\ = (\FreqDiv|cnt1\(16) & (\FreqDiv|cnt1\(18) & (\FreqDiv|cnt1\(19) & !\FreqDiv|cnt1\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(16),
	datab => \FreqDiv|cnt1\(18),
	datac => \FreqDiv|cnt1\(19),
	datad => \FreqDiv|cnt1\(17),
	combout => \FreqDiv|Equal0~5_combout\);

\FreqDiv|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~40_combout\ = (\FreqDiv|cnt1\(20) & (\FreqDiv|Add0~39\ $ (GND))) # (!\FreqDiv|cnt1\(20) & (!\FreqDiv|Add0~39\ & VCC))
-- \FreqDiv|Add0~41\ = CARRY((\FreqDiv|cnt1\(20) & !\FreqDiv|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(20),
	datad => VCC,
	cin => \FreqDiv|Add0~39\,
	combout => \FreqDiv|Add0~40_combout\,
	cout => \FreqDiv|Add0~41\);

\FreqDiv|cnt1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt1~8_combout\ = (\FreqDiv|Add0~40_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Add0~40_combout\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt1~8_combout\);

\FreqDiv|cnt1[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|cnt1~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(20));

\FreqDiv|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~42_combout\ = (\FreqDiv|cnt1\(21) & (!\FreqDiv|Add0~41\)) # (!\FreqDiv|cnt1\(21) & ((\FreqDiv|Add0~41\) # (GND)))
-- \FreqDiv|Add0~43\ = CARRY((!\FreqDiv|Add0~41\) # (!\FreqDiv|cnt1\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(21),
	datad => VCC,
	cin => \FreqDiv|Add0~41\,
	combout => \FreqDiv|Add0~42_combout\,
	cout => \FreqDiv|Add0~43\);

\FreqDiv|cnt1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt1~9_combout\ = (\FreqDiv|Add0~42_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Add0~42_combout\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt1~9_combout\);

\FreqDiv|cnt1[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|cnt1~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(21));

\FreqDiv|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~44_combout\ = (\FreqDiv|cnt1\(22) & (\FreqDiv|Add0~43\ $ (GND))) # (!\FreqDiv|cnt1\(22) & (!\FreqDiv|Add0~43\ & VCC))
-- \FreqDiv|Add0~45\ = CARRY((\FreqDiv|cnt1\(22) & !\FreqDiv|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(22),
	datad => VCC,
	cin => \FreqDiv|Add0~43\,
	combout => \FreqDiv|Add0~44_combout\,
	cout => \FreqDiv|Add0~45\);

\FreqDiv|cnt1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt1~10_combout\ = (\FreqDiv|Add0~44_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Add0~44_combout\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt1~10_combout\);

\FreqDiv|cnt1[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|cnt1~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(22));

\FreqDiv|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~46_combout\ = (\FreqDiv|cnt1\(23) & (!\FreqDiv|Add0~45\)) # (!\FreqDiv|cnt1\(23) & ((\FreqDiv|Add0~45\) # (GND)))
-- \FreqDiv|Add0~47\ = CARRY((!\FreqDiv|Add0~45\) # (!\FreqDiv|cnt1\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(23),
	datad => VCC,
	cin => \FreqDiv|Add0~45\,
	combout => \FreqDiv|Add0~46_combout\,
	cout => \FreqDiv|Add0~47\);

\FreqDiv|cnt1[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|Add0~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(23));

\FreqDiv|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Equal0~6_combout\ = (\FreqDiv|cnt1\(20) & (\FreqDiv|cnt1\(21) & (\FreqDiv|cnt1\(22) & !\FreqDiv|cnt1\(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(20),
	datab => \FreqDiv|cnt1\(21),
	datac => \FreqDiv|cnt1\(22),
	datad => \FreqDiv|cnt1\(23),
	combout => \FreqDiv|Equal0~6_combout\);

\FreqDiv|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~48_combout\ = (\FreqDiv|cnt1\(24) & (\FreqDiv|Add0~47\ $ (GND))) # (!\FreqDiv|cnt1\(24) & (!\FreqDiv|Add0~47\ & VCC))
-- \FreqDiv|Add0~49\ = CARRY((\FreqDiv|cnt1\(24) & !\FreqDiv|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(24),
	datad => VCC,
	cin => \FreqDiv|Add0~47\,
	combout => \FreqDiv|Add0~48_combout\,
	cout => \FreqDiv|Add0~49\);

\FreqDiv|cnt1~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt1~11_combout\ = (\FreqDiv|Add0~48_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Add0~48_combout\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt1~11_combout\);

\FreqDiv|cnt1[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|cnt1~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(24));

\FreqDiv|Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~50_combout\ = \FreqDiv|cnt1\(25) $ (\FreqDiv|Add0~49\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(25),
	cin => \FreqDiv|Add0~49\,
	combout => \FreqDiv|Add0~50_combout\);

\FreqDiv|cnt1[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|Add0~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt1\(25));

\FreqDiv|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Equal0~7_combout\ = (\FreqDiv|cnt1\(24) & !\FreqDiv|cnt1\(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt1\(24),
	datad => \FreqDiv|cnt1\(25),
	combout => \FreqDiv|Equal0~7_combout\);

\FreqDiv|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Equal0~8_combout\ = (\FreqDiv|Equal0~4_combout\ & (\FreqDiv|Equal0~5_combout\ & (\FreqDiv|Equal0~6_combout\ & \FreqDiv|Equal0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Equal0~4_combout\,
	datab => \FreqDiv|Equal0~5_combout\,
	datac => \FreqDiv|Equal0~6_combout\,
	datad => \FreqDiv|Equal0~7_combout\,
	combout => \FreqDiv|Equal0~8_combout\);

\FreqDiv|s_en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|Equal0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|s_en~q\);

\TrafficFSM|timer[3]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|timer[3]~2_combout\ = ((!\SW[0]~input_o\ & \FreqDiv|s_en~q\)) # (!\KEY[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \SW[0]~input_o\,
	datad => \FreqDiv|s_en~q\,
	combout => \TrafficFSM|timer[3]~2_combout\);

\TrafficFSM|timer[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \TrafficFSM|timer~7_combout\,
	ena => \TrafficFSM|timer[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TrafficFSM|timer\(0));

\TrafficFSM|timer~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|timer~5_combout\ = (\TrafficFSM|timer\(1) & (\TrafficFSM|timer\(0))) # (!\TrafficFSM|timer\(1) & (!\TrafficFSM|timer\(0) & ((\TrafficFSM|timer\(3)) # (\TrafficFSM|timer\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TrafficFSM|timer\(1),
	datab => \TrafficFSM|timer\(0),
	datac => \TrafficFSM|timer\(3),
	datad => \TrafficFSM|timer\(2),
	combout => \TrafficFSM|timer~5_combout\);

\TrafficFSM|timer~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|timer~6_combout\ = (\KEY[0]~input_o\ & ((\TrafficFSM|timer~5_combout\) # ((\TrafficFSM|Equal0~0_combout\ & !\TrafficFSM|state.S3_YELLOW~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \TrafficFSM|timer~5_combout\,
	datac => \TrafficFSM|Equal0~0_combout\,
	datad => \TrafficFSM|state.S3_YELLOW~q\,
	combout => \TrafficFSM|timer~6_combout\);

\TrafficFSM|timer[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \TrafficFSM|timer~6_combout\,
	ena => \TrafficFSM|timer[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TrafficFSM|timer\(1));

\TrafficFSM|timer~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|timer~3_combout\ = (\TrafficFSM|timer\(2) & ((\TrafficFSM|timer\(1)) # ((\TrafficFSM|timer\(0))))) # (!\TrafficFSM|timer\(2) & (!\TrafficFSM|timer\(1) & (!\TrafficFSM|timer\(0) & \TrafficFSM|timer\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TrafficFSM|timer\(2),
	datab => \TrafficFSM|timer\(1),
	datac => \TrafficFSM|timer\(0),
	datad => \TrafficFSM|timer\(3),
	combout => \TrafficFSM|timer~3_combout\);

\TrafficFSM|timer~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|timer~4_combout\ = (\KEY[0]~input_o\ & ((\TrafficFSM|timer~3_combout\) # ((\TrafficFSM|state.S1_S2_YELLOW~q\ & \TrafficFSM|Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \TrafficFSM|timer~3_combout\,
	datac => \TrafficFSM|state.S1_S2_YELLOW~q\,
	datad => \TrafficFSM|Equal0~0_combout\,
	combout => \TrafficFSM|timer~4_combout\);

\TrafficFSM|timer[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \TrafficFSM|timer~4_combout\,
	ena => \TrafficFSM|timer[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TrafficFSM|timer\(2));

\TrafficFSM|timer~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|timer~0_combout\ = (\TrafficFSM|timer\(3) & ((\TrafficFSM|timer\(2)) # ((\TrafficFSM|timer\(1)) # (\TrafficFSM|timer\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TrafficFSM|timer\(3),
	datab => \TrafficFSM|timer\(2),
	datac => \TrafficFSM|timer\(1),
	datad => \TrafficFSM|timer\(0),
	combout => \TrafficFSM|timer~0_combout\);

\TrafficFSM|timer~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|timer~1_combout\ = (\TrafficFSM|timer~0_combout\) # (((\TrafficFSM|state.S3_YELLOW~q\ & \TrafficFSM|Equal0~0_combout\)) # (!\KEY[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TrafficFSM|timer~0_combout\,
	datab => \TrafficFSM|state.S3_YELLOW~q\,
	datac => \TrafficFSM|Equal0~0_combout\,
	datad => \KEY[0]~input_o\,
	combout => \TrafficFSM|timer~1_combout\);

\TrafficFSM|timer[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \TrafficFSM|timer~1_combout\,
	ena => \TrafficFSM|timer[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TrafficFSM|timer\(3));

\TrafficFSM|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|Equal0~0_combout\ = (!\TrafficFSM|timer\(3) & (!\TrafficFSM|timer\(2) & (!\TrafficFSM|timer\(1) & !\TrafficFSM|timer\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TrafficFSM|timer\(3),
	datab => \TrafficFSM|timer\(2),
	datac => \TrafficFSM|timer\(1),
	datad => \TrafficFSM|timer\(0),
	combout => \TrafficFSM|Equal0~0_combout\);

\TrafficFSM|state~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|state~9_combout\ = ((\TrafficFSM|Equal0~0_combout\ & (\FreqDiv|s_en~q\ & !\SW[0]~input_o\))) # (!\KEY[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TrafficFSM|Equal0~0_combout\,
	datab => \FreqDiv|s_en~q\,
	datac => \SW[0]~input_o\,
	datad => \KEY[0]~input_o\,
	combout => \TrafficFSM|state~9_combout\);

\TrafficFSM|state.S1_S2_GREEN\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \TrafficFSM|state~10_combout\,
	ena => \TrafficFSM|state~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TrafficFSM|state.S1_S2_GREEN~q\);

\TrafficFSM|state~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|state~8_combout\ = (\KEY[0]~input_o\ & !\TrafficFSM|state.S1_S2_GREEN~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datad => \TrafficFSM|state.S1_S2_GREEN~q\,
	combout => \TrafficFSM|state~8_combout\);

\TrafficFSM|state.S1_S2_YELLOW\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \TrafficFSM|state~8_combout\,
	ena => \TrafficFSM|state~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TrafficFSM|state.S1_S2_YELLOW~q\);

\TrafficFSM|state~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|state~12_combout\ = (\TrafficFSM|state.S1_S2_YELLOW~q\ & \KEY[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TrafficFSM|state.S1_S2_YELLOW~q\,
	datab => \KEY[0]~input_o\,
	combout => \TrafficFSM|state~12_combout\);

\TrafficFSM|state.S3_GREEN\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \TrafficFSM|state~12_combout\,
	ena => \TrafficFSM|state~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TrafficFSM|state.S3_GREEN~q\);

\TrafficFSM|state~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|state~11_combout\ = (\TrafficFSM|state.S3_GREEN~q\ & \KEY[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TrafficFSM|state.S3_GREEN~q\,
	datab => \KEY[0]~input_o\,
	combout => \TrafficFSM|state~11_combout\);

\TrafficFSM|state.S3_YELLOW\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \TrafficFSM|state~11_combout\,
	ena => \TrafficFSM|state~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TrafficFSM|state.S3_YELLOW~q\);

\TrafficFSM|s_intermitente~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|s_intermitente~0_combout\ = (\KEY[0]~input_o\ & (\SW[0]~input_o\ & ((\TrafficFSM|state.S3_YELLOW~q\) # (\TrafficFSM|state.S3_GREEN~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \SW[0]~input_o\,
	datac => \TrafficFSM|state.S3_YELLOW~q\,
	datad => \TrafficFSM|state.S3_GREEN~q\,
	combout => \TrafficFSM|s_intermitente~0_combout\);

\TrafficFSM|s_intermitente~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|s_intermitente~1_combout\ = (\TrafficFSM|s_intermitente~q\) # (\TrafficFSM|s_intermitente~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TrafficFSM|s_intermitente~q\,
	datab => \TrafficFSM|s_intermitente~0_combout\,
	combout => \TrafficFSM|s_intermitente~1_combout\);

\TrafficFSM|s_intermitente\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \TrafficFSM|s_intermitente~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TrafficFSM|s_intermitente~q\);

\TrafficFSM|S1[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|S1[0]~0_combout\ = (\TrafficFSM|s_intermitente~q\) # ((\TrafficFSM|state.S1_S2_YELLOW~q\) # (!\TrafficFSM|state.S1_S2_GREEN~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TrafficFSM|s_intermitente~q\,
	datab => \TrafficFSM|state.S1_S2_YELLOW~q\,
	datad => \TrafficFSM|state.S1_S2_GREEN~q\,
	combout => \TrafficFSM|S1[0]~0_combout\);

\FreqDiv|s_clk1hz~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|s_clk1hz~0_combout\ = \FreqDiv|s_clk1hz~q\ $ (\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \FreqDiv|s_clk1hz~q\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|s_clk1hz~0_combout\);

\FreqDiv|s_clk1hz\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \FreqDiv|s_clk1hz~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|s_clk1hz~q\);

\TrafficFSM|S1[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|S1[1]~1_combout\ = (\TrafficFSM|s_intermitente~q\ & (\FreqDiv|s_clk1hz~q\)) # (!\TrafficFSM|s_intermitente~q\ & ((\TrafficFSM|state.S1_S2_YELLOW~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|s_clk1hz~q\,
	datab => \TrafficFSM|state.S1_S2_YELLOW~q\,
	datad => \TrafficFSM|s_intermitente~q\,
	combout => \TrafficFSM|S1[1]~1_combout\);

\TrafficFSM|S1[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|S1[2]~2_combout\ = (\TrafficFSM|s_intermitente~q\) # (\TrafficFSM|state.S1_S2_GREEN~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TrafficFSM|s_intermitente~q\,
	datab => \TrafficFSM|state.S1_S2_GREEN~q\,
	combout => \TrafficFSM|S1[2]~2_combout\);

\TrafficFSM|S3[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|S3[0]~0_combout\ = (!\TrafficFSM|s_intermitente~q\ & ((\TrafficFSM|state.S1_S2_YELLOW~q\) # (!\TrafficFSM|state.S1_S2_GREEN~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TrafficFSM|state.S1_S2_YELLOW~q\,
	datac => \TrafficFSM|state.S1_S2_GREEN~q\,
	datad => \TrafficFSM|s_intermitente~q\,
	combout => \TrafficFSM|S3[0]~0_combout\);

\TrafficFSM|S3[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|S3[1]~1_combout\ = (\TrafficFSM|s_intermitente~q\ & (\FreqDiv|s_clk1hz~q\)) # (!\TrafficFSM|s_intermitente~q\ & ((\TrafficFSM|state.S3_YELLOW~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|s_clk1hz~q\,
	datab => \TrafficFSM|state.S3_YELLOW~q\,
	datad => \TrafficFSM|s_intermitente~q\,
	combout => \TrafficFSM|S3[1]~1_combout\);

\TrafficFSM|S3[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \TrafficFSM|S3[2]~2_combout\ = (\TrafficFSM|state.S3_GREEN~q\ & !\TrafficFSM|s_intermitente~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TrafficFSM|state.S3_GREEN~q\,
	datad => \TrafficFSM|s_intermitente~q\,
	combout => \TrafficFSM|S3[2]~2_combout\);

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

ww_HEX0(0) <= \HEX0[0]~output_o\;

ww_HEX0(1) <= \HEX0[1]~output_o\;

ww_HEX0(2) <= \HEX0[2]~output_o\;

ww_HEX0(3) <= \HEX0[3]~output_o\;

ww_HEX0(4) <= \HEX0[4]~output_o\;

ww_HEX0(5) <= \HEX0[5]~output_o\;

ww_HEX0(6) <= \HEX0[6]~output_o\;

ww_HEX1(0) <= \HEX1[0]~output_o\;

ww_HEX1(1) <= \HEX1[1]~output_o\;

ww_HEX1(2) <= \HEX1[2]~output_o\;

ww_HEX1(3) <= \HEX1[3]~output_o\;

ww_HEX1(4) <= \HEX1[4]~output_o\;

ww_HEX1(5) <= \HEX1[5]~output_o\;

ww_HEX1(6) <= \HEX1[6]~output_o\;

ww_HEX2(0) <= \HEX2[0]~output_o\;

ww_HEX2(1) <= \HEX2[1]~output_o\;

ww_HEX2(2) <= \HEX2[2]~output_o\;

ww_HEX2(3) <= \HEX2[3]~output_o\;

ww_HEX2(4) <= \HEX2[4]~output_o\;

ww_HEX2(5) <= \HEX2[5]~output_o\;

ww_HEX2(6) <= \HEX2[6]~output_o\;

ww_HEX3(0) <= \HEX3[0]~output_o\;

ww_HEX3(1) <= \HEX3[1]~output_o\;

ww_HEX3(2) <= \HEX3[2]~output_o\;

ww_HEX3(3) <= \HEX3[3]~output_o\;

ww_HEX3(4) <= \HEX3[4]~output_o\;

ww_HEX3(5) <= \HEX3[5]~output_o\;

ww_HEX3(6) <= \HEX3[6]~output_o\;

ww_HEX4(0) <= \HEX4[0]~output_o\;

ww_HEX4(1) <= \HEX4[1]~output_o\;

ww_HEX4(2) <= \HEX4[2]~output_o\;

ww_HEX4(3) <= \HEX4[3]~output_o\;

ww_HEX4(4) <= \HEX4[4]~output_o\;

ww_HEX4(5) <= \HEX4[5]~output_o\;

ww_HEX4(6) <= \HEX4[6]~output_o\;

ww_HEX5(0) <= \HEX5[0]~output_o\;

ww_HEX5(1) <= \HEX5[1]~output_o\;

ww_HEX5(2) <= \HEX5[2]~output_o\;

ww_HEX5(3) <= \HEX5[3]~output_o\;

ww_HEX5(4) <= \HEX5[4]~output_o\;

ww_HEX5(5) <= \HEX5[5]~output_o\;

ww_HEX5(6) <= \HEX5[6]~output_o\;
END structure;


