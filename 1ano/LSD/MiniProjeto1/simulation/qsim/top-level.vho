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

-- DATE "04/08/2025 14:25:29"

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

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	top_level IS
    PORT (
	CLOCK_50 : IN std_logic;
	SW : IN std_logic_vector(1 DOWNTO 0);
	HEX0 : OUT std_logic_vector(6 DOWNTO 0);
	LEDR : OUT std_logic_vector(7 DOWNTO 0);
	LEDG : OUT std_logic_vector(3 DOWNTO 0)
	);
END top_level;

-- Design Ports Information
-- HEX0[0]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_L26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_L25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[6]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[4]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[5]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[6]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[7]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[0]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[1]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[2]	=>  Location: PIN_E25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[3]	=>  Location: PIN_E24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF top_level IS
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
SIGNAL ww_SW : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_LEDR : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_LEDG : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \HEX0[0]~output_o\ : std_logic;
SIGNAL \HEX0[1]~output_o\ : std_logic;
SIGNAL \HEX0[2]~output_o\ : std_logic;
SIGNAL \HEX0[3]~output_o\ : std_logic;
SIGNAL \HEX0[4]~output_o\ : std_logic;
SIGNAL \HEX0[5]~output_o\ : std_logic;
SIGNAL \HEX0[6]~output_o\ : std_logic;
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \LEDR[1]~output_o\ : std_logic;
SIGNAL \LEDR[2]~output_o\ : std_logic;
SIGNAL \LEDR[3]~output_o\ : std_logic;
SIGNAL \LEDR[4]~output_o\ : std_logic;
SIGNAL \LEDR[5]~output_o\ : std_logic;
SIGNAL \LEDR[6]~output_o\ : std_logic;
SIGNAL \LEDR[7]~output_o\ : std_logic;
SIGNAL \LEDG[0]~output_o\ : std_logic;
SIGNAL \LEDG[1]~output_o\ : std_logic;
SIGNAL \LEDG[2]~output_o\ : std_logic;
SIGNAL \LEDG[3]~output_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \decoder|HEX_N[0]~0_combout\ : std_logic;
SIGNAL \decoder|Equal1~0_combout\ : std_logic;
SIGNAL \LEDR~0_combout\ : std_logic;
SIGNAL \decoder|Equal3~0_combout\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~0_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~1\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~2_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~3\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~4_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~5\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~6_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~7\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~8_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~9\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~10_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|s_cnt~5_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~11\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~12_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~13\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~14_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~15\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~16_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~17\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~18_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~19\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~20_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|s_cnt~4_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~21\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~22_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|s_cnt~3_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~23\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~24_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|s_cnt~2_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~25\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~26_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|s_cnt~1_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~27\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~28_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~29\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~30_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|s_cnt~0_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~31\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~32_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~33\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~34_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|s_cnt~6_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~35\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~36_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|s_cnt~7_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~37\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~38_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|s_cnt~8_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~39\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~40_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|s_cnt~9_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Equal0~5_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Equal0~4_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~41\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~42_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|s_cnt~10_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~43\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~44_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~45\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Add0~46_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|s_cnt~11_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Equal0~6_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Equal0~0_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Equal0~2_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Equal0~1_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Equal0~3_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|Equal0~7_combout\ : std_logic;
SIGNAL \clock_gen|gen_2hz|pulse~q\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~1_cout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~3_cout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~5_cout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~7_cout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~8_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~9\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~10_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~11\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~12_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~13\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~14_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|s_cnt~13_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~15\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~16_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|s_cnt~12_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~17\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~18_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~19\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~20_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~21\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~22_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~23\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~25\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~26_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~27\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~28_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|s_cnt~9_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~29\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~30_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|s_cnt~8_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~31\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~32_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~33\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~34_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~35\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~36_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~37\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~38_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~39\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~40_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|s_cnt~14_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~41\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~42_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|s_cnt~15_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~43\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~44_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|s_cnt~16_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~45\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~47\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~48_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~49\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~50_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~51\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~52_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~53\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~54_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|s_cnt~11_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Equal0~2_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~24_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|s_cnt~10_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Equal0~0_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Equal0~1_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Add0~46_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|s_cnt~17_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Equal0~6_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Equal0~5_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Equal0~4_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Equal0~3_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Equal0~7_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|Equal0~8_combout\ : std_logic;
SIGNAL \clock_gen|gen_6s|pulse~q\ : std_logic;
SIGNAL \prog4_inst|mode~0_combout\ : std_logic;
SIGNAL \prog4_inst|mode~q\ : std_logic;
SIGNAL \prog4_inst|red_blink~0_combout\ : std_logic;
SIGNAL \prog4_inst|red_blink~q\ : std_logic;
SIGNAL \LEDR~1_combout\ : std_logic;
SIGNAL \prog2_inst|led_state~0_combout\ : std_logic;
SIGNAL \prog2_inst|led_state~q\ : std_logic;
SIGNAL \LEDR~2_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~1_cout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~3_cout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~5_cout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~7_cout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~9_cout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~10_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|s_cnt~5_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~11\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~12_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~13\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~14_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~15\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~16_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~17\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~18_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~19\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~20_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|s_cnt~4_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~21\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~22_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|s_cnt~3_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~23\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~24_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|s_cnt~2_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~25\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~26_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|s_cnt~1_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~27\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~28_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~29\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~30_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|s_cnt~0_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~31\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~32_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Equal0~3_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Equal0~2_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~33\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~34_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|s_cnt~6_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~35\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~36_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|s_cnt~7_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~37\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~38_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|s_cnt~8_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~39\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~40_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|s_cnt~9_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~41\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~42_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|s_cnt~10_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~43\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~44_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Equal0~4_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~45\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Add0~46_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|s_cnt~11_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Equal0~5_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Equal0~0_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Equal0~1_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|Equal0~6_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|pulse~q\ : std_logic;
SIGNAL \prog4_inst|green_blink~0_combout\ : std_logic;
SIGNAL \prog4_inst|green_blink~q\ : std_logic;
SIGNAL \LEDG~0_combout\ : std_logic;
SIGNAL \prog3_inst|led_state~0_combout\ : std_logic;
SIGNAL \prog3_inst|led_state~q\ : std_logic;
SIGNAL \LEDG~1_combout\ : std_logic;
SIGNAL \clock_gen|gen_1hz|s_cnt\ : std_logic_vector(24 DOWNTO 0);
SIGNAL \clock_gen|gen_2hz|s_cnt\ : std_logic_vector(23 DOWNTO 0);
SIGNAL \clock_gen|gen_6s|s_cnt\ : std_logic_vector(28 DOWNTO 0);
SIGNAL \decoder|ALT_INV_Equal3~0_combout\ : std_logic;
SIGNAL \ALT_INV_LEDR~0_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_HEX_N[0]~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_SW <= SW;
HEX0 <= ww_HEX0;
LEDR <= ww_LEDR;
LEDG <= ww_LEDG;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);
\decoder|ALT_INV_Equal3~0_combout\ <= NOT \decoder|Equal3~0_combout\;
\ALT_INV_LEDR~0_combout\ <= NOT \LEDR~0_combout\;
\decoder|ALT_INV_Equal1~0_combout\ <= NOT \decoder|Equal1~0_combout\;
\decoder|ALT_INV_HEX_N[0]~0_combout\ <= NOT \decoder|HEX_N[0]~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X69_Y73_N23
\HEX0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|ALT_INV_HEX_N[0]~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[0]~output_o\);

-- Location: IOOBUF_X107_Y73_N23
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

-- Location: IOOBUF_X67_Y73_N23
\HEX0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Equal1~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[2]~output_o\);

-- Location: IOOBUF_X115_Y50_N2
\HEX0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|ALT_INV_HEX_N[0]~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[3]~output_o\);

-- Location: IOOBUF_X115_Y54_N16
\HEX0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|ALT_INV_Equal1~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[4]~output_o\);

-- Location: IOOBUF_X115_Y67_N16
\HEX0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_LEDR~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[5]~output_o\);

-- Location: IOOBUF_X115_Y69_N2
\HEX0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|ALT_INV_Equal3~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[6]~output_o\);

-- Location: IOOBUF_X69_Y73_N16
\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDR~2_combout\,
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

-- Location: IOOBUF_X94_Y73_N2
\LEDR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDR~2_combout\,
	devoe => ww_devoe,
	o => \LEDR[1]~output_o\);

-- Location: IOOBUF_X94_Y73_N9
\LEDR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDR~2_combout\,
	devoe => ww_devoe,
	o => \LEDR[2]~output_o\);

-- Location: IOOBUF_X107_Y73_N16
\LEDR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDR~2_combout\,
	devoe => ww_devoe,
	o => \LEDR[3]~output_o\);

-- Location: IOOBUF_X87_Y73_N16
\LEDR[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDR~2_combout\,
	devoe => ww_devoe,
	o => \LEDR[4]~output_o\);

-- Location: IOOBUF_X87_Y73_N9
\LEDR[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDR~2_combout\,
	devoe => ww_devoe,
	o => \LEDR[5]~output_o\);

-- Location: IOOBUF_X72_Y73_N9
\LEDR[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDR~2_combout\,
	devoe => ww_devoe,
	o => \LEDR[6]~output_o\);

-- Location: IOOBUF_X72_Y73_N2
\LEDR[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDR~2_combout\,
	devoe => ww_devoe,
	o => \LEDR[7]~output_o\);

-- Location: IOOBUF_X107_Y73_N9
\LEDG[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDG~1_combout\,
	devoe => ww_devoe,
	o => \LEDG[0]~output_o\);

-- Location: IOOBUF_X111_Y73_N9
\LEDG[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDG~1_combout\,
	devoe => ww_devoe,
	o => \LEDG[1]~output_o\);

-- Location: IOOBUF_X83_Y73_N2
\LEDG[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDG~1_combout\,
	devoe => ww_devoe,
	o => \LEDG[2]~output_o\);

-- Location: IOOBUF_X85_Y73_N23
\LEDG[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDG~1_combout\,
	devoe => ww_devoe,
	o => \LEDG[3]~output_o\);

-- Location: IOIBUF_X115_Y14_N1
\SW[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: IOIBUF_X115_Y17_N1
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: LCCOMB_X114_Y69_N24
\decoder|HEX_N[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \decoder|HEX_N[0]~0_combout\ = \SW[1]~input_o\ $ (\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[1]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \decoder|HEX_N[0]~0_combout\);

-- Location: LCCOMB_X114_Y69_N2
\decoder|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \decoder|Equal1~0_combout\ = (!\SW[1]~input_o\ & \SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[1]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \decoder|Equal1~0_combout\);

-- Location: LCCOMB_X114_Y69_N20
\LEDR~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LEDR~0_combout\ = (\SW[1]~input_o\ & \SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[1]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \LEDR~0_combout\);

-- Location: LCCOMB_X114_Y69_N10
\decoder|Equal3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \decoder|Equal3~0_combout\ = (\SW[1]~input_o\) # (\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[1]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \decoder|Equal3~0_combout\);

-- Location: IOIBUF_X0_Y36_N15
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G4
\CLOCK_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: LCCOMB_X109_Y70_N8
\clock_gen|gen_2hz|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~0_combout\ = \clock_gen|gen_2hz|s_cnt\(0) $ (VCC)
-- \clock_gen|gen_2hz|Add0~1\ = CARRY(\clock_gen|gen_2hz|s_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_2hz|s_cnt\(0),
	datad => VCC,
	combout => \clock_gen|gen_2hz|Add0~0_combout\,
	cout => \clock_gen|gen_2hz|Add0~1\);

-- Location: FF_X109_Y70_N9
\clock_gen|gen_2hz|s_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(0));

-- Location: LCCOMB_X109_Y70_N10
\clock_gen|gen_2hz|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~2_combout\ = (\clock_gen|gen_2hz|s_cnt\(1) & (!\clock_gen|gen_2hz|Add0~1\)) # (!\clock_gen|gen_2hz|s_cnt\(1) & ((\clock_gen|gen_2hz|Add0~1\) # (GND)))
-- \clock_gen|gen_2hz|Add0~3\ = CARRY((!\clock_gen|gen_2hz|Add0~1\) # (!\clock_gen|gen_2hz|s_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|s_cnt\(1),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~1\,
	combout => \clock_gen|gen_2hz|Add0~2_combout\,
	cout => \clock_gen|gen_2hz|Add0~3\);

-- Location: FF_X109_Y70_N11
\clock_gen|gen_2hz|s_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(1));

-- Location: LCCOMB_X109_Y70_N12
\clock_gen|gen_2hz|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~4_combout\ = (\clock_gen|gen_2hz|s_cnt\(2) & (\clock_gen|gen_2hz|Add0~3\ $ (GND))) # (!\clock_gen|gen_2hz|s_cnt\(2) & (!\clock_gen|gen_2hz|Add0~3\ & VCC))
-- \clock_gen|gen_2hz|Add0~5\ = CARRY((\clock_gen|gen_2hz|s_cnt\(2) & !\clock_gen|gen_2hz|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|s_cnt\(2),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~3\,
	combout => \clock_gen|gen_2hz|Add0~4_combout\,
	cout => \clock_gen|gen_2hz|Add0~5\);

-- Location: FF_X109_Y70_N13
\clock_gen|gen_2hz|s_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(2));

-- Location: LCCOMB_X109_Y70_N14
\clock_gen|gen_2hz|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~6_combout\ = (\clock_gen|gen_2hz|s_cnt\(3) & (!\clock_gen|gen_2hz|Add0~5\)) # (!\clock_gen|gen_2hz|s_cnt\(3) & ((\clock_gen|gen_2hz|Add0~5\) # (GND)))
-- \clock_gen|gen_2hz|Add0~7\ = CARRY((!\clock_gen|gen_2hz|Add0~5\) # (!\clock_gen|gen_2hz|s_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_2hz|s_cnt\(3),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~5\,
	combout => \clock_gen|gen_2hz|Add0~6_combout\,
	cout => \clock_gen|gen_2hz|Add0~7\);

-- Location: FF_X109_Y70_N15
\clock_gen|gen_2hz|s_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(3));

-- Location: LCCOMB_X109_Y70_N16
\clock_gen|gen_2hz|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~8_combout\ = (\clock_gen|gen_2hz|s_cnt\(4) & (\clock_gen|gen_2hz|Add0~7\ $ (GND))) # (!\clock_gen|gen_2hz|s_cnt\(4) & (!\clock_gen|gen_2hz|Add0~7\ & VCC))
-- \clock_gen|gen_2hz|Add0~9\ = CARRY((\clock_gen|gen_2hz|s_cnt\(4) & !\clock_gen|gen_2hz|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_2hz|s_cnt\(4),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~7\,
	combout => \clock_gen|gen_2hz|Add0~8_combout\,
	cout => \clock_gen|gen_2hz|Add0~9\);

-- Location: FF_X109_Y70_N17
\clock_gen|gen_2hz|s_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(4));

-- Location: LCCOMB_X109_Y70_N18
\clock_gen|gen_2hz|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~10_combout\ = (\clock_gen|gen_2hz|s_cnt\(5) & (!\clock_gen|gen_2hz|Add0~9\)) # (!\clock_gen|gen_2hz|s_cnt\(5) & ((\clock_gen|gen_2hz|Add0~9\) # (GND)))
-- \clock_gen|gen_2hz|Add0~11\ = CARRY((!\clock_gen|gen_2hz|Add0~9\) # (!\clock_gen|gen_2hz|s_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_2hz|s_cnt\(5),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~9\,
	combout => \clock_gen|gen_2hz|Add0~10_combout\,
	cout => \clock_gen|gen_2hz|Add0~11\);

-- Location: LCCOMB_X110_Y69_N14
\clock_gen|gen_2hz|s_cnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|s_cnt~5_combout\ = (\clock_gen|gen_2hz|Add0~10_combout\ & !\clock_gen|gen_2hz|Equal0~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clock_gen|gen_2hz|Add0~10_combout\,
	datad => \clock_gen|gen_2hz|Equal0~7_combout\,
	combout => \clock_gen|gen_2hz|s_cnt~5_combout\);

-- Location: FF_X110_Y69_N15
\clock_gen|gen_2hz|s_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|s_cnt~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(5));

-- Location: LCCOMB_X109_Y70_N20
\clock_gen|gen_2hz|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~12_combout\ = (\clock_gen|gen_2hz|s_cnt\(6) & (\clock_gen|gen_2hz|Add0~11\ $ (GND))) # (!\clock_gen|gen_2hz|s_cnt\(6) & (!\clock_gen|gen_2hz|Add0~11\ & VCC))
-- \clock_gen|gen_2hz|Add0~13\ = CARRY((\clock_gen|gen_2hz|s_cnt\(6) & !\clock_gen|gen_2hz|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_2hz|s_cnt\(6),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~11\,
	combout => \clock_gen|gen_2hz|Add0~12_combout\,
	cout => \clock_gen|gen_2hz|Add0~13\);

-- Location: FF_X109_Y70_N21
\clock_gen|gen_2hz|s_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(6));

-- Location: LCCOMB_X109_Y70_N22
\clock_gen|gen_2hz|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~14_combout\ = (\clock_gen|gen_2hz|s_cnt\(7) & (!\clock_gen|gen_2hz|Add0~13\)) # (!\clock_gen|gen_2hz|s_cnt\(7) & ((\clock_gen|gen_2hz|Add0~13\) # (GND)))
-- \clock_gen|gen_2hz|Add0~15\ = CARRY((!\clock_gen|gen_2hz|Add0~13\) # (!\clock_gen|gen_2hz|s_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|s_cnt\(7),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~13\,
	combout => \clock_gen|gen_2hz|Add0~14_combout\,
	cout => \clock_gen|gen_2hz|Add0~15\);

-- Location: FF_X109_Y70_N23
\clock_gen|gen_2hz|s_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|Add0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(7));

-- Location: LCCOMB_X109_Y70_N24
\clock_gen|gen_2hz|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~16_combout\ = (\clock_gen|gen_2hz|s_cnt\(8) & (\clock_gen|gen_2hz|Add0~15\ $ (GND))) # (!\clock_gen|gen_2hz|s_cnt\(8) & (!\clock_gen|gen_2hz|Add0~15\ & VCC))
-- \clock_gen|gen_2hz|Add0~17\ = CARRY((\clock_gen|gen_2hz|s_cnt\(8) & !\clock_gen|gen_2hz|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_2hz|s_cnt\(8),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~15\,
	combout => \clock_gen|gen_2hz|Add0~16_combout\,
	cout => \clock_gen|gen_2hz|Add0~17\);

-- Location: FF_X109_Y70_N25
\clock_gen|gen_2hz|s_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|Add0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(8));

-- Location: LCCOMB_X109_Y70_N26
\clock_gen|gen_2hz|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~18_combout\ = (\clock_gen|gen_2hz|s_cnt\(9) & (!\clock_gen|gen_2hz|Add0~17\)) # (!\clock_gen|gen_2hz|s_cnt\(9) & ((\clock_gen|gen_2hz|Add0~17\) # (GND)))
-- \clock_gen|gen_2hz|Add0~19\ = CARRY((!\clock_gen|gen_2hz|Add0~17\) # (!\clock_gen|gen_2hz|s_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|s_cnt\(9),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~17\,
	combout => \clock_gen|gen_2hz|Add0~18_combout\,
	cout => \clock_gen|gen_2hz|Add0~19\);

-- Location: FF_X109_Y70_N27
\clock_gen|gen_2hz|s_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(9));

-- Location: LCCOMB_X109_Y70_N28
\clock_gen|gen_2hz|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~20_combout\ = (\clock_gen|gen_2hz|s_cnt\(10) & (\clock_gen|gen_2hz|Add0~19\ $ (GND))) # (!\clock_gen|gen_2hz|s_cnt\(10) & (!\clock_gen|gen_2hz|Add0~19\ & VCC))
-- \clock_gen|gen_2hz|Add0~21\ = CARRY((\clock_gen|gen_2hz|s_cnt\(10) & !\clock_gen|gen_2hz|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_2hz|s_cnt\(10),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~19\,
	combout => \clock_gen|gen_2hz|Add0~20_combout\,
	cout => \clock_gen|gen_2hz|Add0~21\);

-- Location: LCCOMB_X109_Y70_N2
\clock_gen|gen_2hz|s_cnt~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|s_cnt~4_combout\ = (!\clock_gen|gen_2hz|Equal0~7_combout\ & \clock_gen|gen_2hz|Add0~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clock_gen|gen_2hz|Equal0~7_combout\,
	datad => \clock_gen|gen_2hz|Add0~20_combout\,
	combout => \clock_gen|gen_2hz|s_cnt~4_combout\);

-- Location: FF_X109_Y70_N3
\clock_gen|gen_2hz|s_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|s_cnt~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(10));

-- Location: LCCOMB_X109_Y70_N30
\clock_gen|gen_2hz|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~22_combout\ = (\clock_gen|gen_2hz|s_cnt\(11) & (!\clock_gen|gen_2hz|Add0~21\)) # (!\clock_gen|gen_2hz|s_cnt\(11) & ((\clock_gen|gen_2hz|Add0~21\) # (GND)))
-- \clock_gen|gen_2hz|Add0~23\ = CARRY((!\clock_gen|gen_2hz|Add0~21\) # (!\clock_gen|gen_2hz|s_cnt\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|s_cnt\(11),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~21\,
	combout => \clock_gen|gen_2hz|Add0~22_combout\,
	cout => \clock_gen|gen_2hz|Add0~23\);

-- Location: LCCOMB_X110_Y69_N0
\clock_gen|gen_2hz|s_cnt~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|s_cnt~3_combout\ = (!\clock_gen|gen_2hz|Equal0~7_combout\ & \clock_gen|gen_2hz|Add0~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|Equal0~7_combout\,
	datad => \clock_gen|gen_2hz|Add0~22_combout\,
	combout => \clock_gen|gen_2hz|s_cnt~3_combout\);

-- Location: FF_X110_Y69_N1
\clock_gen|gen_2hz|s_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|s_cnt~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(11));

-- Location: LCCOMB_X109_Y69_N0
\clock_gen|gen_2hz|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~24_combout\ = (\clock_gen|gen_2hz|s_cnt\(12) & (\clock_gen|gen_2hz|Add0~23\ $ (GND))) # (!\clock_gen|gen_2hz|s_cnt\(12) & (!\clock_gen|gen_2hz|Add0~23\ & VCC))
-- \clock_gen|gen_2hz|Add0~25\ = CARRY((\clock_gen|gen_2hz|s_cnt\(12) & !\clock_gen|gen_2hz|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_2hz|s_cnt\(12),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~23\,
	combout => \clock_gen|gen_2hz|Add0~24_combout\,
	cout => \clock_gen|gen_2hz|Add0~25\);

-- Location: LCCOMB_X109_Y69_N28
\clock_gen|gen_2hz|s_cnt~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|s_cnt~2_combout\ = (\clock_gen|gen_2hz|Add0~24_combout\ & !\clock_gen|gen_2hz|Equal0~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_2hz|Add0~24_combout\,
	datad => \clock_gen|gen_2hz|Equal0~7_combout\,
	combout => \clock_gen|gen_2hz|s_cnt~2_combout\);

-- Location: FF_X109_Y69_N29
\clock_gen|gen_2hz|s_cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|s_cnt~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(12));

-- Location: LCCOMB_X109_Y69_N2
\clock_gen|gen_2hz|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~26_combout\ = (\clock_gen|gen_2hz|s_cnt\(13) & (!\clock_gen|gen_2hz|Add0~25\)) # (!\clock_gen|gen_2hz|s_cnt\(13) & ((\clock_gen|gen_2hz|Add0~25\) # (GND)))
-- \clock_gen|gen_2hz|Add0~27\ = CARRY((!\clock_gen|gen_2hz|Add0~25\) # (!\clock_gen|gen_2hz|s_cnt\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|s_cnt\(13),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~25\,
	combout => \clock_gen|gen_2hz|Add0~26_combout\,
	cout => \clock_gen|gen_2hz|Add0~27\);

-- Location: LCCOMB_X109_Y69_N26
\clock_gen|gen_2hz|s_cnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|s_cnt~1_combout\ = (\clock_gen|gen_2hz|Add0~26_combout\ & !\clock_gen|gen_2hz|Equal0~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_2hz|Add0~26_combout\,
	datad => \clock_gen|gen_2hz|Equal0~7_combout\,
	combout => \clock_gen|gen_2hz|s_cnt~1_combout\);

-- Location: FF_X109_Y69_N27
\clock_gen|gen_2hz|s_cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|s_cnt~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(13));

-- Location: LCCOMB_X109_Y69_N4
\clock_gen|gen_2hz|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~28_combout\ = (\clock_gen|gen_2hz|s_cnt\(14) & (\clock_gen|gen_2hz|Add0~27\ $ (GND))) # (!\clock_gen|gen_2hz|s_cnt\(14) & (!\clock_gen|gen_2hz|Add0~27\ & VCC))
-- \clock_gen|gen_2hz|Add0~29\ = CARRY((\clock_gen|gen_2hz|s_cnt\(14) & !\clock_gen|gen_2hz|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_2hz|s_cnt\(14),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~27\,
	combout => \clock_gen|gen_2hz|Add0~28_combout\,
	cout => \clock_gen|gen_2hz|Add0~29\);

-- Location: FF_X109_Y69_N5
\clock_gen|gen_2hz|s_cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|Add0~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(14));

-- Location: LCCOMB_X109_Y69_N6
\clock_gen|gen_2hz|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~30_combout\ = (\clock_gen|gen_2hz|s_cnt\(15) & (!\clock_gen|gen_2hz|Add0~29\)) # (!\clock_gen|gen_2hz|s_cnt\(15) & ((\clock_gen|gen_2hz|Add0~29\) # (GND)))
-- \clock_gen|gen_2hz|Add0~31\ = CARRY((!\clock_gen|gen_2hz|Add0~29\) # (!\clock_gen|gen_2hz|s_cnt\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_2hz|s_cnt\(15),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~29\,
	combout => \clock_gen|gen_2hz|Add0~30_combout\,
	cout => \clock_gen|gen_2hz|Add0~31\);

-- Location: LCCOMB_X109_Y69_N24
\clock_gen|gen_2hz|s_cnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|s_cnt~0_combout\ = (!\clock_gen|gen_2hz|Equal0~7_combout\ & \clock_gen|gen_2hz|Add0~30_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|Equal0~7_combout\,
	datad => \clock_gen|gen_2hz|Add0~30_combout\,
	combout => \clock_gen|gen_2hz|s_cnt~0_combout\);

-- Location: FF_X109_Y69_N25
\clock_gen|gen_2hz|s_cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|s_cnt~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(15));

-- Location: LCCOMB_X109_Y69_N8
\clock_gen|gen_2hz|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~32_combout\ = (\clock_gen|gen_2hz|s_cnt\(16) & (\clock_gen|gen_2hz|Add0~31\ $ (GND))) # (!\clock_gen|gen_2hz|s_cnt\(16) & (!\clock_gen|gen_2hz|Add0~31\ & VCC))
-- \clock_gen|gen_2hz|Add0~33\ = CARRY((\clock_gen|gen_2hz|s_cnt\(16) & !\clock_gen|gen_2hz|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_2hz|s_cnt\(16),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~31\,
	combout => \clock_gen|gen_2hz|Add0~32_combout\,
	cout => \clock_gen|gen_2hz|Add0~33\);

-- Location: FF_X109_Y69_N9
\clock_gen|gen_2hz|s_cnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|Add0~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(16));

-- Location: LCCOMB_X109_Y69_N10
\clock_gen|gen_2hz|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~34_combout\ = (\clock_gen|gen_2hz|s_cnt\(17) & (!\clock_gen|gen_2hz|Add0~33\)) # (!\clock_gen|gen_2hz|s_cnt\(17) & ((\clock_gen|gen_2hz|Add0~33\) # (GND)))
-- \clock_gen|gen_2hz|Add0~35\ = CARRY((!\clock_gen|gen_2hz|Add0~33\) # (!\clock_gen|gen_2hz|s_cnt\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_2hz|s_cnt\(17),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~33\,
	combout => \clock_gen|gen_2hz|Add0~34_combout\,
	cout => \clock_gen|gen_2hz|Add0~35\);

-- Location: LCCOMB_X110_Y69_N22
\clock_gen|gen_2hz|s_cnt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|s_cnt~6_combout\ = (!\clock_gen|gen_2hz|Equal0~7_combout\ & \clock_gen|gen_2hz|Add0~34_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|Equal0~7_combout\,
	datad => \clock_gen|gen_2hz|Add0~34_combout\,
	combout => \clock_gen|gen_2hz|s_cnt~6_combout\);

-- Location: FF_X110_Y69_N23
\clock_gen|gen_2hz|s_cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|s_cnt~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(17));

-- Location: LCCOMB_X109_Y69_N12
\clock_gen|gen_2hz|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~36_combout\ = (\clock_gen|gen_2hz|s_cnt\(18) & (\clock_gen|gen_2hz|Add0~35\ $ (GND))) # (!\clock_gen|gen_2hz|s_cnt\(18) & (!\clock_gen|gen_2hz|Add0~35\ & VCC))
-- \clock_gen|gen_2hz|Add0~37\ = CARRY((\clock_gen|gen_2hz|s_cnt\(18) & !\clock_gen|gen_2hz|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_2hz|s_cnt\(18),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~35\,
	combout => \clock_gen|gen_2hz|Add0~36_combout\,
	cout => \clock_gen|gen_2hz|Add0~37\);

-- Location: LCCOMB_X110_Y69_N28
\clock_gen|gen_2hz|s_cnt~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|s_cnt~7_combout\ = (!\clock_gen|gen_2hz|Equal0~7_combout\ & \clock_gen|gen_2hz|Add0~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|Equal0~7_combout\,
	datad => \clock_gen|gen_2hz|Add0~36_combout\,
	combout => \clock_gen|gen_2hz|s_cnt~7_combout\);

-- Location: FF_X110_Y69_N29
\clock_gen|gen_2hz|s_cnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|s_cnt~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(18));

-- Location: LCCOMB_X109_Y69_N14
\clock_gen|gen_2hz|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~38_combout\ = (\clock_gen|gen_2hz|s_cnt\(19) & (!\clock_gen|gen_2hz|Add0~37\)) # (!\clock_gen|gen_2hz|s_cnt\(19) & ((\clock_gen|gen_2hz|Add0~37\) # (GND)))
-- \clock_gen|gen_2hz|Add0~39\ = CARRY((!\clock_gen|gen_2hz|Add0~37\) # (!\clock_gen|gen_2hz|s_cnt\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|s_cnt\(19),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~37\,
	combout => \clock_gen|gen_2hz|Add0~38_combout\,
	cout => \clock_gen|gen_2hz|Add0~39\);

-- Location: LCCOMB_X110_Y69_N30
\clock_gen|gen_2hz|s_cnt~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|s_cnt~8_combout\ = (!\clock_gen|gen_2hz|Equal0~7_combout\ & \clock_gen|gen_2hz|Add0~38_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|Equal0~7_combout\,
	datad => \clock_gen|gen_2hz|Add0~38_combout\,
	combout => \clock_gen|gen_2hz|s_cnt~8_combout\);

-- Location: FF_X110_Y69_N31
\clock_gen|gen_2hz|s_cnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|s_cnt~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(19));

-- Location: LCCOMB_X109_Y69_N16
\clock_gen|gen_2hz|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~40_combout\ = (\clock_gen|gen_2hz|s_cnt\(20) & (\clock_gen|gen_2hz|Add0~39\ $ (GND))) # (!\clock_gen|gen_2hz|s_cnt\(20) & (!\clock_gen|gen_2hz|Add0~39\ & VCC))
-- \clock_gen|gen_2hz|Add0~41\ = CARRY((\clock_gen|gen_2hz|s_cnt\(20) & !\clock_gen|gen_2hz|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|s_cnt\(20),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~39\,
	combout => \clock_gen|gen_2hz|Add0~40_combout\,
	cout => \clock_gen|gen_2hz|Add0~41\);

-- Location: LCCOMB_X110_Y69_N4
\clock_gen|gen_2hz|s_cnt~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|s_cnt~9_combout\ = (\clock_gen|gen_2hz|Add0~40_combout\ & !\clock_gen|gen_2hz|Equal0~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clock_gen|gen_2hz|Add0~40_combout\,
	datad => \clock_gen|gen_2hz|Equal0~7_combout\,
	combout => \clock_gen|gen_2hz|s_cnt~9_combout\);

-- Location: FF_X110_Y69_N5
\clock_gen|gen_2hz|s_cnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|s_cnt~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(20));

-- Location: LCCOMB_X110_Y69_N10
\clock_gen|gen_2hz|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Equal0~5_combout\ = (\clock_gen|gen_2hz|s_cnt\(17) & (\clock_gen|gen_2hz|s_cnt\(18) & (\clock_gen|gen_2hz|s_cnt\(20) & \clock_gen|gen_2hz|s_cnt\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|s_cnt\(17),
	datab => \clock_gen|gen_2hz|s_cnt\(18),
	datac => \clock_gen|gen_2hz|s_cnt\(20),
	datad => \clock_gen|gen_2hz|s_cnt\(19),
	combout => \clock_gen|gen_2hz|Equal0~5_combout\);

-- Location: LCCOMB_X110_Y69_N24
\clock_gen|gen_2hz|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Equal0~4_combout\ = (!\clock_gen|gen_2hz|s_cnt\(7) & (!\clock_gen|gen_2hz|s_cnt\(5) & (!\clock_gen|gen_2hz|s_cnt\(6) & !\clock_gen|gen_2hz|s_cnt\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|s_cnt\(7),
	datab => \clock_gen|gen_2hz|s_cnt\(5),
	datac => \clock_gen|gen_2hz|s_cnt\(6),
	datad => \clock_gen|gen_2hz|s_cnt\(16),
	combout => \clock_gen|gen_2hz|Equal0~4_combout\);

-- Location: LCCOMB_X109_Y69_N18
\clock_gen|gen_2hz|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~42_combout\ = (\clock_gen|gen_2hz|s_cnt\(21) & (!\clock_gen|gen_2hz|Add0~41\)) # (!\clock_gen|gen_2hz|s_cnt\(21) & ((\clock_gen|gen_2hz|Add0~41\) # (GND)))
-- \clock_gen|gen_2hz|Add0~43\ = CARRY((!\clock_gen|gen_2hz|Add0~41\) # (!\clock_gen|gen_2hz|s_cnt\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|s_cnt\(21),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~41\,
	combout => \clock_gen|gen_2hz|Add0~42_combout\,
	cout => \clock_gen|gen_2hz|Add0~43\);

-- Location: LCCOMB_X110_Y69_N20
\clock_gen|gen_2hz|s_cnt~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|s_cnt~10_combout\ = (!\clock_gen|gen_2hz|Equal0~7_combout\ & \clock_gen|gen_2hz|Add0~42_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|Equal0~7_combout\,
	datad => \clock_gen|gen_2hz|Add0~42_combout\,
	combout => \clock_gen|gen_2hz|s_cnt~10_combout\);

-- Location: FF_X110_Y69_N21
\clock_gen|gen_2hz|s_cnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|s_cnt~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(21));

-- Location: LCCOMB_X109_Y69_N20
\clock_gen|gen_2hz|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~44_combout\ = (\clock_gen|gen_2hz|s_cnt\(22) & (\clock_gen|gen_2hz|Add0~43\ $ (GND))) # (!\clock_gen|gen_2hz|s_cnt\(22) & (!\clock_gen|gen_2hz|Add0~43\ & VCC))
-- \clock_gen|gen_2hz|Add0~45\ = CARRY((\clock_gen|gen_2hz|s_cnt\(22) & !\clock_gen|gen_2hz|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_2hz|s_cnt\(22),
	datad => VCC,
	cin => \clock_gen|gen_2hz|Add0~43\,
	combout => \clock_gen|gen_2hz|Add0~44_combout\,
	cout => \clock_gen|gen_2hz|Add0~45\);

-- Location: FF_X109_Y69_N21
\clock_gen|gen_2hz|s_cnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|Add0~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(22));

-- Location: LCCOMB_X109_Y69_N22
\clock_gen|gen_2hz|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Add0~46_combout\ = \clock_gen|gen_2hz|Add0~45\ $ (\clock_gen|gen_2hz|s_cnt\(23))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \clock_gen|gen_2hz|s_cnt\(23),
	cin => \clock_gen|gen_2hz|Add0~45\,
	combout => \clock_gen|gen_2hz|Add0~46_combout\);

-- Location: LCCOMB_X110_Y69_N26
\clock_gen|gen_2hz|s_cnt~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|s_cnt~11_combout\ = (!\clock_gen|gen_2hz|Equal0~7_combout\ & \clock_gen|gen_2hz|Add0~46_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|Equal0~7_combout\,
	datad => \clock_gen|gen_2hz|Add0~46_combout\,
	combout => \clock_gen|gen_2hz|s_cnt~11_combout\);

-- Location: FF_X110_Y69_N27
\clock_gen|gen_2hz|s_cnt[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|s_cnt~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|s_cnt\(23));

-- Location: LCCOMB_X110_Y69_N8
\clock_gen|gen_2hz|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Equal0~6_combout\ = (!\clock_gen|gen_2hz|s_cnt\(22) & (\clock_gen|gen_2hz|s_cnt\(23) & \clock_gen|gen_2hz|s_cnt\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_2hz|s_cnt\(22),
	datac => \clock_gen|gen_2hz|s_cnt\(23),
	datad => \clock_gen|gen_2hz|s_cnt\(21),
	combout => \clock_gen|gen_2hz|Equal0~6_combout\);

-- Location: LCCOMB_X109_Y70_N0
\clock_gen|gen_2hz|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Equal0~0_combout\ = (\clock_gen|gen_2hz|s_cnt\(2) & (\clock_gen|gen_2hz|s_cnt\(4) & (\clock_gen|gen_2hz|s_cnt\(3) & \clock_gen|gen_2hz|s_cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|s_cnt\(2),
	datab => \clock_gen|gen_2hz|s_cnt\(4),
	datac => \clock_gen|gen_2hz|s_cnt\(3),
	datad => \clock_gen|gen_2hz|s_cnt\(1),
	combout => \clock_gen|gen_2hz|Equal0~0_combout\);

-- Location: LCCOMB_X109_Y70_N4
\clock_gen|gen_2hz|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Equal0~2_combout\ = (!\clock_gen|gen_2hz|s_cnt\(9) & (!\clock_gen|gen_2hz|s_cnt\(8) & (\clock_gen|gen_2hz|s_cnt\(11) & \clock_gen|gen_2hz|s_cnt\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|s_cnt\(9),
	datab => \clock_gen|gen_2hz|s_cnt\(8),
	datac => \clock_gen|gen_2hz|s_cnt\(11),
	datad => \clock_gen|gen_2hz|s_cnt\(10),
	combout => \clock_gen|gen_2hz|Equal0~2_combout\);

-- Location: LCCOMB_X109_Y69_N30
\clock_gen|gen_2hz|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Equal0~1_combout\ = (\clock_gen|gen_2hz|s_cnt\(13) & (\clock_gen|gen_2hz|s_cnt\(12) & (!\clock_gen|gen_2hz|s_cnt\(14) & \clock_gen|gen_2hz|s_cnt\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|s_cnt\(13),
	datab => \clock_gen|gen_2hz|s_cnt\(12),
	datac => \clock_gen|gen_2hz|s_cnt\(14),
	datad => \clock_gen|gen_2hz|s_cnt\(15),
	combout => \clock_gen|gen_2hz|Equal0~1_combout\);

-- Location: LCCOMB_X109_Y70_N6
\clock_gen|gen_2hz|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Equal0~3_combout\ = (\clock_gen|gen_2hz|s_cnt\(0) & (\clock_gen|gen_2hz|Equal0~0_combout\ & (\clock_gen|gen_2hz|Equal0~2_combout\ & \clock_gen|gen_2hz|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|s_cnt\(0),
	datab => \clock_gen|gen_2hz|Equal0~0_combout\,
	datac => \clock_gen|gen_2hz|Equal0~2_combout\,
	datad => \clock_gen|gen_2hz|Equal0~1_combout\,
	combout => \clock_gen|gen_2hz|Equal0~3_combout\);

-- Location: LCCOMB_X110_Y69_N6
\clock_gen|gen_2hz|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_2hz|Equal0~7_combout\ = (\clock_gen|gen_2hz|Equal0~5_combout\ & (\clock_gen|gen_2hz|Equal0~4_combout\ & (\clock_gen|gen_2hz|Equal0~6_combout\ & \clock_gen|gen_2hz|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|Equal0~5_combout\,
	datab => \clock_gen|gen_2hz|Equal0~4_combout\,
	datac => \clock_gen|gen_2hz|Equal0~6_combout\,
	datad => \clock_gen|gen_2hz|Equal0~3_combout\,
	combout => \clock_gen|gen_2hz|Equal0~7_combout\);

-- Location: FF_X110_Y69_N7
\clock_gen|gen_2hz|pulse\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_2hz|Equal0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_2hz|pulse~q\);

-- Location: LCCOMB_X108_Y70_N4
\clock_gen|gen_6s|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~1_cout\ = CARRY((\clock_gen|gen_2hz|s_cnt\(0) & \clock_gen|gen_2hz|s_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|s_cnt\(0),
	datab => \clock_gen|gen_2hz|s_cnt\(1),
	datad => VCC,
	cout => \clock_gen|gen_6s|Add0~1_cout\);

-- Location: LCCOMB_X108_Y70_N6
\clock_gen|gen_6s|Add0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~3_cout\ = CARRY((!\clock_gen|gen_6s|Add0~1_cout\) # (!\clock_gen|gen_2hz|s_cnt\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_2hz|s_cnt\(2),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~1_cout\,
	cout => \clock_gen|gen_6s|Add0~3_cout\);

-- Location: LCCOMB_X108_Y70_N8
\clock_gen|gen_6s|Add0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~5_cout\ = CARRY((\clock_gen|gen_2hz|s_cnt\(3) & !\clock_gen|gen_6s|Add0~3_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_2hz|s_cnt\(3),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~3_cout\,
	cout => \clock_gen|gen_6s|Add0~5_cout\);

-- Location: LCCOMB_X108_Y70_N10
\clock_gen|gen_6s|Add0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~7_cout\ = CARRY((!\clock_gen|gen_6s|Add0~5_cout\) # (!\clock_gen|gen_2hz|s_cnt\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_2hz|s_cnt\(4),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~5_cout\,
	cout => \clock_gen|gen_6s|Add0~7_cout\);

-- Location: LCCOMB_X108_Y70_N12
\clock_gen|gen_6s|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~8_combout\ = (\clock_gen|gen_6s|s_cnt\(5) & (\clock_gen|gen_6s|Add0~7_cout\ $ (GND))) # (!\clock_gen|gen_6s|s_cnt\(5) & (!\clock_gen|gen_6s|Add0~7_cout\ & VCC))
-- \clock_gen|gen_6s|Add0~9\ = CARRY((\clock_gen|gen_6s|s_cnt\(5) & !\clock_gen|gen_6s|Add0~7_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|s_cnt\(5),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~7_cout\,
	combout => \clock_gen|gen_6s|Add0~8_combout\,
	cout => \clock_gen|gen_6s|Add0~9\);

-- Location: FF_X108_Y70_N13
\clock_gen|gen_6s|s_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(5));

-- Location: LCCOMB_X108_Y70_N14
\clock_gen|gen_6s|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~10_combout\ = (\clock_gen|gen_6s|s_cnt\(6) & (!\clock_gen|gen_6s|Add0~9\)) # (!\clock_gen|gen_6s|s_cnt\(6) & ((\clock_gen|gen_6s|Add0~9\) # (GND)))
-- \clock_gen|gen_6s|Add0~11\ = CARRY((!\clock_gen|gen_6s|Add0~9\) # (!\clock_gen|gen_6s|s_cnt\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_6s|s_cnt\(6),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~9\,
	combout => \clock_gen|gen_6s|Add0~10_combout\,
	cout => \clock_gen|gen_6s|Add0~11\);

-- Location: FF_X108_Y70_N15
\clock_gen|gen_6s|s_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(6));

-- Location: LCCOMB_X108_Y70_N16
\clock_gen|gen_6s|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~12_combout\ = (\clock_gen|gen_6s|s_cnt\(7) & (\clock_gen|gen_6s|Add0~11\ $ (GND))) # (!\clock_gen|gen_6s|s_cnt\(7) & (!\clock_gen|gen_6s|Add0~11\ & VCC))
-- \clock_gen|gen_6s|Add0~13\ = CARRY((\clock_gen|gen_6s|s_cnt\(7) & !\clock_gen|gen_6s|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_6s|s_cnt\(7),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~11\,
	combout => \clock_gen|gen_6s|Add0~12_combout\,
	cout => \clock_gen|gen_6s|Add0~13\);

-- Location: FF_X108_Y70_N17
\clock_gen|gen_6s|s_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(7));

-- Location: LCCOMB_X108_Y70_N18
\clock_gen|gen_6s|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~14_combout\ = (\clock_gen|gen_6s|s_cnt\(8) & (!\clock_gen|gen_6s|Add0~13\)) # (!\clock_gen|gen_6s|s_cnt\(8) & ((\clock_gen|gen_6s|Add0~13\) # (GND)))
-- \clock_gen|gen_6s|Add0~15\ = CARRY((!\clock_gen|gen_6s|Add0~13\) # (!\clock_gen|gen_6s|s_cnt\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|s_cnt\(8),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~13\,
	combout => \clock_gen|gen_6s|Add0~14_combout\,
	cout => \clock_gen|gen_6s|Add0~15\);

-- Location: LCCOMB_X107_Y69_N0
\clock_gen|gen_6s|s_cnt~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|s_cnt~13_combout\ = (\clock_gen|gen_6s|Add0~14_combout\ & (((!\clock_gen|gen_6s|Equal0~7_combout\) # (!\clock_gen|gen_6s|Equal0~2_combout\)) # (!\clock_gen|gen_6s|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|Add0~14_combout\,
	datab => \clock_gen|gen_6s|Equal0~1_combout\,
	datac => \clock_gen|gen_6s|Equal0~2_combout\,
	datad => \clock_gen|gen_6s|Equal0~7_combout\,
	combout => \clock_gen|gen_6s|s_cnt~13_combout\);

-- Location: FF_X107_Y69_N1
\clock_gen|gen_6s|s_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|s_cnt~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(8));

-- Location: LCCOMB_X108_Y70_N20
\clock_gen|gen_6s|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~16_combout\ = (\clock_gen|gen_6s|s_cnt\(9) & (\clock_gen|gen_6s|Add0~15\ $ (GND))) # (!\clock_gen|gen_6s|s_cnt\(9) & (!\clock_gen|gen_6s|Add0~15\ & VCC))
-- \clock_gen|gen_6s|Add0~17\ = CARRY((\clock_gen|gen_6s|s_cnt\(9) & !\clock_gen|gen_6s|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_6s|s_cnt\(9),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~15\,
	combout => \clock_gen|gen_6s|Add0~16_combout\,
	cout => \clock_gen|gen_6s|Add0~17\);

-- Location: LCCOMB_X108_Y70_N0
\clock_gen|gen_6s|s_cnt~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|s_cnt~12_combout\ = (\clock_gen|gen_6s|Add0~16_combout\ & (((!\clock_gen|gen_6s|Equal0~7_combout\) # (!\clock_gen|gen_6s|Equal0~1_combout\)) # (!\clock_gen|gen_6s|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|Equal0~2_combout\,
	datab => \clock_gen|gen_6s|Equal0~1_combout\,
	datac => \clock_gen|gen_6s|Equal0~7_combout\,
	datad => \clock_gen|gen_6s|Add0~16_combout\,
	combout => \clock_gen|gen_6s|s_cnt~12_combout\);

-- Location: FF_X108_Y70_N1
\clock_gen|gen_6s|s_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|s_cnt~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(9));

-- Location: LCCOMB_X108_Y70_N22
\clock_gen|gen_6s|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~18_combout\ = (\clock_gen|gen_6s|s_cnt\(10) & (!\clock_gen|gen_6s|Add0~17\)) # (!\clock_gen|gen_6s|s_cnt\(10) & ((\clock_gen|gen_6s|Add0~17\) # (GND)))
-- \clock_gen|gen_6s|Add0~19\ = CARRY((!\clock_gen|gen_6s|Add0~17\) # (!\clock_gen|gen_6s|s_cnt\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|s_cnt\(10),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~17\,
	combout => \clock_gen|gen_6s|Add0~18_combout\,
	cout => \clock_gen|gen_6s|Add0~19\);

-- Location: FF_X108_Y70_N23
\clock_gen|gen_6s|s_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(10));

-- Location: LCCOMB_X108_Y70_N24
\clock_gen|gen_6s|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~20_combout\ = (\clock_gen|gen_6s|s_cnt\(11) & (\clock_gen|gen_6s|Add0~19\ $ (GND))) # (!\clock_gen|gen_6s|s_cnt\(11) & (!\clock_gen|gen_6s|Add0~19\ & VCC))
-- \clock_gen|gen_6s|Add0~21\ = CARRY((\clock_gen|gen_6s|s_cnt\(11) & !\clock_gen|gen_6s|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_6s|s_cnt\(11),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~19\,
	combout => \clock_gen|gen_6s|Add0~20_combout\,
	cout => \clock_gen|gen_6s|Add0~21\);

-- Location: FF_X108_Y70_N25
\clock_gen|gen_6s|s_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|Add0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(11));

-- Location: LCCOMB_X108_Y70_N26
\clock_gen|gen_6s|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~22_combout\ = (\clock_gen|gen_6s|s_cnt\(12) & (!\clock_gen|gen_6s|Add0~21\)) # (!\clock_gen|gen_6s|s_cnt\(12) & ((\clock_gen|gen_6s|Add0~21\) # (GND)))
-- \clock_gen|gen_6s|Add0~23\ = CARRY((!\clock_gen|gen_6s|Add0~21\) # (!\clock_gen|gen_6s|s_cnt\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|s_cnt\(12),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~21\,
	combout => \clock_gen|gen_6s|Add0~22_combout\,
	cout => \clock_gen|gen_6s|Add0~23\);

-- Location: FF_X108_Y70_N27
\clock_gen|gen_6s|s_cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|Add0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(12));

-- Location: LCCOMB_X108_Y70_N28
\clock_gen|gen_6s|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~24_combout\ = (\clock_gen|gen_6s|s_cnt\(13) & (\clock_gen|gen_6s|Add0~23\ $ (GND))) # (!\clock_gen|gen_6s|s_cnt\(13) & (!\clock_gen|gen_6s|Add0~23\ & VCC))
-- \clock_gen|gen_6s|Add0~25\ = CARRY((\clock_gen|gen_6s|s_cnt\(13) & !\clock_gen|gen_6s|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_6s|s_cnt\(13),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~23\,
	combout => \clock_gen|gen_6s|Add0~24_combout\,
	cout => \clock_gen|gen_6s|Add0~25\);

-- Location: LCCOMB_X108_Y70_N30
\clock_gen|gen_6s|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~26_combout\ = (\clock_gen|gen_6s|s_cnt\(14) & (!\clock_gen|gen_6s|Add0~25\)) # (!\clock_gen|gen_6s|s_cnt\(14) & ((\clock_gen|gen_6s|Add0~25\) # (GND)))
-- \clock_gen|gen_6s|Add0~27\ = CARRY((!\clock_gen|gen_6s|Add0~25\) # (!\clock_gen|gen_6s|s_cnt\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|s_cnt\(14),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~25\,
	combout => \clock_gen|gen_6s|Add0~26_combout\,
	cout => \clock_gen|gen_6s|Add0~27\);

-- Location: FF_X108_Y70_N31
\clock_gen|gen_6s|s_cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|Add0~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(14));

-- Location: LCCOMB_X108_Y69_N0
\clock_gen|gen_6s|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~28_combout\ = (\clock_gen|gen_6s|s_cnt\(15) & (\clock_gen|gen_6s|Add0~27\ $ (GND))) # (!\clock_gen|gen_6s|s_cnt\(15) & (!\clock_gen|gen_6s|Add0~27\ & VCC))
-- \clock_gen|gen_6s|Add0~29\ = CARRY((\clock_gen|gen_6s|s_cnt\(15) & !\clock_gen|gen_6s|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|s_cnt\(15),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~27\,
	combout => \clock_gen|gen_6s|Add0~28_combout\,
	cout => \clock_gen|gen_6s|Add0~29\);

-- Location: LCCOMB_X107_Y69_N8
\clock_gen|gen_6s|s_cnt~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|s_cnt~9_combout\ = (\clock_gen|gen_6s|Add0~28_combout\ & (((!\clock_gen|gen_6s|Equal0~1_combout\) # (!\clock_gen|gen_6s|Equal0~7_combout\)) # (!\clock_gen|gen_6s|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|Equal0~2_combout\,
	datab => \clock_gen|gen_6s|Equal0~7_combout\,
	datac => \clock_gen|gen_6s|Add0~28_combout\,
	datad => \clock_gen|gen_6s|Equal0~1_combout\,
	combout => \clock_gen|gen_6s|s_cnt~9_combout\);

-- Location: FF_X107_Y69_N9
\clock_gen|gen_6s|s_cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|s_cnt~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(15));

-- Location: LCCOMB_X108_Y69_N2
\clock_gen|gen_6s|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~30_combout\ = (\clock_gen|gen_6s|s_cnt\(16) & (!\clock_gen|gen_6s|Add0~29\)) # (!\clock_gen|gen_6s|s_cnt\(16) & ((\clock_gen|gen_6s|Add0~29\) # (GND)))
-- \clock_gen|gen_6s|Add0~31\ = CARRY((!\clock_gen|gen_6s|Add0~29\) # (!\clock_gen|gen_6s|s_cnt\(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_6s|s_cnt\(16),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~29\,
	combout => \clock_gen|gen_6s|Add0~30_combout\,
	cout => \clock_gen|gen_6s|Add0~31\);

-- Location: LCCOMB_X107_Y69_N6
\clock_gen|gen_6s|s_cnt~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|s_cnt~8_combout\ = (\clock_gen|gen_6s|Add0~30_combout\ & (((!\clock_gen|gen_6s|Equal0~2_combout\) # (!\clock_gen|gen_6s|Equal0~1_combout\)) # (!\clock_gen|gen_6s|Equal0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|Equal0~7_combout\,
	datab => \clock_gen|gen_6s|Equal0~1_combout\,
	datac => \clock_gen|gen_6s|Equal0~2_combout\,
	datad => \clock_gen|gen_6s|Add0~30_combout\,
	combout => \clock_gen|gen_6s|s_cnt~8_combout\);

-- Location: FF_X107_Y69_N7
\clock_gen|gen_6s|s_cnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|s_cnt~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(16));

-- Location: LCCOMB_X108_Y69_N4
\clock_gen|gen_6s|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~32_combout\ = (\clock_gen|gen_6s|s_cnt\(17) & (\clock_gen|gen_6s|Add0~31\ $ (GND))) # (!\clock_gen|gen_6s|s_cnt\(17) & (!\clock_gen|gen_6s|Add0~31\ & VCC))
-- \clock_gen|gen_6s|Add0~33\ = CARRY((\clock_gen|gen_6s|s_cnt\(17) & !\clock_gen|gen_6s|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_6s|s_cnt\(17),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~31\,
	combout => \clock_gen|gen_6s|Add0~32_combout\,
	cout => \clock_gen|gen_6s|Add0~33\);

-- Location: FF_X108_Y69_N5
\clock_gen|gen_6s|s_cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|Add0~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(17));

-- Location: LCCOMB_X108_Y69_N6
\clock_gen|gen_6s|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~34_combout\ = (\clock_gen|gen_6s|s_cnt\(18) & (!\clock_gen|gen_6s|Add0~33\)) # (!\clock_gen|gen_6s|s_cnt\(18) & ((\clock_gen|gen_6s|Add0~33\) # (GND)))
-- \clock_gen|gen_6s|Add0~35\ = CARRY((!\clock_gen|gen_6s|Add0~33\) # (!\clock_gen|gen_6s|s_cnt\(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|s_cnt\(18),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~33\,
	combout => \clock_gen|gen_6s|Add0~34_combout\,
	cout => \clock_gen|gen_6s|Add0~35\);

-- Location: FF_X108_Y69_N7
\clock_gen|gen_6s|s_cnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|Add0~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(18));

-- Location: LCCOMB_X108_Y69_N8
\clock_gen|gen_6s|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~36_combout\ = (\clock_gen|gen_6s|s_cnt\(19) & (\clock_gen|gen_6s|Add0~35\ $ (GND))) # (!\clock_gen|gen_6s|s_cnt\(19) & (!\clock_gen|gen_6s|Add0~35\ & VCC))
-- \clock_gen|gen_6s|Add0~37\ = CARRY((\clock_gen|gen_6s|s_cnt\(19) & !\clock_gen|gen_6s|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_6s|s_cnt\(19),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~35\,
	combout => \clock_gen|gen_6s|Add0~36_combout\,
	cout => \clock_gen|gen_6s|Add0~37\);

-- Location: FF_X108_Y69_N9
\clock_gen|gen_6s|s_cnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|Add0~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(19));

-- Location: LCCOMB_X108_Y69_N10
\clock_gen|gen_6s|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~38_combout\ = (\clock_gen|gen_6s|s_cnt\(20) & (!\clock_gen|gen_6s|Add0~37\)) # (!\clock_gen|gen_6s|s_cnt\(20) & ((\clock_gen|gen_6s|Add0~37\) # (GND)))
-- \clock_gen|gen_6s|Add0~39\ = CARRY((!\clock_gen|gen_6s|Add0~37\) # (!\clock_gen|gen_6s|s_cnt\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|s_cnt\(20),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~37\,
	combout => \clock_gen|gen_6s|Add0~38_combout\,
	cout => \clock_gen|gen_6s|Add0~39\);

-- Location: FF_X108_Y69_N11
\clock_gen|gen_6s|s_cnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|Add0~38_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(20));

-- Location: LCCOMB_X108_Y69_N12
\clock_gen|gen_6s|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~40_combout\ = (\clock_gen|gen_6s|s_cnt\(21) & (\clock_gen|gen_6s|Add0~39\ $ (GND))) # (!\clock_gen|gen_6s|s_cnt\(21) & (!\clock_gen|gen_6s|Add0~39\ & VCC))
-- \clock_gen|gen_6s|Add0~41\ = CARRY((\clock_gen|gen_6s|s_cnt\(21) & !\clock_gen|gen_6s|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_6s|s_cnt\(21),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~39\,
	combout => \clock_gen|gen_6s|Add0~40_combout\,
	cout => \clock_gen|gen_6s|Add0~41\);

-- Location: LCCOMB_X108_Y69_N28
\clock_gen|gen_6s|s_cnt~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|s_cnt~14_combout\ = (\clock_gen|gen_6s|Add0~40_combout\ & (((!\clock_gen|gen_6s|Equal0~2_combout\) # (!\clock_gen|gen_6s|Equal0~7_combout\)) # (!\clock_gen|gen_6s|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|Equal0~1_combout\,
	datab => \clock_gen|gen_6s|Equal0~7_combout\,
	datac => \clock_gen|gen_6s|Equal0~2_combout\,
	datad => \clock_gen|gen_6s|Add0~40_combout\,
	combout => \clock_gen|gen_6s|s_cnt~14_combout\);

-- Location: FF_X108_Y69_N29
\clock_gen|gen_6s|s_cnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|s_cnt~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(21));

-- Location: LCCOMB_X108_Y69_N14
\clock_gen|gen_6s|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~42_combout\ = (\clock_gen|gen_6s|s_cnt\(22) & (!\clock_gen|gen_6s|Add0~41\)) # (!\clock_gen|gen_6s|s_cnt\(22) & ((\clock_gen|gen_6s|Add0~41\) # (GND)))
-- \clock_gen|gen_6s|Add0~43\ = CARRY((!\clock_gen|gen_6s|Add0~41\) # (!\clock_gen|gen_6s|s_cnt\(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|s_cnt\(22),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~41\,
	combout => \clock_gen|gen_6s|Add0~42_combout\,
	cout => \clock_gen|gen_6s|Add0~43\);

-- Location: LCCOMB_X107_Y69_N14
\clock_gen|gen_6s|s_cnt~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|s_cnt~15_combout\ = (\clock_gen|gen_6s|Add0~42_combout\ & (((!\clock_gen|gen_6s|Equal0~1_combout\) # (!\clock_gen|gen_6s|Equal0~7_combout\)) # (!\clock_gen|gen_6s|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|Equal0~2_combout\,
	datab => \clock_gen|gen_6s|Equal0~7_combout\,
	datac => \clock_gen|gen_6s|Add0~42_combout\,
	datad => \clock_gen|gen_6s|Equal0~1_combout\,
	combout => \clock_gen|gen_6s|s_cnt~15_combout\);

-- Location: FF_X107_Y69_N15
\clock_gen|gen_6s|s_cnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|s_cnt~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(22));

-- Location: LCCOMB_X108_Y69_N16
\clock_gen|gen_6s|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~44_combout\ = (\clock_gen|gen_6s|s_cnt\(23) & (\clock_gen|gen_6s|Add0~43\ $ (GND))) # (!\clock_gen|gen_6s|s_cnt\(23) & (!\clock_gen|gen_6s|Add0~43\ & VCC))
-- \clock_gen|gen_6s|Add0~45\ = CARRY((\clock_gen|gen_6s|s_cnt\(23) & !\clock_gen|gen_6s|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|s_cnt\(23),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~43\,
	combout => \clock_gen|gen_6s|Add0~44_combout\,
	cout => \clock_gen|gen_6s|Add0~45\);

-- Location: LCCOMB_X107_Y69_N16
\clock_gen|gen_6s|s_cnt~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|s_cnt~16_combout\ = (\clock_gen|gen_6s|Add0~44_combout\ & (((!\clock_gen|gen_6s|Equal0~2_combout\) # (!\clock_gen|gen_6s|Equal0~1_combout\)) # (!\clock_gen|gen_6s|Equal0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|Equal0~7_combout\,
	datab => \clock_gen|gen_6s|Equal0~1_combout\,
	datac => \clock_gen|gen_6s|Equal0~2_combout\,
	datad => \clock_gen|gen_6s|Add0~44_combout\,
	combout => \clock_gen|gen_6s|s_cnt~16_combout\);

-- Location: FF_X107_Y69_N17
\clock_gen|gen_6s|s_cnt[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|s_cnt~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(23));

-- Location: LCCOMB_X108_Y69_N18
\clock_gen|gen_6s|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~46_combout\ = (\clock_gen|gen_6s|s_cnt\(24) & (!\clock_gen|gen_6s|Add0~45\)) # (!\clock_gen|gen_6s|s_cnt\(24) & ((\clock_gen|gen_6s|Add0~45\) # (GND)))
-- \clock_gen|gen_6s|Add0~47\ = CARRY((!\clock_gen|gen_6s|Add0~45\) # (!\clock_gen|gen_6s|s_cnt\(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|s_cnt\(24),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~45\,
	combout => \clock_gen|gen_6s|Add0~46_combout\,
	cout => \clock_gen|gen_6s|Add0~47\);

-- Location: LCCOMB_X108_Y69_N20
\clock_gen|gen_6s|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~48_combout\ = (\clock_gen|gen_6s|s_cnt\(25) & (\clock_gen|gen_6s|Add0~47\ $ (GND))) # (!\clock_gen|gen_6s|s_cnt\(25) & (!\clock_gen|gen_6s|Add0~47\ & VCC))
-- \clock_gen|gen_6s|Add0~49\ = CARRY((\clock_gen|gen_6s|s_cnt\(25) & !\clock_gen|gen_6s|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_6s|s_cnt\(25),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~47\,
	combout => \clock_gen|gen_6s|Add0~48_combout\,
	cout => \clock_gen|gen_6s|Add0~49\);

-- Location: FF_X108_Y69_N21
\clock_gen|gen_6s|s_cnt[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|Add0~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(25));

-- Location: LCCOMB_X108_Y69_N22
\clock_gen|gen_6s|Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~50_combout\ = (\clock_gen|gen_6s|s_cnt\(26) & (!\clock_gen|gen_6s|Add0~49\)) # (!\clock_gen|gen_6s|s_cnt\(26) & ((\clock_gen|gen_6s|Add0~49\) # (GND)))
-- \clock_gen|gen_6s|Add0~51\ = CARRY((!\clock_gen|gen_6s|Add0~49\) # (!\clock_gen|gen_6s|s_cnt\(26)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|s_cnt\(26),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~49\,
	combout => \clock_gen|gen_6s|Add0~50_combout\,
	cout => \clock_gen|gen_6s|Add0~51\);

-- Location: FF_X108_Y69_N23
\clock_gen|gen_6s|s_cnt[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|Add0~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(26));

-- Location: LCCOMB_X108_Y69_N24
\clock_gen|gen_6s|Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~52_combout\ = (\clock_gen|gen_6s|s_cnt\(27) & (\clock_gen|gen_6s|Add0~51\ $ (GND))) # (!\clock_gen|gen_6s|s_cnt\(27) & (!\clock_gen|gen_6s|Add0~51\ & VCC))
-- \clock_gen|gen_6s|Add0~53\ = CARRY((\clock_gen|gen_6s|s_cnt\(27) & !\clock_gen|gen_6s|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_6s|s_cnt\(27),
	datad => VCC,
	cin => \clock_gen|gen_6s|Add0~51\,
	combout => \clock_gen|gen_6s|Add0~52_combout\,
	cout => \clock_gen|gen_6s|Add0~53\);

-- Location: FF_X108_Y69_N25
\clock_gen|gen_6s|s_cnt[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|Add0~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(27));

-- Location: LCCOMB_X108_Y69_N26
\clock_gen|gen_6s|Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Add0~54_combout\ = \clock_gen|gen_6s|Add0~53\ $ (\clock_gen|gen_6s|s_cnt\(28))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \clock_gen|gen_6s|s_cnt\(28),
	cin => \clock_gen|gen_6s|Add0~53\,
	combout => \clock_gen|gen_6s|Add0~54_combout\);

-- Location: LCCOMB_X107_Y69_N24
\clock_gen|gen_6s|s_cnt~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|s_cnt~11_combout\ = (\clock_gen|gen_6s|Add0~54_combout\ & (((!\clock_gen|gen_6s|Equal0~2_combout\) # (!\clock_gen|gen_6s|Equal0~1_combout\)) # (!\clock_gen|gen_6s|Equal0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|Equal0~7_combout\,
	datab => \clock_gen|gen_6s|Equal0~1_combout\,
	datac => \clock_gen|gen_6s|Equal0~2_combout\,
	datad => \clock_gen|gen_6s|Add0~54_combout\,
	combout => \clock_gen|gen_6s|s_cnt~11_combout\);

-- Location: FF_X107_Y69_N25
\clock_gen|gen_6s|s_cnt[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|s_cnt~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(28));

-- Location: LCCOMB_X107_Y69_N26
\clock_gen|gen_6s|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Equal0~2_combout\ = (!\clock_gen|gen_6s|s_cnt\(26) & (!\clock_gen|gen_6s|s_cnt\(27) & \clock_gen|gen_6s|s_cnt\(28)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_6s|s_cnt\(26),
	datac => \clock_gen|gen_6s|s_cnt\(27),
	datad => \clock_gen|gen_6s|s_cnt\(28),
	combout => \clock_gen|gen_6s|Equal0~2_combout\);

-- Location: LCCOMB_X107_Y69_N10
\clock_gen|gen_6s|s_cnt~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|s_cnt~10_combout\ = (\clock_gen|gen_6s|Add0~24_combout\ & (((!\clock_gen|gen_6s|Equal0~1_combout\) # (!\clock_gen|gen_6s|Equal0~7_combout\)) # (!\clock_gen|gen_6s|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|Equal0~2_combout\,
	datab => \clock_gen|gen_6s|Equal0~7_combout\,
	datac => \clock_gen|gen_6s|Add0~24_combout\,
	datad => \clock_gen|gen_6s|Equal0~1_combout\,
	combout => \clock_gen|gen_6s|s_cnt~10_combout\);

-- Location: FF_X107_Y69_N11
\clock_gen|gen_6s|s_cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|s_cnt~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(13));

-- Location: LCCOMB_X107_Y69_N12
\clock_gen|gen_6s|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Equal0~0_combout\ = (\clock_gen|gen_6s|s_cnt\(13) & (\clock_gen|gen_6s|s_cnt\(15) & (!\clock_gen|gen_6s|s_cnt\(14) & \clock_gen|gen_6s|s_cnt\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|s_cnt\(13),
	datab => \clock_gen|gen_6s|s_cnt\(15),
	datac => \clock_gen|gen_6s|s_cnt\(14),
	datad => \clock_gen|gen_6s|s_cnt\(16),
	combout => \clock_gen|gen_6s|Equal0~0_combout\);

-- Location: LCCOMB_X107_Y69_N2
\clock_gen|gen_6s|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Equal0~1_combout\ = (\clock_gen|gen_6s|Equal0~0_combout\ & (\clock_gen|gen_2hz|s_cnt\(0) & (\clock_gen|gen_6s|s_cnt\(5) & \clock_gen|gen_2hz|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|Equal0~0_combout\,
	datab => \clock_gen|gen_2hz|s_cnt\(0),
	datac => \clock_gen|gen_6s|s_cnt\(5),
	datad => \clock_gen|gen_2hz|Equal0~0_combout\,
	combout => \clock_gen|gen_6s|Equal0~1_combout\);

-- Location: LCCOMB_X108_Y69_N30
\clock_gen|gen_6s|s_cnt~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|s_cnt~17_combout\ = (\clock_gen|gen_6s|Add0~46_combout\ & (((!\clock_gen|gen_6s|Equal0~2_combout\) # (!\clock_gen|gen_6s|Equal0~7_combout\)) # (!\clock_gen|gen_6s|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|Equal0~1_combout\,
	datab => \clock_gen|gen_6s|Equal0~7_combout\,
	datac => \clock_gen|gen_6s|Equal0~2_combout\,
	datad => \clock_gen|gen_6s|Add0~46_combout\,
	combout => \clock_gen|gen_6s|s_cnt~17_combout\);

-- Location: FF_X108_Y69_N31
\clock_gen|gen_6s|s_cnt[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|s_cnt~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|s_cnt\(24));

-- Location: LCCOMB_X107_Y69_N22
\clock_gen|gen_6s|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Equal0~6_combout\ = (\clock_gen|gen_6s|s_cnt\(24) & (\clock_gen|gen_6s|s_cnt\(23) & (\clock_gen|gen_6s|s_cnt\(22) & !\clock_gen|gen_6s|s_cnt\(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|s_cnt\(24),
	datab => \clock_gen|gen_6s|s_cnt\(23),
	datac => \clock_gen|gen_6s|s_cnt\(22),
	datad => \clock_gen|gen_6s|s_cnt\(25),
	combout => \clock_gen|gen_6s|Equal0~6_combout\);

-- Location: LCCOMB_X107_Y69_N20
\clock_gen|gen_6s|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Equal0~5_combout\ = (!\clock_gen|gen_6s|s_cnt\(18) & (!\clock_gen|gen_6s|s_cnt\(19) & (!\clock_gen|gen_6s|s_cnt\(20) & \clock_gen|gen_6s|s_cnt\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|s_cnt\(18),
	datab => \clock_gen|gen_6s|s_cnt\(19),
	datac => \clock_gen|gen_6s|s_cnt\(20),
	datad => \clock_gen|gen_6s|s_cnt\(21),
	combout => \clock_gen|gen_6s|Equal0~5_combout\);

-- Location: LCCOMB_X107_Y69_N30
\clock_gen|gen_6s|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Equal0~4_combout\ = (!\clock_gen|gen_6s|s_cnt\(17) & (\clock_gen|gen_6s|s_cnt\(6) & (\clock_gen|gen_6s|s_cnt\(7) & !\clock_gen|gen_6s|s_cnt\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|s_cnt\(17),
	datab => \clock_gen|gen_6s|s_cnt\(6),
	datac => \clock_gen|gen_6s|s_cnt\(7),
	datad => \clock_gen|gen_6s|s_cnt\(8),
	combout => \clock_gen|gen_6s|Equal0~4_combout\);

-- Location: LCCOMB_X108_Y70_N2
\clock_gen|gen_6s|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Equal0~3_combout\ = (!\clock_gen|gen_6s|s_cnt\(12) & (!\clock_gen|gen_6s|s_cnt\(11) & (!\clock_gen|gen_6s|s_cnt\(10) & \clock_gen|gen_6s|s_cnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|s_cnt\(12),
	datab => \clock_gen|gen_6s|s_cnt\(11),
	datac => \clock_gen|gen_6s|s_cnt\(10),
	datad => \clock_gen|gen_6s|s_cnt\(9),
	combout => \clock_gen|gen_6s|Equal0~3_combout\);

-- Location: LCCOMB_X107_Y69_N28
\clock_gen|gen_6s|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Equal0~7_combout\ = (\clock_gen|gen_6s|Equal0~6_combout\ & (\clock_gen|gen_6s|Equal0~5_combout\ & (\clock_gen|gen_6s|Equal0~4_combout\ & \clock_gen|gen_6s|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_6s|Equal0~6_combout\,
	datab => \clock_gen|gen_6s|Equal0~5_combout\,
	datac => \clock_gen|gen_6s|Equal0~4_combout\,
	datad => \clock_gen|gen_6s|Equal0~3_combout\,
	combout => \clock_gen|gen_6s|Equal0~7_combout\);

-- Location: LCCOMB_X107_Y69_N4
\clock_gen|gen_6s|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_6s|Equal0~8_combout\ = (\clock_gen|gen_6s|Equal0~7_combout\ & (\clock_gen|gen_6s|Equal0~2_combout\ & \clock_gen|gen_6s|Equal0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_6s|Equal0~7_combout\,
	datac => \clock_gen|gen_6s|Equal0~2_combout\,
	datad => \clock_gen|gen_6s|Equal0~1_combout\,
	combout => \clock_gen|gen_6s|Equal0~8_combout\);

-- Location: FF_X107_Y69_N5
\clock_gen|gen_6s|pulse\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_6s|Equal0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_6s|pulse~q\);

-- Location: LCCOMB_X110_Y69_N12
\prog4_inst|mode~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \prog4_inst|mode~0_combout\ = (\SW[1]~input_o\ & (\SW[0]~input_o\ & (\clock_gen|gen_6s|pulse~q\ $ (\prog4_inst|mode~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datab => \clock_gen|gen_6s|pulse~q\,
	datac => \prog4_inst|mode~q\,
	datad => \SW[0]~input_o\,
	combout => \prog4_inst|mode~0_combout\);

-- Location: FF_X110_Y69_N13
\prog4_inst|mode\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \prog4_inst|mode~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \prog4_inst|mode~q\);

-- Location: LCCOMB_X114_Y69_N28
\prog4_inst|red_blink~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \prog4_inst|red_blink~0_combout\ = (\prog4_inst|mode~q\ & (\LEDR~0_combout\ & (\clock_gen|gen_2hz|pulse~q\ $ (\prog4_inst|red_blink~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|pulse~q\,
	datab => \prog4_inst|mode~q\,
	datac => \prog4_inst|red_blink~q\,
	datad => \LEDR~0_combout\,
	combout => \prog4_inst|red_blink~0_combout\);

-- Location: FF_X114_Y69_N29
\prog4_inst|red_blink\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \prog4_inst|red_blink~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \prog4_inst|red_blink~q\);

-- Location: LCCOMB_X114_Y69_N30
\LEDR~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LEDR~1_combout\ = (\SW[1]~input_o\ & (\prog4_inst|red_blink~q\ & (\prog4_inst|mode~q\ & \SW[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datab => \prog4_inst|red_blink~q\,
	datac => \prog4_inst|mode~q\,
	datad => \SW[0]~input_o\,
	combout => \LEDR~1_combout\);

-- Location: LCCOMB_X110_Y69_N18
\prog2_inst|led_state~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \prog2_inst|led_state~0_combout\ = (!\SW[1]~input_o\ & (\SW[0]~input_o\ & (!\prog2_inst|led_state~q\ & \clock_gen|gen_2hz|pulse~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datab => \SW[0]~input_o\,
	datac => \prog2_inst|led_state~q\,
	datad => \clock_gen|gen_2hz|pulse~q\,
	combout => \prog2_inst|led_state~0_combout\);

-- Location: FF_X110_Y69_N19
\prog2_inst|led_state\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \prog2_inst|led_state~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \prog2_inst|led_state~q\);

-- Location: LCCOMB_X110_Y69_N16
\LEDR~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LEDR~2_combout\ = (\LEDR~1_combout\) # ((!\SW[1]~input_o\ & ((\prog2_inst|led_state~q\) # (!\SW[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LEDR~1_combout\,
	datab => \prog2_inst|led_state~q\,
	datac => \SW[1]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \LEDR~2_combout\);

-- Location: LCCOMB_X111_Y70_N8
\clock_gen|gen_1hz|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~1_cout\ = CARRY((\clock_gen|gen_2hz|s_cnt\(1) & \clock_gen|gen_2hz|s_cnt\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|s_cnt\(1),
	datab => \clock_gen|gen_2hz|s_cnt\(0),
	datad => VCC,
	cout => \clock_gen|gen_1hz|Add0~1_cout\);

-- Location: LCCOMB_X111_Y70_N10
\clock_gen|gen_1hz|Add0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~3_cout\ = CARRY((!\clock_gen|gen_1hz|Add0~1_cout\) # (!\clock_gen|gen_2hz|s_cnt\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|s_cnt\(2),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~1_cout\,
	cout => \clock_gen|gen_1hz|Add0~3_cout\);

-- Location: LCCOMB_X111_Y70_N12
\clock_gen|gen_1hz|Add0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~5_cout\ = CARRY((\clock_gen|gen_2hz|s_cnt\(3) & !\clock_gen|gen_1hz|Add0~3_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|s_cnt\(3),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~3_cout\,
	cout => \clock_gen|gen_1hz|Add0~5_cout\);

-- Location: LCCOMB_X111_Y70_N14
\clock_gen|gen_1hz|Add0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~7_cout\ = CARRY((!\clock_gen|gen_1hz|Add0~5_cout\) # (!\clock_gen|gen_2hz|s_cnt\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|s_cnt\(4),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~5_cout\,
	cout => \clock_gen|gen_1hz|Add0~7_cout\);

-- Location: LCCOMB_X111_Y70_N16
\clock_gen|gen_1hz|Add0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~9_cout\ = CARRY((\clock_gen|gen_6s|s_cnt\(5) & !\clock_gen|gen_1hz|Add0~7_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_6s|s_cnt\(5),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~7_cout\,
	cout => \clock_gen|gen_1hz|Add0~9_cout\);

-- Location: LCCOMB_X111_Y70_N18
\clock_gen|gen_1hz|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~10_combout\ = (\clock_gen|gen_1hz|s_cnt\(6) & (!\clock_gen|gen_1hz|Add0~9_cout\)) # (!\clock_gen|gen_1hz|s_cnt\(6) & ((\clock_gen|gen_1hz|Add0~9_cout\) # (GND)))
-- \clock_gen|gen_1hz|Add0~11\ = CARRY((!\clock_gen|gen_1hz|Add0~9_cout\) # (!\clock_gen|gen_1hz|s_cnt\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_1hz|s_cnt\(6),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~9_cout\,
	combout => \clock_gen|gen_1hz|Add0~10_combout\,
	cout => \clock_gen|gen_1hz|Add0~11\);

-- Location: LCCOMB_X112_Y69_N10
\clock_gen|gen_1hz|s_cnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|s_cnt~5_combout\ = (!\clock_gen|gen_1hz|Equal0~6_combout\ & \clock_gen|gen_1hz|Add0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clock_gen|gen_1hz|Equal0~6_combout\,
	datad => \clock_gen|gen_1hz|Add0~10_combout\,
	combout => \clock_gen|gen_1hz|s_cnt~5_combout\);

-- Location: FF_X112_Y69_N11
\clock_gen|gen_1hz|s_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_1hz|s_cnt~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_1hz|s_cnt\(6));

-- Location: LCCOMB_X111_Y70_N20
\clock_gen|gen_1hz|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~12_combout\ = (\clock_gen|gen_1hz|s_cnt\(7) & (\clock_gen|gen_1hz|Add0~11\ $ (GND))) # (!\clock_gen|gen_1hz|s_cnt\(7) & (!\clock_gen|gen_1hz|Add0~11\ & VCC))
-- \clock_gen|gen_1hz|Add0~13\ = CARRY((\clock_gen|gen_1hz|s_cnt\(7) & !\clock_gen|gen_1hz|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_1hz|s_cnt\(7),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~11\,
	combout => \clock_gen|gen_1hz|Add0~12_combout\,
	cout => \clock_gen|gen_1hz|Add0~13\);

-- Location: FF_X111_Y70_N21
\clock_gen|gen_1hz|s_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_1hz|Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_1hz|s_cnt\(7));

-- Location: LCCOMB_X111_Y70_N22
\clock_gen|gen_1hz|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~14_combout\ = (\clock_gen|gen_1hz|s_cnt\(8) & (!\clock_gen|gen_1hz|Add0~13\)) # (!\clock_gen|gen_1hz|s_cnt\(8) & ((\clock_gen|gen_1hz|Add0~13\) # (GND)))
-- \clock_gen|gen_1hz|Add0~15\ = CARRY((!\clock_gen|gen_1hz|Add0~13\) # (!\clock_gen|gen_1hz|s_cnt\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_1hz|s_cnt\(8),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~13\,
	combout => \clock_gen|gen_1hz|Add0~14_combout\,
	cout => \clock_gen|gen_1hz|Add0~15\);

-- Location: FF_X111_Y70_N23
\clock_gen|gen_1hz|s_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_1hz|Add0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_1hz|s_cnt\(8));

-- Location: LCCOMB_X111_Y70_N24
\clock_gen|gen_1hz|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~16_combout\ = (\clock_gen|gen_1hz|s_cnt\(9) & (\clock_gen|gen_1hz|Add0~15\ $ (GND))) # (!\clock_gen|gen_1hz|s_cnt\(9) & (!\clock_gen|gen_1hz|Add0~15\ & VCC))
-- \clock_gen|gen_1hz|Add0~17\ = CARRY((\clock_gen|gen_1hz|s_cnt\(9) & !\clock_gen|gen_1hz|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_1hz|s_cnt\(9),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~15\,
	combout => \clock_gen|gen_1hz|Add0~16_combout\,
	cout => \clock_gen|gen_1hz|Add0~17\);

-- Location: FF_X111_Y70_N25
\clock_gen|gen_1hz|s_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_1hz|Add0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_1hz|s_cnt\(9));

-- Location: LCCOMB_X111_Y70_N26
\clock_gen|gen_1hz|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~18_combout\ = (\clock_gen|gen_1hz|s_cnt\(10) & (!\clock_gen|gen_1hz|Add0~17\)) # (!\clock_gen|gen_1hz|s_cnt\(10) & ((\clock_gen|gen_1hz|Add0~17\) # (GND)))
-- \clock_gen|gen_1hz|Add0~19\ = CARRY((!\clock_gen|gen_1hz|Add0~17\) # (!\clock_gen|gen_1hz|s_cnt\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_1hz|s_cnt\(10),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~17\,
	combout => \clock_gen|gen_1hz|Add0~18_combout\,
	cout => \clock_gen|gen_1hz|Add0~19\);

-- Location: FF_X111_Y70_N27
\clock_gen|gen_1hz|s_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_1hz|Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_1hz|s_cnt\(10));

-- Location: LCCOMB_X111_Y70_N28
\clock_gen|gen_1hz|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~20_combout\ = (\clock_gen|gen_1hz|s_cnt\(11) & (\clock_gen|gen_1hz|Add0~19\ $ (GND))) # (!\clock_gen|gen_1hz|s_cnt\(11) & (!\clock_gen|gen_1hz|Add0~19\ & VCC))
-- \clock_gen|gen_1hz|Add0~21\ = CARRY((\clock_gen|gen_1hz|s_cnt\(11) & !\clock_gen|gen_1hz|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_1hz|s_cnt\(11),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~19\,
	combout => \clock_gen|gen_1hz|Add0~20_combout\,
	cout => \clock_gen|gen_1hz|Add0~21\);

-- Location: LCCOMB_X111_Y70_N6
\clock_gen|gen_1hz|s_cnt~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|s_cnt~4_combout\ = (\clock_gen|gen_1hz|Add0~20_combout\ & !\clock_gen|gen_1hz|Equal0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_1hz|Add0~20_combout\,
	datad => \clock_gen|gen_1hz|Equal0~6_combout\,
	combout => \clock_gen|gen_1hz|s_cnt~4_combout\);

-- Location: FF_X111_Y70_N7
\clock_gen|gen_1hz|s_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_1hz|s_cnt~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_1hz|s_cnt\(11));

-- Location: LCCOMB_X111_Y70_N30
\clock_gen|gen_1hz|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~22_combout\ = (\clock_gen|gen_1hz|s_cnt\(12) & (!\clock_gen|gen_1hz|Add0~21\)) # (!\clock_gen|gen_1hz|s_cnt\(12) & ((\clock_gen|gen_1hz|Add0~21\) # (GND)))
-- \clock_gen|gen_1hz|Add0~23\ = CARRY((!\clock_gen|gen_1hz|Add0~21\) # (!\clock_gen|gen_1hz|s_cnt\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_1hz|s_cnt\(12),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~21\,
	combout => \clock_gen|gen_1hz|Add0~22_combout\,
	cout => \clock_gen|gen_1hz|Add0~23\);

-- Location: LCCOMB_X111_Y70_N4
\clock_gen|gen_1hz|s_cnt~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|s_cnt~3_combout\ = (\clock_gen|gen_1hz|Add0~22_combout\ & !\clock_gen|gen_1hz|Equal0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clock_gen|gen_1hz|Add0~22_combout\,
	datad => \clock_gen|gen_1hz|Equal0~6_combout\,
	combout => \clock_gen|gen_1hz|s_cnt~3_combout\);

-- Location: FF_X111_Y70_N5
\clock_gen|gen_1hz|s_cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_1hz|s_cnt~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_1hz|s_cnt\(12));

-- Location: LCCOMB_X111_Y69_N0
\clock_gen|gen_1hz|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~24_combout\ = (\clock_gen|gen_1hz|s_cnt\(13) & (\clock_gen|gen_1hz|Add0~23\ $ (GND))) # (!\clock_gen|gen_1hz|s_cnt\(13) & (!\clock_gen|gen_1hz|Add0~23\ & VCC))
-- \clock_gen|gen_1hz|Add0~25\ = CARRY((\clock_gen|gen_1hz|s_cnt\(13) & !\clock_gen|gen_1hz|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_1hz|s_cnt\(13),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~23\,
	combout => \clock_gen|gen_1hz|Add0~24_combout\,
	cout => \clock_gen|gen_1hz|Add0~25\);

-- Location: LCCOMB_X111_Y69_N24
\clock_gen|gen_1hz|s_cnt~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|s_cnt~2_combout\ = (!\clock_gen|gen_1hz|Equal0~6_combout\ & \clock_gen|gen_1hz|Add0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_1hz|Equal0~6_combout\,
	datad => \clock_gen|gen_1hz|Add0~24_combout\,
	combout => \clock_gen|gen_1hz|s_cnt~2_combout\);

-- Location: FF_X111_Y69_N25
\clock_gen|gen_1hz|s_cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_1hz|s_cnt~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_1hz|s_cnt\(13));

-- Location: LCCOMB_X111_Y69_N2
\clock_gen|gen_1hz|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~26_combout\ = (\clock_gen|gen_1hz|s_cnt\(14) & (!\clock_gen|gen_1hz|Add0~25\)) # (!\clock_gen|gen_1hz|s_cnt\(14) & ((\clock_gen|gen_1hz|Add0~25\) # (GND)))
-- \clock_gen|gen_1hz|Add0~27\ = CARRY((!\clock_gen|gen_1hz|Add0~25\) # (!\clock_gen|gen_1hz|s_cnt\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_1hz|s_cnt\(14),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~25\,
	combout => \clock_gen|gen_1hz|Add0~26_combout\,
	cout => \clock_gen|gen_1hz|Add0~27\);

-- Location: LCCOMB_X111_Y69_N30
\clock_gen|gen_1hz|s_cnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|s_cnt~1_combout\ = (!\clock_gen|gen_1hz|Equal0~6_combout\ & \clock_gen|gen_1hz|Add0~26_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_1hz|Equal0~6_combout\,
	datad => \clock_gen|gen_1hz|Add0~26_combout\,
	combout => \clock_gen|gen_1hz|s_cnt~1_combout\);

-- Location: FF_X111_Y69_N31
\clock_gen|gen_1hz|s_cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_1hz|s_cnt~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_1hz|s_cnt\(14));

-- Location: LCCOMB_X111_Y69_N4
\clock_gen|gen_1hz|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~28_combout\ = (\clock_gen|gen_1hz|s_cnt\(15) & (\clock_gen|gen_1hz|Add0~27\ $ (GND))) # (!\clock_gen|gen_1hz|s_cnt\(15) & (!\clock_gen|gen_1hz|Add0~27\ & VCC))
-- \clock_gen|gen_1hz|Add0~29\ = CARRY((\clock_gen|gen_1hz|s_cnt\(15) & !\clock_gen|gen_1hz|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_1hz|s_cnt\(15),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~27\,
	combout => \clock_gen|gen_1hz|Add0~28_combout\,
	cout => \clock_gen|gen_1hz|Add0~29\);

-- Location: FF_X111_Y69_N5
\clock_gen|gen_1hz|s_cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_1hz|Add0~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_1hz|s_cnt\(15));

-- Location: LCCOMB_X111_Y69_N6
\clock_gen|gen_1hz|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~30_combout\ = (\clock_gen|gen_1hz|s_cnt\(16) & (!\clock_gen|gen_1hz|Add0~29\)) # (!\clock_gen|gen_1hz|s_cnt\(16) & ((\clock_gen|gen_1hz|Add0~29\) # (GND)))
-- \clock_gen|gen_1hz|Add0~31\ = CARRY((!\clock_gen|gen_1hz|Add0~29\) # (!\clock_gen|gen_1hz|s_cnt\(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_1hz|s_cnt\(16),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~29\,
	combout => \clock_gen|gen_1hz|Add0~30_combout\,
	cout => \clock_gen|gen_1hz|Add0~31\);

-- Location: LCCOMB_X111_Y69_N28
\clock_gen|gen_1hz|s_cnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|s_cnt~0_combout\ = (!\clock_gen|gen_1hz|Equal0~6_combout\ & \clock_gen|gen_1hz|Add0~30_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_1hz|Equal0~6_combout\,
	datad => \clock_gen|gen_1hz|Add0~30_combout\,
	combout => \clock_gen|gen_1hz|s_cnt~0_combout\);

-- Location: FF_X111_Y69_N29
\clock_gen|gen_1hz|s_cnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_1hz|s_cnt~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_1hz|s_cnt\(16));

-- Location: LCCOMB_X111_Y69_N8
\clock_gen|gen_1hz|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~32_combout\ = (\clock_gen|gen_1hz|s_cnt\(17) & (\clock_gen|gen_1hz|Add0~31\ $ (GND))) # (!\clock_gen|gen_1hz|s_cnt\(17) & (!\clock_gen|gen_1hz|Add0~31\ & VCC))
-- \clock_gen|gen_1hz|Add0~33\ = CARRY((\clock_gen|gen_1hz|s_cnt\(17) & !\clock_gen|gen_1hz|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_1hz|s_cnt\(17),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~31\,
	combout => \clock_gen|gen_1hz|Add0~32_combout\,
	cout => \clock_gen|gen_1hz|Add0~33\);

-- Location: FF_X111_Y69_N9
\clock_gen|gen_1hz|s_cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_1hz|Add0~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_1hz|s_cnt\(17));

-- Location: LCCOMB_X112_Y69_N12
\clock_gen|gen_1hz|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Equal0~3_combout\ = (!\clock_gen|gen_1hz|s_cnt\(6) & (!\clock_gen|gen_1hz|s_cnt\(8) & (!\clock_gen|gen_1hz|s_cnt\(7) & !\clock_gen|gen_1hz|s_cnt\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_1hz|s_cnt\(6),
	datab => \clock_gen|gen_1hz|s_cnt\(8),
	datac => \clock_gen|gen_1hz|s_cnt\(7),
	datad => \clock_gen|gen_1hz|s_cnt\(17),
	combout => \clock_gen|gen_1hz|Equal0~3_combout\);

-- Location: LCCOMB_X111_Y70_N0
\clock_gen|gen_1hz|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Equal0~2_combout\ = (!\clock_gen|gen_1hz|s_cnt\(10) & (!\clock_gen|gen_1hz|s_cnt\(9) & (\clock_gen|gen_1hz|s_cnt\(12) & \clock_gen|gen_1hz|s_cnt\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_1hz|s_cnt\(10),
	datab => \clock_gen|gen_1hz|s_cnt\(9),
	datac => \clock_gen|gen_1hz|s_cnt\(12),
	datad => \clock_gen|gen_1hz|s_cnt\(11),
	combout => \clock_gen|gen_1hz|Equal0~2_combout\);

-- Location: LCCOMB_X111_Y69_N10
\clock_gen|gen_1hz|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~34_combout\ = (\clock_gen|gen_1hz|s_cnt\(18) & (!\clock_gen|gen_1hz|Add0~33\)) # (!\clock_gen|gen_1hz|s_cnt\(18) & ((\clock_gen|gen_1hz|Add0~33\) # (GND)))
-- \clock_gen|gen_1hz|Add0~35\ = CARRY((!\clock_gen|gen_1hz|Add0~33\) # (!\clock_gen|gen_1hz|s_cnt\(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_1hz|s_cnt\(18),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~33\,
	combout => \clock_gen|gen_1hz|Add0~34_combout\,
	cout => \clock_gen|gen_1hz|Add0~35\);

-- Location: LCCOMB_X112_Y69_N2
\clock_gen|gen_1hz|s_cnt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|s_cnt~6_combout\ = (!\clock_gen|gen_1hz|Equal0~6_combout\ & \clock_gen|gen_1hz|Add0~34_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clock_gen|gen_1hz|Equal0~6_combout\,
	datad => \clock_gen|gen_1hz|Add0~34_combout\,
	combout => \clock_gen|gen_1hz|s_cnt~6_combout\);

-- Location: FF_X112_Y69_N3
\clock_gen|gen_1hz|s_cnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_1hz|s_cnt~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_1hz|s_cnt\(18));

-- Location: LCCOMB_X111_Y69_N12
\clock_gen|gen_1hz|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~36_combout\ = (\clock_gen|gen_1hz|s_cnt\(19) & (\clock_gen|gen_1hz|Add0~35\ $ (GND))) # (!\clock_gen|gen_1hz|s_cnt\(19) & (!\clock_gen|gen_1hz|Add0~35\ & VCC))
-- \clock_gen|gen_1hz|Add0~37\ = CARRY((\clock_gen|gen_1hz|s_cnt\(19) & !\clock_gen|gen_1hz|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_1hz|s_cnt\(19),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~35\,
	combout => \clock_gen|gen_1hz|Add0~36_combout\,
	cout => \clock_gen|gen_1hz|Add0~37\);

-- Location: LCCOMB_X112_Y69_N4
\clock_gen|gen_1hz|s_cnt~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|s_cnt~7_combout\ = (!\clock_gen|gen_1hz|Equal0~6_combout\ & \clock_gen|gen_1hz|Add0~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clock_gen|gen_1hz|Equal0~6_combout\,
	datad => \clock_gen|gen_1hz|Add0~36_combout\,
	combout => \clock_gen|gen_1hz|s_cnt~7_combout\);

-- Location: FF_X112_Y69_N5
\clock_gen|gen_1hz|s_cnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_1hz|s_cnt~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_1hz|s_cnt\(19));

-- Location: LCCOMB_X111_Y69_N14
\clock_gen|gen_1hz|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~38_combout\ = (\clock_gen|gen_1hz|s_cnt\(20) & (!\clock_gen|gen_1hz|Add0~37\)) # (!\clock_gen|gen_1hz|s_cnt\(20) & ((\clock_gen|gen_1hz|Add0~37\) # (GND)))
-- \clock_gen|gen_1hz|Add0~39\ = CARRY((!\clock_gen|gen_1hz|Add0~37\) # (!\clock_gen|gen_1hz|s_cnt\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_1hz|s_cnt\(20),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~37\,
	combout => \clock_gen|gen_1hz|Add0~38_combout\,
	cout => \clock_gen|gen_1hz|Add0~39\);

-- Location: LCCOMB_X112_Y69_N6
\clock_gen|gen_1hz|s_cnt~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|s_cnt~8_combout\ = (!\clock_gen|gen_1hz|Equal0~6_combout\ & \clock_gen|gen_1hz|Add0~38_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clock_gen|gen_1hz|Equal0~6_combout\,
	datad => \clock_gen|gen_1hz|Add0~38_combout\,
	combout => \clock_gen|gen_1hz|s_cnt~8_combout\);

-- Location: FF_X112_Y69_N7
\clock_gen|gen_1hz|s_cnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_1hz|s_cnt~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_1hz|s_cnt\(20));

-- Location: LCCOMB_X111_Y69_N16
\clock_gen|gen_1hz|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~40_combout\ = (\clock_gen|gen_1hz|s_cnt\(21) & (\clock_gen|gen_1hz|Add0~39\ $ (GND))) # (!\clock_gen|gen_1hz|s_cnt\(21) & (!\clock_gen|gen_1hz|Add0~39\ & VCC))
-- \clock_gen|gen_1hz|Add0~41\ = CARRY((\clock_gen|gen_1hz|s_cnt\(21) & !\clock_gen|gen_1hz|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_1hz|s_cnt\(21),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~39\,
	combout => \clock_gen|gen_1hz|Add0~40_combout\,
	cout => \clock_gen|gen_1hz|Add0~41\);

-- Location: LCCOMB_X112_Y69_N20
\clock_gen|gen_1hz|s_cnt~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|s_cnt~9_combout\ = (!\clock_gen|gen_1hz|Equal0~6_combout\ & \clock_gen|gen_1hz|Add0~40_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_1hz|Equal0~6_combout\,
	datac => \clock_gen|gen_1hz|Add0~40_combout\,
	combout => \clock_gen|gen_1hz|s_cnt~9_combout\);

-- Location: FF_X112_Y69_N21
\clock_gen|gen_1hz|s_cnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_1hz|s_cnt~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_1hz|s_cnt\(21));

-- Location: LCCOMB_X111_Y69_N18
\clock_gen|gen_1hz|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~42_combout\ = (\clock_gen|gen_1hz|s_cnt\(22) & (!\clock_gen|gen_1hz|Add0~41\)) # (!\clock_gen|gen_1hz|s_cnt\(22) & ((\clock_gen|gen_1hz|Add0~41\) # (GND)))
-- \clock_gen|gen_1hz|Add0~43\ = CARRY((!\clock_gen|gen_1hz|Add0~41\) # (!\clock_gen|gen_1hz|s_cnt\(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_1hz|s_cnt\(22),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~41\,
	combout => \clock_gen|gen_1hz|Add0~42_combout\,
	cout => \clock_gen|gen_1hz|Add0~43\);

-- Location: LCCOMB_X111_Y69_N26
\clock_gen|gen_1hz|s_cnt~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|s_cnt~10_combout\ = (!\clock_gen|gen_1hz|Equal0~6_combout\ & \clock_gen|gen_1hz|Add0~42_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_1hz|Equal0~6_combout\,
	datad => \clock_gen|gen_1hz|Add0~42_combout\,
	combout => \clock_gen|gen_1hz|s_cnt~10_combout\);

-- Location: FF_X111_Y69_N27
\clock_gen|gen_1hz|s_cnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_1hz|s_cnt~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_1hz|s_cnt\(22));

-- Location: LCCOMB_X111_Y69_N20
\clock_gen|gen_1hz|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~44_combout\ = (\clock_gen|gen_1hz|s_cnt\(23) & (\clock_gen|gen_1hz|Add0~43\ $ (GND))) # (!\clock_gen|gen_1hz|s_cnt\(23) & (!\clock_gen|gen_1hz|Add0~43\ & VCC))
-- \clock_gen|gen_1hz|Add0~45\ = CARRY((\clock_gen|gen_1hz|s_cnt\(23) & !\clock_gen|gen_1hz|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clock_gen|gen_1hz|s_cnt\(23),
	datad => VCC,
	cin => \clock_gen|gen_1hz|Add0~43\,
	combout => \clock_gen|gen_1hz|Add0~44_combout\,
	cout => \clock_gen|gen_1hz|Add0~45\);

-- Location: FF_X111_Y69_N21
\clock_gen|gen_1hz|s_cnt[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_1hz|Add0~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_1hz|s_cnt\(23));

-- Location: LCCOMB_X112_Y69_N30
\clock_gen|gen_1hz|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Equal0~4_combout\ = (\clock_gen|gen_1hz|s_cnt\(20) & (\clock_gen|gen_1hz|s_cnt\(21) & (\clock_gen|gen_1hz|s_cnt\(19) & \clock_gen|gen_1hz|s_cnt\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_1hz|s_cnt\(20),
	datab => \clock_gen|gen_1hz|s_cnt\(21),
	datac => \clock_gen|gen_1hz|s_cnt\(19),
	datad => \clock_gen|gen_1hz|s_cnt\(18),
	combout => \clock_gen|gen_1hz|Equal0~4_combout\);

-- Location: LCCOMB_X111_Y69_N22
\clock_gen|gen_1hz|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Add0~46_combout\ = \clock_gen|gen_1hz|Add0~45\ $ (\clock_gen|gen_1hz|s_cnt\(24))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \clock_gen|gen_1hz|s_cnt\(24),
	cin => \clock_gen|gen_1hz|Add0~45\,
	combout => \clock_gen|gen_1hz|Add0~46_combout\);

-- Location: LCCOMB_X112_Y69_N24
\clock_gen|gen_1hz|s_cnt~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|s_cnt~11_combout\ = (!\clock_gen|gen_1hz|Equal0~6_combout\ & \clock_gen|gen_1hz|Add0~46_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clock_gen|gen_1hz|Equal0~6_combout\,
	datad => \clock_gen|gen_1hz|Add0~46_combout\,
	combout => \clock_gen|gen_1hz|s_cnt~11_combout\);

-- Location: FF_X112_Y69_N25
\clock_gen|gen_1hz|s_cnt[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_1hz|s_cnt~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_1hz|s_cnt\(24));

-- Location: LCCOMB_X112_Y69_N26
\clock_gen|gen_1hz|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Equal0~5_combout\ = (\clock_gen|gen_1hz|s_cnt\(22) & (!\clock_gen|gen_1hz|s_cnt\(23) & (\clock_gen|gen_1hz|Equal0~4_combout\ & \clock_gen|gen_1hz|s_cnt\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_1hz|s_cnt\(22),
	datab => \clock_gen|gen_1hz|s_cnt\(23),
	datac => \clock_gen|gen_1hz|Equal0~4_combout\,
	datad => \clock_gen|gen_1hz|s_cnt\(24),
	combout => \clock_gen|gen_1hz|Equal0~5_combout\);

-- Location: LCCOMB_X112_Y69_N18
\clock_gen|gen_1hz|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Equal0~0_combout\ = (\clock_gen|gen_1hz|s_cnt\(14) & (\clock_gen|gen_1hz|s_cnt\(13) & (!\clock_gen|gen_1hz|s_cnt\(15) & \clock_gen|gen_1hz|s_cnt\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_1hz|s_cnt\(14),
	datab => \clock_gen|gen_1hz|s_cnt\(13),
	datac => \clock_gen|gen_1hz|s_cnt\(15),
	datad => \clock_gen|gen_1hz|s_cnt\(16),
	combout => \clock_gen|gen_1hz|Equal0~0_combout\);

-- Location: LCCOMB_X112_Y69_N28
\clock_gen|gen_1hz|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Equal0~1_combout\ = (\clock_gen|gen_2hz|s_cnt\(0) & (\clock_gen|gen_1hz|Equal0~0_combout\ & (\clock_gen|gen_6s|s_cnt\(5) & \clock_gen|gen_2hz|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_2hz|s_cnt\(0),
	datab => \clock_gen|gen_1hz|Equal0~0_combout\,
	datac => \clock_gen|gen_6s|s_cnt\(5),
	datad => \clock_gen|gen_2hz|Equal0~0_combout\,
	combout => \clock_gen|gen_1hz|Equal0~1_combout\);

-- Location: LCCOMB_X112_Y69_N16
\clock_gen|gen_1hz|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_gen|gen_1hz|Equal0~6_combout\ = (\clock_gen|gen_1hz|Equal0~3_combout\ & (\clock_gen|gen_1hz|Equal0~2_combout\ & (\clock_gen|gen_1hz|Equal0~5_combout\ & \clock_gen|gen_1hz|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clock_gen|gen_1hz|Equal0~3_combout\,
	datab => \clock_gen|gen_1hz|Equal0~2_combout\,
	datac => \clock_gen|gen_1hz|Equal0~5_combout\,
	datad => \clock_gen|gen_1hz|Equal0~1_combout\,
	combout => \clock_gen|gen_1hz|Equal0~6_combout\);

-- Location: FF_X112_Y69_N17
\clock_gen|gen_1hz|pulse\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_gen|gen_1hz|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_gen|gen_1hz|pulse~q\);

-- Location: LCCOMB_X112_Y69_N0
\prog4_inst|green_blink~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \prog4_inst|green_blink~0_combout\ = (\LEDR~0_combout\ & (!\prog4_inst|mode~q\ & (\prog4_inst|green_blink~q\ $ (\clock_gen|gen_1hz|pulse~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LEDR~0_combout\,
	datab => \prog4_inst|mode~q\,
	datac => \prog4_inst|green_blink~q\,
	datad => \clock_gen|gen_1hz|pulse~q\,
	combout => \prog4_inst|green_blink~0_combout\);

-- Location: FF_X112_Y69_N1
\prog4_inst|green_blink\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \prog4_inst|green_blink~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \prog4_inst|green_blink~q\);

-- Location: LCCOMB_X112_Y69_N22
\LEDG~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LEDG~0_combout\ = (\SW[0]~input_o\ & (!\prog4_inst|mode~q\ & (\SW[1]~input_o\ & \prog4_inst|green_blink~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \prog4_inst|mode~q\,
	datac => \SW[1]~input_o\,
	datad => \prog4_inst|green_blink~q\,
	combout => \LEDG~0_combout\);

-- Location: LCCOMB_X112_Y69_N8
\prog3_inst|led_state~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \prog3_inst|led_state~0_combout\ = (\SW[1]~input_o\ & (\clock_gen|gen_1hz|pulse~q\ & (!\prog3_inst|led_state~q\ & !\SW[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datab => \clock_gen|gen_1hz|pulse~q\,
	datac => \prog3_inst|led_state~q\,
	datad => \SW[0]~input_o\,
	combout => \prog3_inst|led_state~0_combout\);

-- Location: FF_X112_Y69_N9
\prog3_inst|led_state\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \prog3_inst|led_state~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \prog3_inst|led_state~q\);

-- Location: LCCOMB_X112_Y69_N14
\LEDG~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LEDG~1_combout\ = (\LEDG~0_combout\) # ((!\SW[0]~input_o\ & ((\prog3_inst|led_state~q\) # (!\SW[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LEDG~0_combout\,
	datab => \prog3_inst|led_state~q\,
	datac => \SW[1]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \LEDG~1_combout\);

ww_HEX0(0) <= \HEX0[0]~output_o\;

ww_HEX0(1) <= \HEX0[1]~output_o\;

ww_HEX0(2) <= \HEX0[2]~output_o\;

ww_HEX0(3) <= \HEX0[3]~output_o\;

ww_HEX0(4) <= \HEX0[4]~output_o\;

ww_HEX0(5) <= \HEX0[5]~output_o\;

ww_HEX0(6) <= \HEX0[6]~output_o\;

ww_LEDR(0) <= \LEDR[0]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(3) <= \LEDR[3]~output_o\;

ww_LEDR(4) <= \LEDR[4]~output_o\;

ww_LEDR(5) <= \LEDR[5]~output_o\;

ww_LEDR(6) <= \LEDR[6]~output_o\;

ww_LEDR(7) <= \LEDR[7]~output_o\;

ww_LEDG(0) <= \LEDG[0]~output_o\;

ww_LEDG(1) <= \LEDG[1]~output_o\;

ww_LEDG(2) <= \LEDG[2]~output_o\;

ww_LEDG(3) <= \LEDG[3]~output_o\;
END structure;


