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

-- DATE "06/03/2025 14:43:42"

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

ENTITY 	maquinas_vendas IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(0 DOWNTO 0);
	SW : IN std_logic_vector(1 DOWNTO 0);
	LEDR : BUFFER std_logic_vector(0 DOWNTO 0);
	LEDG : BUFFER std_logic_vector(1 DOWNTO 0);
	HEX0 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX1 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX2 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX3 : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END maquinas_vendas;

-- Design Ports Information
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[0]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[1]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[0]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_L26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_L25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[6]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[0]	=>  Location: PIN_M24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[1]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[2]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[3]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[4]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[5]	=>  Location: PIN_U23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[6]	=>  Location: PIN_U24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[0]	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[1]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[2]	=>  Location: PIN_Y25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[3]	=>  Location: PIN_W26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[4]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[5]	=>  Location: PIN_W27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[6]	=>  Location: PIN_W28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[0]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[1]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[2]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[3]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[4]	=>  Location: PIN_AD24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[5]	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[6]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF maquinas_vendas IS
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
SIGNAL ww_SW : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_LEDR : std_logic_vector(0 DOWNTO 0);
SIGNAL ww_LEDG : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX3 : std_logic_vector(6 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \LEDG[0]~output_o\ : std_logic;
SIGNAL \LEDG[1]~output_o\ : std_logic;
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
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \debouncer|Add0~0_combout\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \debouncer|s_dirtyIn~q\ : std_logic;
SIGNAL \debouncer|s_previousIn~q\ : std_logic;
SIGNAL \debouncer|Add0~1\ : std_logic;
SIGNAL \debouncer|Add0~2_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt~6_combout\ : std_logic;
SIGNAL \debouncer|Add0~3\ : std_logic;
SIGNAL \debouncer|Add0~4_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt~7_combout\ : std_logic;
SIGNAL \debouncer|Add0~5\ : std_logic;
SIGNAL \debouncer|Add0~6_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt~8_combout\ : std_logic;
SIGNAL \debouncer|Add0~7\ : std_logic;
SIGNAL \debouncer|Add0~8_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt~9_combout\ : std_logic;
SIGNAL \debouncer|Add0~9\ : std_logic;
SIGNAL \debouncer|Add0~10_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt~16_combout\ : std_logic;
SIGNAL \debouncer|Add0~11\ : std_logic;
SIGNAL \debouncer|Add0~12_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt~10_combout\ : std_logic;
SIGNAL \debouncer|Add0~13\ : std_logic;
SIGNAL \debouncer|Add0~14_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt~11_combout\ : std_logic;
SIGNAL \debouncer|Add0~15\ : std_logic;
SIGNAL \debouncer|Add0~16_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt~17_combout\ : std_logic;
SIGNAL \debouncer|Add0~17\ : std_logic;
SIGNAL \debouncer|Add0~18_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt~1_combout\ : std_logic;
SIGNAL \debouncer|Add0~19\ : std_logic;
SIGNAL \debouncer|Add0~20_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt~3_combout\ : std_logic;
SIGNAL \debouncer|Add0~21\ : std_logic;
SIGNAL \debouncer|Add0~22_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt~4_combout\ : std_logic;
SIGNAL \debouncer|Add0~23\ : std_logic;
SIGNAL \debouncer|Add0~24_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt~5_combout\ : std_logic;
SIGNAL \debouncer|Add0~25\ : std_logic;
SIGNAL \debouncer|Add0~26_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt~12_combout\ : std_logic;
SIGNAL \debouncer|Add0~27\ : std_logic;
SIGNAL \debouncer|Add0~28_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt~13_combout\ : std_logic;
SIGNAL \debouncer|Add0~29\ : std_logic;
SIGNAL \debouncer|Add0~30_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt[15]~14_combout\ : std_logic;
SIGNAL \debouncer|Add0~31\ : std_logic;
SIGNAL \debouncer|Add0~33\ : std_logic;
SIGNAL \debouncer|Add0~34_combout\ : std_logic;
SIGNAL \debouncer|LessThan0~0_combout\ : std_logic;
SIGNAL \debouncer|LessThan0~1_combout\ : std_logic;
SIGNAL \debouncer|s_pulsedOut~1_combout\ : std_logic;
SIGNAL \debouncer|s_pulsedOut~2_combout\ : std_logic;
SIGNAL \debouncer|s_pulsedOut~0_combout\ : std_logic;
SIGNAL \debouncer|s_pulsedOut~3_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt[17]~18_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt[17]~19_combout\ : std_logic;
SIGNAL \debouncer|LessThan0~2_combout\ : std_logic;
SIGNAL \debouncer|LessThan0~3_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt[18]~22_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt[18]~23_combout\ : std_logic;
SIGNAL \debouncer|Add0~35\ : std_logic;
SIGNAL \debouncer|Add0~36_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt[18]~21_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt[18]~24_combout\ : std_logic;
SIGNAL \debouncer|s_pulsedOut~4_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt[4]~2_combout\ : std_logic;
SIGNAL \debouncer|Add0~32_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt[16]~15_combout\ : std_logic;
SIGNAL \debouncer|LessThan0~4_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt[4]~0_combout\ : std_logic;
SIGNAL \debouncer|s_debounceCnt~20_combout\ : std_logic;
SIGNAL \debouncer|s_pulsedOut~5_combout\ : std_logic;
SIGNAL \debouncer|s_pulsedOut~q\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \registo|s_start_cha~q\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \registo|s_start_cafe~feeder_combout\ : std_logic;
SIGNAL \registo|s_start_cafe~q\ : std_logic;
SIGNAL \escolhaProd|Selector5~0_combout\ : std_logic;
SIGNAL \escolhaProd|Selector11~0_combout\ : std_logic;
SIGNAL \escolhaProd|state.hold_helo~0_combout\ : std_logic;
SIGNAL \escolhaProd|state.hold_helo~q\ : std_logic;
SIGNAL \escolhaProd|NewTime[0]~0_combout\ : std_logic;
SIGNAL \escolhaProd|Selector8~0_combout\ : std_logic;
SIGNAL \escolhaProd|start_timer~q\ : std_logic;
SIGNAL \escolhaProd|Selector6~0_combout\ : std_logic;
SIGNAL \escolhaProd|Selector6~1_combout\ : std_logic;
SIGNAL \timer|running~0_combout\ : std_logic;
SIGNAL \timer|running~q\ : std_logic;
SIGNAL \timer|counter[0]~1_combout\ : std_logic;
SIGNAL \escolhaProd|NewTime[0]~1_combout\ : std_logic;
SIGNAL \timer|counter[0]~4_combout\ : std_logic;
SIGNAL \timer|counter[0]~5_combout\ : std_logic;
SIGNAL \timer|counter~6_combout\ : std_logic;
SIGNAL \timer|counter~2_combout\ : std_logic;
SIGNAL \timer|counter~3_combout\ : std_logic;
SIGNAL \timer|Add0~0_combout\ : std_logic;
SIGNAL \escolhaProd|Selector4~0_combout\ : std_logic;
SIGNAL \escolhaProd|Selector4~1_combout\ : std_logic;
SIGNAL \timer|counter~0_combout\ : std_logic;
SIGNAL \timer|Equal0~0_combout\ : std_logic;
SIGNAL \timer|time_exp~0_combout\ : std_logic;
SIGNAL \timer|time_exp~q\ : std_logic;
SIGNAL \escolhaProd|Selector14~1_combout\ : std_logic;
SIGNAL \escolhaProd|state.cafe_ready~q\ : std_logic;
SIGNAL \escolhaProd|Selector11~1_combout\ : std_logic;
SIGNAL \escolhaProd|Selector11~2_combout\ : std_logic;
SIGNAL \escolhaProd|state.hold_drinks~q\ : std_logic;
SIGNAL \escolhaProd|Selector0~0_combout\ : std_logic;
SIGNAL \escolhaProd|state~17_combout\ : std_logic;
SIGNAL \escolhaProd|state.start_cha~q\ : std_logic;
SIGNAL \escolhaProd|Selector15~0_combout\ : std_logic;
SIGNAL \escolhaProd|state.cha_ready~q\ : std_logic;
SIGNAL \escolhaProd|state~14_combout\ : std_logic;
SIGNAL \escolhaProd|Selector14~0_combout\ : std_logic;
SIGNAL \escolhaProd|state~15_combout\ : std_logic;
SIGNAL \escolhaProd|state~16_combout\ : std_logic;
SIGNAL \escolhaProd|state.start_cafe~q\ : std_logic;
SIGNAL \escolhaProd|led_r~0_combout\ : std_logic;
SIGNAL \escolhaProd|Selector9~0_combout\ : std_logic;
SIGNAL \escolhaProd|Selector2~0_combout\ : std_logic;
SIGNAL \escolhaProd|Selector0~1_combout\ : std_logic;
SIGNAL \display|Mux26~4_combout\ : std_logic;
SIGNAL \escolhaProd|Selector1~0_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~0_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~1\ : std_logic;
SIGNAL \FreqDiv|Add0~2_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~3\ : std_logic;
SIGNAL \FreqDiv|Add0~4_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~5\ : std_logic;
SIGNAL \FreqDiv|Add0~6_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~7\ : std_logic;
SIGNAL \FreqDiv|Add0~8_combout\ : std_logic;
SIGNAL \FreqDiv|cnt4~5_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~9\ : std_logic;
SIGNAL \FreqDiv|Add0~10_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~11\ : std_logic;
SIGNAL \FreqDiv|Add0~12_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~13\ : std_logic;
SIGNAL \FreqDiv|Add0~14_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~15\ : std_logic;
SIGNAL \FreqDiv|Add0~16_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~17\ : std_logic;
SIGNAL \FreqDiv|Add0~18_combout\ : std_logic;
SIGNAL \FreqDiv|cnt4~4_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~19\ : std_logic;
SIGNAL \FreqDiv|Add0~20_combout\ : std_logic;
SIGNAL \FreqDiv|cnt4~3_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~21\ : std_logic;
SIGNAL \FreqDiv|Add0~22_combout\ : std_logic;
SIGNAL \FreqDiv|cnt4~2_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~23\ : std_logic;
SIGNAL \FreqDiv|Add0~24_combout\ : std_logic;
SIGNAL \FreqDiv|cnt4~1_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~25\ : std_logic;
SIGNAL \FreqDiv|Add0~26_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~27\ : std_logic;
SIGNAL \FreqDiv|Add0~28_combout\ : std_logic;
SIGNAL \FreqDiv|cnt4~0_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~29\ : std_logic;
SIGNAL \FreqDiv|Add0~30_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~31\ : std_logic;
SIGNAL \FreqDiv|Add0~32_combout\ : std_logic;
SIGNAL \FreqDiv|cnt4~6_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~33\ : std_logic;
SIGNAL \FreqDiv|Add0~34_combout\ : std_logic;
SIGNAL \FreqDiv|cnt4~7_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~35\ : std_logic;
SIGNAL \FreqDiv|Add0~36_combout\ : std_logic;
SIGNAL \FreqDiv|cnt4~8_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~37\ : std_logic;
SIGNAL \FreqDiv|Add0~38_combout\ : std_logic;
SIGNAL \FreqDiv|cnt4~9_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~39\ : std_logic;
SIGNAL \FreqDiv|Add0~40_combout\ : std_logic;
SIGNAL \FreqDiv|cnt4~10_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~41\ : std_logic;
SIGNAL \FreqDiv|Add0~42_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~43\ : std_logic;
SIGNAL \FreqDiv|Add0~44_combout\ : std_logic;
SIGNAL \FreqDiv|cnt4~11_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~45\ : std_logic;
SIGNAL \FreqDiv|Add0~46_combout\ : std_logic;
SIGNAL \FreqDiv|Equal0~6_combout\ : std_logic;
SIGNAL \FreqDiv|Equal0~5_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~47\ : std_logic;
SIGNAL \FreqDiv|Add0~48_combout\ : std_logic;
SIGNAL \FreqDiv|Add0~49\ : std_logic;
SIGNAL \FreqDiv|Add0~50_combout\ : std_logic;
SIGNAL \FreqDiv|Equal0~7_combout\ : std_logic;
SIGNAL \FreqDiv|Equal0~2_combout\ : std_logic;
SIGNAL \FreqDiv|Equal0~3_combout\ : std_logic;
SIGNAL \FreqDiv|Equal0~0_combout\ : std_logic;
SIGNAL \FreqDiv|Equal0~1_combout\ : std_logic;
SIGNAL \FreqDiv|Equal0~4_combout\ : std_logic;
SIGNAL \FreqDiv|Equal0~8_combout\ : std_logic;
SIGNAL \FreqDiv|s_clk4hz~0_combout\ : std_logic;
SIGNAL \FreqDiv|s_clk4hz~q\ : std_logic;
SIGNAL \escolhaProd|Selector3~0_combout\ : std_logic;
SIGNAL \display|Mux27~0_combout\ : std_logic;
SIGNAL \display|Mux26~5_combout\ : std_logic;
SIGNAL \display|Mux26~6_combout\ : std_logic;
SIGNAL \display|Mux13~0_combout\ : std_logic;
SIGNAL \display|Mux25~0_combout\ : std_logic;
SIGNAL \display|Mux24~0_combout\ : std_logic;
SIGNAL \display|Mux24~1_combout\ : std_logic;
SIGNAL \display|Mux21~0_combout\ : std_logic;
SIGNAL \display|Mux20~0_combout\ : std_logic;
SIGNAL \display|Mux19~0_combout\ : std_logic;
SIGNAL \display|Mux18~0_combout\ : std_logic;
SIGNAL \display|Mux16~0_combout\ : std_logic;
SIGNAL \display|Mux16~1_combout\ : std_logic;
SIGNAL \display|Mux13~1_combout\ : std_logic;
SIGNAL \display|Mux13~2_combout\ : std_logic;
SIGNAL \escolhaProd|NewTime\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \escolhaProd|led_r\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \debouncer|s_debounceCnt\ : std_logic_vector(18 DOWNTO 0);
SIGNAL \timer|counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \escolhaProd|led_g\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \escolhaProd|select_word\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \FreqDiv|cnt4\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \debouncer|ALT_INV_s_pulsedOut~q\ : std_logic;
SIGNAL \display|ALT_INV_Mux18~0_combout\ : std_logic;
SIGNAL \display|ALT_INV_Mux19~0_combout\ : std_logic;
SIGNAL \display|ALT_INV_Mux20~0_combout\ : std_logic;
SIGNAL \display|ALT_INV_Mux21~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
ww_SW <= SW;
LEDR <= ww_LEDR;
LEDG <= ww_LEDG;
HEX0 <= ww_HEX0;
HEX1 <= ww_HEX1;
HEX2 <= ww_HEX2;
HEX3 <= ww_HEX3;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);
\debouncer|ALT_INV_s_pulsedOut~q\ <= NOT \debouncer|s_pulsedOut~q\;
\display|ALT_INV_Mux18~0_combout\ <= NOT \display|Mux18~0_combout\;
\display|ALT_INV_Mux19~0_combout\ <= NOT \display|Mux19~0_combout\;
\display|ALT_INV_Mux20~0_combout\ <= NOT \display|Mux20~0_combout\;
\display|ALT_INV_Mux21~0_combout\ <= NOT \display|Mux21~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X69_Y73_N16
\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \escolhaProd|led_r\(0),
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

-- Location: IOOBUF_X107_Y73_N9
\LEDG[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \escolhaProd|led_g\(0),
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
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[1]~output_o\);

-- Location: IOOBUF_X69_Y73_N23
\HEX0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|Mux27~0_combout\,
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
	i => \display|Mux26~6_combout\,
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
	i => \display|Mux25~0_combout\,
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
	i => \display|Mux24~1_combout\,
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
	i => \display|Mux24~1_combout\,
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
	i => \display|Mux24~1_combout\,
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
	i => \display|ALT_INV_Mux21~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[6]~output_o\);

-- Location: IOOBUF_X115_Y41_N2
\HEX1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|ALT_INV_Mux20~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[0]~output_o\);

-- Location: IOOBUF_X115_Y30_N9
\HEX1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|ALT_INV_Mux19~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[1]~output_o\);

-- Location: IOOBUF_X115_Y25_N23
\HEX1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|ALT_INV_Mux18~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[2]~output_o\);

-- Location: IOOBUF_X115_Y30_N2
\HEX1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|Mux24~1_combout\,
	devoe => ww_devoe,
	o => \HEX1[3]~output_o\);

-- Location: IOOBUF_X115_Y20_N9
\HEX1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|Mux16~1_combout\,
	devoe => ww_devoe,
	o => \HEX1[4]~output_o\);

-- Location: IOOBUF_X115_Y22_N2
\HEX1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|Mux16~1_combout\,
	devoe => ww_devoe,
	o => \HEX1[5]~output_o\);

-- Location: IOOBUF_X115_Y28_N9
\HEX1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|ALT_INV_Mux20~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[6]~output_o\);

-- Location: IOOBUF_X115_Y17_N9
\HEX2[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|Mux13~2_combout\,
	devoe => ww_devoe,
	o => \HEX2[0]~output_o\);

-- Location: IOOBUF_X115_Y16_N2
\HEX2[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|ALT_INV_Mux18~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[1]~output_o\);

-- Location: IOOBUF_X115_Y19_N9
\HEX2[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|ALT_INV_Mux20~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[2]~output_o\);

-- Location: IOOBUF_X115_Y19_N2
\HEX2[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|Mux25~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[3]~output_o\);

-- Location: IOOBUF_X115_Y18_N2
\HEX2[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|Mux16~1_combout\,
	devoe => ww_devoe,
	o => \HEX2[4]~output_o\);

-- Location: IOOBUF_X115_Y20_N2
\HEX2[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|Mux16~1_combout\,
	devoe => ww_devoe,
	o => \HEX2[5]~output_o\);

-- Location: IOOBUF_X115_Y21_N16
\HEX2[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|Mux24~1_combout\,
	devoe => ww_devoe,
	o => \HEX2[6]~output_o\);

-- Location: IOOBUF_X115_Y25_N16
\HEX3[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|ALT_INV_Mux20~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[0]~output_o\);

-- Location: IOOBUF_X115_Y29_N2
\HEX3[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|Mux26~6_combout\,
	devoe => ww_devoe,
	o => \HEX3[1]~output_o\);

-- Location: IOOBUF_X100_Y0_N2
\HEX3[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|Mux26~6_combout\,
	devoe => ww_devoe,
	o => \HEX3[2]~output_o\);

-- Location: IOOBUF_X111_Y0_N2
\HEX3[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|ALT_INV_Mux20~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[3]~output_o\);

-- Location: IOOBUF_X105_Y0_N23
\HEX3[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|Mux16~1_combout\,
	devoe => ww_devoe,
	o => \HEX3[4]~output_o\);

-- Location: IOOBUF_X105_Y0_N9
\HEX3[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|Mux16~1_combout\,
	devoe => ww_devoe,
	o => \HEX3[5]~output_o\);

-- Location: IOOBUF_X105_Y0_N2
\HEX3[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|Mux25~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[6]~output_o\);

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

-- Location: LCCOMB_X113_Y26_N14
\debouncer|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Add0~0_combout\ = \debouncer|s_debounceCnt\(0) $ (VCC)
-- \debouncer|Add0~1\ = CARRY(\debouncer|s_debounceCnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|s_debounceCnt\(0),
	datad => VCC,
	combout => \debouncer|Add0~0_combout\,
	cout => \debouncer|Add0~1\);

-- Location: IOIBUF_X115_Y40_N8
\KEY[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: FF_X114_Y25_N5
\debouncer|s_dirtyIn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_dirtyIn~q\);

-- Location: FF_X114_Y25_N27
\debouncer|s_previousIn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \debouncer|s_dirtyIn~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_previousIn~q\);

-- Location: LCCOMB_X113_Y26_N16
\debouncer|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Add0~2_combout\ = (\debouncer|s_debounceCnt\(1) & (\debouncer|Add0~1\ & VCC)) # (!\debouncer|s_debounceCnt\(1) & (!\debouncer|Add0~1\))
-- \debouncer|Add0~3\ = CARRY((!\debouncer|s_debounceCnt\(1) & !\debouncer|Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_debounceCnt\(1),
	datad => VCC,
	cin => \debouncer|Add0~1\,
	combout => \debouncer|Add0~2_combout\,
	cout => \debouncer|Add0~3\);

-- Location: LCCOMB_X113_Y26_N12
\debouncer|s_debounceCnt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt~6_combout\ = (\debouncer|Add0~2_combout\ & (\debouncer|s_previousIn~q\ & \debouncer|s_debounceCnt[4]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|Add0~2_combout\,
	datac => \debouncer|s_previousIn~q\,
	datad => \debouncer|s_debounceCnt[4]~0_combout\,
	combout => \debouncer|s_debounceCnt~6_combout\);

-- Location: FF_X113_Y26_N13
\debouncer|s_debounceCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debouncer|s_debounceCnt~6_combout\,
	ena => \debouncer|s_debounceCnt[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_debounceCnt\(1));

-- Location: LCCOMB_X113_Y26_N18
\debouncer|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Add0~4_combout\ = (\debouncer|s_debounceCnt\(2) & ((GND) # (!\debouncer|Add0~3\))) # (!\debouncer|s_debounceCnt\(2) & (\debouncer|Add0~3\ $ (GND)))
-- \debouncer|Add0~5\ = CARRY((\debouncer|s_debounceCnt\(2)) # (!\debouncer|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|s_debounceCnt\(2),
	datad => VCC,
	cin => \debouncer|Add0~3\,
	combout => \debouncer|Add0~4_combout\,
	cout => \debouncer|Add0~5\);

-- Location: LCCOMB_X113_Y26_N2
\debouncer|s_debounceCnt~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt~7_combout\ = (\debouncer|Add0~4_combout\ & (\debouncer|s_previousIn~q\ & \debouncer|s_debounceCnt[4]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|Add0~4_combout\,
	datac => \debouncer|s_previousIn~q\,
	datad => \debouncer|s_debounceCnt[4]~0_combout\,
	combout => \debouncer|s_debounceCnt~7_combout\);

-- Location: FF_X113_Y26_N3
\debouncer|s_debounceCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debouncer|s_debounceCnt~7_combout\,
	ena => \debouncer|s_debounceCnt[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_debounceCnt\(2));

-- Location: LCCOMB_X113_Y26_N20
\debouncer|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Add0~6_combout\ = (\debouncer|s_debounceCnt\(3) & (\debouncer|Add0~5\ & VCC)) # (!\debouncer|s_debounceCnt\(3) & (!\debouncer|Add0~5\))
-- \debouncer|Add0~7\ = CARRY((!\debouncer|s_debounceCnt\(3) & !\debouncer|Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|s_debounceCnt\(3),
	datad => VCC,
	cin => \debouncer|Add0~5\,
	combout => \debouncer|Add0~6_combout\,
	cout => \debouncer|Add0~7\);

-- Location: LCCOMB_X113_Y26_N4
\debouncer|s_debounceCnt~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt~8_combout\ = (\debouncer|Add0~6_combout\ & (\debouncer|s_previousIn~q\ & \debouncer|s_debounceCnt[4]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|Add0~6_combout\,
	datac => \debouncer|s_previousIn~q\,
	datad => \debouncer|s_debounceCnt[4]~0_combout\,
	combout => \debouncer|s_debounceCnt~8_combout\);

-- Location: FF_X113_Y26_N5
\debouncer|s_debounceCnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debouncer|s_debounceCnt~8_combout\,
	ena => \debouncer|s_debounceCnt[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_debounceCnt\(3));

-- Location: LCCOMB_X113_Y26_N22
\debouncer|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Add0~8_combout\ = (\debouncer|s_debounceCnt\(4) & ((GND) # (!\debouncer|Add0~7\))) # (!\debouncer|s_debounceCnt\(4) & (\debouncer|Add0~7\ $ (GND)))
-- \debouncer|Add0~9\ = CARRY((\debouncer|s_debounceCnt\(4)) # (!\debouncer|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_debounceCnt\(4),
	datad => VCC,
	cin => \debouncer|Add0~7\,
	combout => \debouncer|Add0~8_combout\,
	cout => \debouncer|Add0~9\);

-- Location: LCCOMB_X113_Y26_N6
\debouncer|s_debounceCnt~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt~9_combout\ = (\debouncer|s_previousIn~q\ & (\debouncer|Add0~8_combout\ & \debouncer|s_debounceCnt[4]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|s_previousIn~q\,
	datac => \debouncer|Add0~8_combout\,
	datad => \debouncer|s_debounceCnt[4]~0_combout\,
	combout => \debouncer|s_debounceCnt~9_combout\);

-- Location: FF_X113_Y26_N7
\debouncer|s_debounceCnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debouncer|s_debounceCnt~9_combout\,
	ena => \debouncer|s_debounceCnt[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_debounceCnt\(4));

-- Location: LCCOMB_X113_Y26_N24
\debouncer|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Add0~10_combout\ = (\debouncer|s_debounceCnt\(5) & (\debouncer|Add0~9\ & VCC)) # (!\debouncer|s_debounceCnt\(5) & (!\debouncer|Add0~9\))
-- \debouncer|Add0~11\ = CARRY((!\debouncer|s_debounceCnt\(5) & !\debouncer|Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_debounceCnt\(5),
	datad => VCC,
	cin => \debouncer|Add0~9\,
	combout => \debouncer|Add0~10_combout\,
	cout => \debouncer|Add0~11\);

-- Location: LCCOMB_X113_Y26_N10
\debouncer|s_debounceCnt~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt~16_combout\ = (\debouncer|s_debounceCnt[4]~0_combout\ & ((\debouncer|Add0~10_combout\) # (!\debouncer|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|Add0~10_combout\,
	datac => \debouncer|s_previousIn~q\,
	datad => \debouncer|s_debounceCnt[4]~0_combout\,
	combout => \debouncer|s_debounceCnt~16_combout\);

-- Location: FF_X113_Y26_N11
\debouncer|s_debounceCnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debouncer|s_debounceCnt~16_combout\,
	ena => \debouncer|s_debounceCnt[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_debounceCnt\(5));

-- Location: LCCOMB_X113_Y26_N26
\debouncer|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Add0~12_combout\ = (\debouncer|s_debounceCnt\(6) & ((GND) # (!\debouncer|Add0~11\))) # (!\debouncer|s_debounceCnt\(6) & (\debouncer|Add0~11\ $ (GND)))
-- \debouncer|Add0~13\ = CARRY((\debouncer|s_debounceCnt\(6)) # (!\debouncer|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|s_debounceCnt\(6),
	datad => VCC,
	cin => \debouncer|Add0~11\,
	combout => \debouncer|Add0~12_combout\,
	cout => \debouncer|Add0~13\);

-- Location: LCCOMB_X114_Y25_N2
\debouncer|s_debounceCnt~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt~10_combout\ = (\debouncer|s_debounceCnt[4]~0_combout\ & (\debouncer|Add0~12_combout\ & \debouncer|s_previousIn~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|s_debounceCnt[4]~0_combout\,
	datac => \debouncer|Add0~12_combout\,
	datad => \debouncer|s_previousIn~q\,
	combout => \debouncer|s_debounceCnt~10_combout\);

-- Location: FF_X114_Y25_N3
\debouncer|s_debounceCnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debouncer|s_debounceCnt~10_combout\,
	ena => \debouncer|s_debounceCnt[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_debounceCnt\(6));

-- Location: LCCOMB_X113_Y26_N28
\debouncer|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Add0~14_combout\ = (\debouncer|s_debounceCnt\(7) & (\debouncer|Add0~13\ & VCC)) # (!\debouncer|s_debounceCnt\(7) & (!\debouncer|Add0~13\))
-- \debouncer|Add0~15\ = CARRY((!\debouncer|s_debounceCnt\(7) & !\debouncer|Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_debounceCnt\(7),
	datad => VCC,
	cin => \debouncer|Add0~13\,
	combout => \debouncer|Add0~14_combout\,
	cout => \debouncer|Add0~15\);

-- Location: LCCOMB_X114_Y25_N0
\debouncer|s_debounceCnt~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt~11_combout\ = (\debouncer|Add0~14_combout\ & (\debouncer|s_debounceCnt[4]~0_combout\ & \debouncer|s_previousIn~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|Add0~14_combout\,
	datab => \debouncer|s_debounceCnt[4]~0_combout\,
	datad => \debouncer|s_previousIn~q\,
	combout => \debouncer|s_debounceCnt~11_combout\);

-- Location: FF_X114_Y25_N1
\debouncer|s_debounceCnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debouncer|s_debounceCnt~11_combout\,
	ena => \debouncer|s_debounceCnt[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_debounceCnt\(7));

-- Location: LCCOMB_X113_Y26_N30
\debouncer|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Add0~16_combout\ = (\debouncer|s_debounceCnt\(8) & ((GND) # (!\debouncer|Add0~15\))) # (!\debouncer|s_debounceCnt\(8) & (\debouncer|Add0~15\ $ (GND)))
-- \debouncer|Add0~17\ = CARRY((\debouncer|s_debounceCnt\(8)) # (!\debouncer|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|s_debounceCnt\(8),
	datad => VCC,
	cin => \debouncer|Add0~15\,
	combout => \debouncer|Add0~16_combout\,
	cout => \debouncer|Add0~17\);

-- Location: LCCOMB_X114_Y25_N14
\debouncer|s_debounceCnt~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt~17_combout\ = (\debouncer|s_debounceCnt[4]~0_combout\ & ((\debouncer|Add0~16_combout\) # (!\debouncer|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|s_previousIn~q\,
	datac => \debouncer|Add0~16_combout\,
	datad => \debouncer|s_debounceCnt[4]~0_combout\,
	combout => \debouncer|s_debounceCnt~17_combout\);

-- Location: FF_X114_Y25_N15
\debouncer|s_debounceCnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debouncer|s_debounceCnt~17_combout\,
	ena => \debouncer|s_debounceCnt[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_debounceCnt\(8));

-- Location: LCCOMB_X113_Y25_N0
\debouncer|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Add0~18_combout\ = (\debouncer|s_debounceCnt\(9) & (\debouncer|Add0~17\ & VCC)) # (!\debouncer|s_debounceCnt\(9) & (!\debouncer|Add0~17\))
-- \debouncer|Add0~19\ = CARRY((!\debouncer|s_debounceCnt\(9) & !\debouncer|Add0~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_debounceCnt\(9),
	datad => VCC,
	cin => \debouncer|Add0~17\,
	combout => \debouncer|Add0~18_combout\,
	cout => \debouncer|Add0~19\);

-- Location: LCCOMB_X112_Y25_N12
\debouncer|s_debounceCnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt~1_combout\ = (\debouncer|s_previousIn~q\ & (\debouncer|Add0~18_combout\ & \debouncer|s_debounceCnt[4]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_previousIn~q\,
	datac => \debouncer|Add0~18_combout\,
	datad => \debouncer|s_debounceCnt[4]~0_combout\,
	combout => \debouncer|s_debounceCnt~1_combout\);

-- Location: FF_X112_Y25_N13
\debouncer|s_debounceCnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debouncer|s_debounceCnt~1_combout\,
	ena => \debouncer|s_debounceCnt[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_debounceCnt\(9));

-- Location: LCCOMB_X113_Y25_N2
\debouncer|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Add0~20_combout\ = (\debouncer|s_debounceCnt\(10) & ((GND) # (!\debouncer|Add0~19\))) # (!\debouncer|s_debounceCnt\(10) & (\debouncer|Add0~19\ $ (GND)))
-- \debouncer|Add0~21\ = CARRY((\debouncer|s_debounceCnt\(10)) # (!\debouncer|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|s_debounceCnt\(10),
	datad => VCC,
	cin => \debouncer|Add0~19\,
	combout => \debouncer|Add0~20_combout\,
	cout => \debouncer|Add0~21\);

-- Location: LCCOMB_X112_Y25_N30
\debouncer|s_debounceCnt~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt~3_combout\ = (\debouncer|s_previousIn~q\ & (\debouncer|s_debounceCnt[4]~0_combout\ & \debouncer|Add0~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_previousIn~q\,
	datac => \debouncer|s_debounceCnt[4]~0_combout\,
	datad => \debouncer|Add0~20_combout\,
	combout => \debouncer|s_debounceCnt~3_combout\);

-- Location: FF_X112_Y25_N31
\debouncer|s_debounceCnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debouncer|s_debounceCnt~3_combout\,
	ena => \debouncer|s_debounceCnt[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_debounceCnt\(10));

-- Location: LCCOMB_X113_Y25_N4
\debouncer|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Add0~22_combout\ = (\debouncer|s_debounceCnt\(11) & (\debouncer|Add0~21\ & VCC)) # (!\debouncer|s_debounceCnt\(11) & (!\debouncer|Add0~21\))
-- \debouncer|Add0~23\ = CARRY((!\debouncer|s_debounceCnt\(11) & !\debouncer|Add0~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_debounceCnt\(11),
	datad => VCC,
	cin => \debouncer|Add0~21\,
	combout => \debouncer|Add0~22_combout\,
	cout => \debouncer|Add0~23\);

-- Location: LCCOMB_X112_Y25_N8
\debouncer|s_debounceCnt~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt~4_combout\ = (\debouncer|s_previousIn~q\ & (\debouncer|s_debounceCnt[4]~0_combout\ & \debouncer|Add0~22_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_previousIn~q\,
	datac => \debouncer|s_debounceCnt[4]~0_combout\,
	datad => \debouncer|Add0~22_combout\,
	combout => \debouncer|s_debounceCnt~4_combout\);

-- Location: FF_X112_Y25_N9
\debouncer|s_debounceCnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debouncer|s_debounceCnt~4_combout\,
	ena => \debouncer|s_debounceCnt[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_debounceCnt\(11));

-- Location: LCCOMB_X113_Y25_N6
\debouncer|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Add0~24_combout\ = (\debouncer|s_debounceCnt\(12) & ((GND) # (!\debouncer|Add0~23\))) # (!\debouncer|s_debounceCnt\(12) & (\debouncer|Add0~23\ $ (GND)))
-- \debouncer|Add0~25\ = CARRY((\debouncer|s_debounceCnt\(12)) # (!\debouncer|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|s_debounceCnt\(12),
	datad => VCC,
	cin => \debouncer|Add0~23\,
	combout => \debouncer|Add0~24_combout\,
	cout => \debouncer|Add0~25\);

-- Location: LCCOMB_X112_Y25_N6
\debouncer|s_debounceCnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt~5_combout\ = (\debouncer|s_previousIn~q\ & (\debouncer|s_debounceCnt[4]~0_combout\ & \debouncer|Add0~24_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_previousIn~q\,
	datac => \debouncer|s_debounceCnt[4]~0_combout\,
	datad => \debouncer|Add0~24_combout\,
	combout => \debouncer|s_debounceCnt~5_combout\);

-- Location: FF_X112_Y25_N7
\debouncer|s_debounceCnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debouncer|s_debounceCnt~5_combout\,
	ena => \debouncer|s_debounceCnt[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_debounceCnt\(12));

-- Location: LCCOMB_X113_Y25_N8
\debouncer|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Add0~26_combout\ = (\debouncer|s_debounceCnt\(13) & (\debouncer|Add0~25\ & VCC)) # (!\debouncer|s_debounceCnt\(13) & (!\debouncer|Add0~25\))
-- \debouncer|Add0~27\ = CARRY((!\debouncer|s_debounceCnt\(13) & !\debouncer|Add0~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|s_debounceCnt\(13),
	datad => VCC,
	cin => \debouncer|Add0~25\,
	combout => \debouncer|Add0~26_combout\,
	cout => \debouncer|Add0~27\);

-- Location: LCCOMB_X113_Y25_N28
\debouncer|s_debounceCnt~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt~12_combout\ = (\debouncer|s_debounceCnt[4]~0_combout\ & ((\debouncer|Add0~26_combout\) # (!\debouncer|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_previousIn~q\,
	datac => \debouncer|Add0~26_combout\,
	datad => \debouncer|s_debounceCnt[4]~0_combout\,
	combout => \debouncer|s_debounceCnt~12_combout\);

-- Location: FF_X113_Y25_N29
\debouncer|s_debounceCnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debouncer|s_debounceCnt~12_combout\,
	ena => \debouncer|s_debounceCnt[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_debounceCnt\(13));

-- Location: LCCOMB_X113_Y25_N10
\debouncer|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Add0~28_combout\ = (\debouncer|s_debounceCnt\(14) & ((GND) # (!\debouncer|Add0~27\))) # (!\debouncer|s_debounceCnt\(14) & (\debouncer|Add0~27\ $ (GND)))
-- \debouncer|Add0~29\ = CARRY((\debouncer|s_debounceCnt\(14)) # (!\debouncer|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_debounceCnt\(14),
	datad => VCC,
	cin => \debouncer|Add0~27\,
	combout => \debouncer|Add0~28_combout\,
	cout => \debouncer|Add0~29\);

-- Location: LCCOMB_X113_Y25_N26
\debouncer|s_debounceCnt~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt~13_combout\ = (\debouncer|Add0~28_combout\ & (\debouncer|s_previousIn~q\ & \debouncer|s_debounceCnt[4]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|Add0~28_combout\,
	datac => \debouncer|s_previousIn~q\,
	datad => \debouncer|s_debounceCnt[4]~0_combout\,
	combout => \debouncer|s_debounceCnt~13_combout\);

-- Location: FF_X113_Y25_N27
\debouncer|s_debounceCnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debouncer|s_debounceCnt~13_combout\,
	ena => \debouncer|s_debounceCnt[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_debounceCnt\(14));

-- Location: LCCOMB_X113_Y25_N12
\debouncer|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Add0~30_combout\ = (\debouncer|s_debounceCnt\(15) & (\debouncer|Add0~29\ & VCC)) # (!\debouncer|s_debounceCnt\(15) & (!\debouncer|Add0~29\))
-- \debouncer|Add0~31\ = CARRY((!\debouncer|s_debounceCnt\(15) & !\debouncer|Add0~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|s_debounceCnt\(15),
	datad => VCC,
	cin => \debouncer|Add0~29\,
	combout => \debouncer|Add0~30_combout\,
	cout => \debouncer|Add0~31\);

-- Location: LCCOMB_X113_Y25_N24
\debouncer|s_debounceCnt[15]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt[15]~14_combout\ = (\debouncer|s_debounceCnt[4]~2_combout\ & (\debouncer|s_debounceCnt[4]~0_combout\ & ((\debouncer|Add0~30_combout\) # (!\debouncer|s_previousIn~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|Add0~30_combout\,
	datab => \debouncer|s_debounceCnt[4]~2_combout\,
	datac => \debouncer|s_previousIn~q\,
	datad => \debouncer|s_debounceCnt[4]~0_combout\,
	combout => \debouncer|s_debounceCnt[15]~14_combout\);

-- Location: FF_X113_Y25_N25
\debouncer|s_debounceCnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debouncer|s_debounceCnt[15]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_debounceCnt\(15));

-- Location: LCCOMB_X113_Y25_N14
\debouncer|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Add0~32_combout\ = (\debouncer|s_debounceCnt\(16) & ((GND) # (!\debouncer|Add0~31\))) # (!\debouncer|s_debounceCnt\(16) & (\debouncer|Add0~31\ $ (GND)))
-- \debouncer|Add0~33\ = CARRY((\debouncer|s_debounceCnt\(16)) # (!\debouncer|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_debounceCnt\(16),
	datad => VCC,
	cin => \debouncer|Add0~31\,
	combout => \debouncer|Add0~32_combout\,
	cout => \debouncer|Add0~33\);

-- Location: LCCOMB_X113_Y25_N16
\debouncer|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Add0~34_combout\ = (\debouncer|s_debounceCnt\(17) & (\debouncer|Add0~33\ & VCC)) # (!\debouncer|s_debounceCnt\(17) & (!\debouncer|Add0~33\))
-- \debouncer|Add0~35\ = CARRY((!\debouncer|s_debounceCnt\(17) & !\debouncer|Add0~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_debounceCnt\(17),
	datad => VCC,
	cin => \debouncer|Add0~33\,
	combout => \debouncer|Add0~34_combout\,
	cout => \debouncer|Add0~35\);

-- Location: LCCOMB_X112_Y25_N28
\debouncer|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|LessThan0~0_combout\ = (!\debouncer|s_debounceCnt\(12) & (!\debouncer|s_debounceCnt\(11) & (!\debouncer|s_debounceCnt\(10) & !\debouncer|s_debounceCnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_debounceCnt\(12),
	datab => \debouncer|s_debounceCnt\(11),
	datac => \debouncer|s_debounceCnt\(10),
	datad => \debouncer|s_debounceCnt\(9),
	combout => \debouncer|LessThan0~0_combout\);

-- Location: LCCOMB_X114_Y25_N16
\debouncer|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|LessThan0~1_combout\ = (!\debouncer|s_debounceCnt\(6) & !\debouncer|s_debounceCnt\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|s_debounceCnt\(6),
	datad => \debouncer|s_debounceCnt\(7),
	combout => \debouncer|LessThan0~1_combout\);

-- Location: LCCOMB_X113_Y25_N20
\debouncer|s_pulsedOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_pulsedOut~1_combout\ = (!\debouncer|s_debounceCnt\(14) & (!\debouncer|s_debounceCnt\(13) & (!\debouncer|s_debounceCnt\(16) & !\debouncer|s_debounceCnt\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_debounceCnt\(14),
	datab => \debouncer|s_debounceCnt\(13),
	datac => \debouncer|s_debounceCnt\(16),
	datad => \debouncer|s_debounceCnt\(15),
	combout => \debouncer|s_pulsedOut~1_combout\);

-- Location: LCCOMB_X114_Y25_N30
\debouncer|s_pulsedOut~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_pulsedOut~2_combout\ = (!\debouncer|s_debounceCnt\(5) & (\debouncer|LessThan0~1_combout\ & (!\debouncer|s_debounceCnt\(8) & \debouncer|s_pulsedOut~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_debounceCnt\(5),
	datab => \debouncer|LessThan0~1_combout\,
	datac => \debouncer|s_debounceCnt\(8),
	datad => \debouncer|s_pulsedOut~1_combout\,
	combout => \debouncer|s_pulsedOut~2_combout\);

-- Location: LCCOMB_X113_Y26_N0
\debouncer|s_pulsedOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_pulsedOut~0_combout\ = (!\debouncer|s_debounceCnt\(4) & (!\debouncer|s_debounceCnt\(2) & (!\debouncer|s_debounceCnt\(3) & !\debouncer|s_debounceCnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_debounceCnt\(4),
	datab => \debouncer|s_debounceCnt\(2),
	datac => \debouncer|s_debounceCnt\(3),
	datad => \debouncer|s_debounceCnt\(1),
	combout => \debouncer|s_pulsedOut~0_combout\);

-- Location: LCCOMB_X114_Y25_N24
\debouncer|s_pulsedOut~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_pulsedOut~3_combout\ = (\debouncer|LessThan0~0_combout\ & (!\debouncer|s_debounceCnt\(17) & (\debouncer|s_pulsedOut~2_combout\ & \debouncer|s_pulsedOut~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|LessThan0~0_combout\,
	datab => \debouncer|s_debounceCnt\(17),
	datac => \debouncer|s_pulsedOut~2_combout\,
	datad => \debouncer|s_pulsedOut~0_combout\,
	combout => \debouncer|s_pulsedOut~3_combout\);

-- Location: LCCOMB_X114_Y25_N12
\debouncer|s_debounceCnt[17]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt[17]~18_combout\ = (\debouncer|s_debounceCnt\(18)) # ((\debouncer|s_debounceCnt\(0)) # (!\debouncer|s_pulsedOut~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|s_debounceCnt\(18),
	datac => \debouncer|s_debounceCnt\(0),
	datad => \debouncer|s_pulsedOut~3_combout\,
	combout => \debouncer|s_debounceCnt[17]~18_combout\);

-- Location: LCCOMB_X113_Y25_N22
\debouncer|s_debounceCnt[17]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt[17]~19_combout\ = (\debouncer|s_debounceCnt[4]~0_combout\ & (((\debouncer|Add0~34_combout\ & \debouncer|s_debounceCnt[17]~18_combout\)) # (!\debouncer|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_previousIn~q\,
	datab => \debouncer|Add0~34_combout\,
	datac => \debouncer|s_debounceCnt[17]~18_combout\,
	datad => \debouncer|s_debounceCnt[4]~0_combout\,
	combout => \debouncer|s_debounceCnt[17]~19_combout\);

-- Location: FF_X113_Y25_N23
\debouncer|s_debounceCnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debouncer|s_debounceCnt[17]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_debounceCnt\(17));

-- Location: LCCOMB_X114_Y25_N20
\debouncer|LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|LessThan0~2_combout\ = ((\debouncer|s_debounceCnt\(5) & ((\debouncer|s_debounceCnt\(0)) # (!\debouncer|s_pulsedOut~0_combout\)))) # (!\debouncer|LessThan0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_debounceCnt\(0),
	datab => \debouncer|LessThan0~1_combout\,
	datac => \debouncer|s_debounceCnt\(5),
	datad => \debouncer|s_pulsedOut~0_combout\,
	combout => \debouncer|LessThan0~2_combout\);

-- Location: LCCOMB_X114_Y25_N10
\debouncer|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|LessThan0~3_combout\ = (\debouncer|s_debounceCnt\(13) & (((\debouncer|s_debounceCnt\(8) & \debouncer|LessThan0~2_combout\)) # (!\debouncer|LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_debounceCnt\(8),
	datab => \debouncer|s_debounceCnt\(13),
	datac => \debouncer|LessThan0~0_combout\,
	datad => \debouncer|LessThan0~2_combout\,
	combout => \debouncer|LessThan0~3_combout\);

-- Location: LCCOMB_X114_Y25_N6
\debouncer|s_debounceCnt[18]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt[18]~22_combout\ = (((!\debouncer|s_debounceCnt\(14) & !\debouncer|LessThan0~3_combout\)) # (!\debouncer|s_debounceCnt\(16))) # (!\debouncer|s_debounceCnt\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_debounceCnt\(14),
	datab => \debouncer|s_debounceCnt\(15),
	datac => \debouncer|s_debounceCnt\(16),
	datad => \debouncer|LessThan0~3_combout\,
	combout => \debouncer|s_debounceCnt[18]~22_combout\);

-- Location: LCCOMB_X114_Y25_N4
\debouncer|s_debounceCnt[18]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt[18]~23_combout\ = (\debouncer|s_dirtyIn~q\ & (((\debouncer|s_debounceCnt[18]~22_combout\) # (!\debouncer|s_debounceCnt\(18))) # (!\debouncer|s_debounceCnt\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_debounceCnt\(17),
	datab => \debouncer|s_debounceCnt\(18),
	datac => \debouncer|s_dirtyIn~q\,
	datad => \debouncer|s_debounceCnt[18]~22_combout\,
	combout => \debouncer|s_debounceCnt[18]~23_combout\);

-- Location: LCCOMB_X113_Y25_N18
\debouncer|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Add0~36_combout\ = \debouncer|Add0~35\ $ (\debouncer|s_debounceCnt\(18))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \debouncer|s_debounceCnt\(18),
	cin => \debouncer|Add0~35\,
	combout => \debouncer|Add0~36_combout\);

-- Location: LCCOMB_X114_Y25_N28
\debouncer|s_debounceCnt[18]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt[18]~21_combout\ = (\debouncer|Add0~36_combout\ & ((\debouncer|s_debounceCnt\(18)) # ((\debouncer|s_debounceCnt\(0)) # (!\debouncer|s_pulsedOut~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_debounceCnt\(18),
	datab => \debouncer|s_pulsedOut~3_combout\,
	datac => \debouncer|s_debounceCnt\(0),
	datad => \debouncer|Add0~36_combout\,
	combout => \debouncer|s_debounceCnt[18]~21_combout\);

-- Location: LCCOMB_X114_Y25_N22
\debouncer|s_debounceCnt[18]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt[18]~24_combout\ = (\debouncer|s_previousIn~q\ & (((\debouncer|s_debounceCnt[18]~23_combout\ & \debouncer|s_debounceCnt[18]~21_combout\)))) # (!\debouncer|s_previousIn~q\ & (\debouncer|s_debounceCnt[4]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_previousIn~q\,
	datab => \debouncer|s_debounceCnt[4]~0_combout\,
	datac => \debouncer|s_debounceCnt[18]~23_combout\,
	datad => \debouncer|s_debounceCnt[18]~21_combout\,
	combout => \debouncer|s_debounceCnt[18]~24_combout\);

-- Location: FF_X114_Y25_N23
\debouncer|s_debounceCnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debouncer|s_debounceCnt[18]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_debounceCnt\(18));

-- Location: LCCOMB_X114_Y25_N26
\debouncer|s_pulsedOut~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_pulsedOut~4_combout\ = (\debouncer|s_dirtyIn~q\ & (\debouncer|s_previousIn~q\ & !\debouncer|s_debounceCnt\(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|s_dirtyIn~q\,
	datac => \debouncer|s_previousIn~q\,
	datad => \debouncer|s_debounceCnt\(18),
	combout => \debouncer|s_pulsedOut~4_combout\);

-- Location: LCCOMB_X114_Y25_N8
\debouncer|s_debounceCnt[4]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt[4]~2_combout\ = (\debouncer|s_debounceCnt\(0)) # ((!\debouncer|s_pulsedOut~3_combout\) # (!\debouncer|s_pulsedOut~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_debounceCnt\(0),
	datac => \debouncer|s_pulsedOut~4_combout\,
	datad => \debouncer|s_pulsedOut~3_combout\,
	combout => \debouncer|s_debounceCnt[4]~2_combout\);

-- Location: LCCOMB_X113_Y25_N30
\debouncer|s_debounceCnt[16]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt[16]~15_combout\ = (\debouncer|s_debounceCnt[4]~2_combout\ & (\debouncer|s_debounceCnt[4]~0_combout\ & ((\debouncer|Add0~32_combout\) # (!\debouncer|s_previousIn~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_previousIn~q\,
	datab => \debouncer|s_debounceCnt[4]~2_combout\,
	datac => \debouncer|Add0~32_combout\,
	datad => \debouncer|s_debounceCnt[4]~0_combout\,
	combout => \debouncer|s_debounceCnt[16]~15_combout\);

-- Location: FF_X113_Y25_N31
\debouncer|s_debounceCnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debouncer|s_debounceCnt[16]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_debounceCnt\(16));

-- Location: LCCOMB_X112_Y25_N10
\debouncer|LessThan0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|LessThan0~4_combout\ = (\debouncer|s_debounceCnt\(16) & (\debouncer|s_debounceCnt\(15) & (\debouncer|s_debounceCnt\(18) & \debouncer|s_debounceCnt\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_debounceCnt\(16),
	datab => \debouncer|s_debounceCnt\(15),
	datac => \debouncer|s_debounceCnt\(18),
	datad => \debouncer|s_debounceCnt\(17),
	combout => \debouncer|LessThan0~4_combout\);

-- Location: LCCOMB_X114_Y25_N18
\debouncer|s_debounceCnt[4]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt[4]~0_combout\ = (\debouncer|s_dirtyIn~q\ & (((!\debouncer|s_debounceCnt\(14) & !\debouncer|LessThan0~3_combout\)) # (!\debouncer|LessThan0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_dirtyIn~q\,
	datab => \debouncer|LessThan0~4_combout\,
	datac => \debouncer|s_debounceCnt\(14),
	datad => \debouncer|LessThan0~3_combout\,
	combout => \debouncer|s_debounceCnt[4]~0_combout\);

-- Location: LCCOMB_X113_Y26_N8
\debouncer|s_debounceCnt~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_debounceCnt~20_combout\ = (\debouncer|Add0~0_combout\ & (\debouncer|s_previousIn~q\ & \debouncer|s_debounceCnt[4]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|Add0~0_combout\,
	datab => \debouncer|s_previousIn~q\,
	datad => \debouncer|s_debounceCnt[4]~0_combout\,
	combout => \debouncer|s_debounceCnt~20_combout\);

-- Location: FF_X113_Y26_N9
\debouncer|s_debounceCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debouncer|s_debounceCnt~20_combout\,
	ena => \debouncer|s_debounceCnt[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_debounceCnt\(0));

-- Location: LCCOMB_X113_Y21_N22
\debouncer|s_pulsedOut~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|s_pulsedOut~5_combout\ = (\debouncer|s_debounceCnt\(0) & (\debouncer|s_pulsedOut~4_combout\ & \debouncer|s_pulsedOut~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|s_debounceCnt\(0),
	datac => \debouncer|s_pulsedOut~4_combout\,
	datad => \debouncer|s_pulsedOut~3_combout\,
	combout => \debouncer|s_pulsedOut~5_combout\);

-- Location: FF_X113_Y21_N23
\debouncer|s_pulsedOut\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debouncer|s_pulsedOut~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|s_pulsedOut~q\);

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

-- Location: FF_X113_Y21_N15
\registo|s_start_cha\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[1]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registo|s_start_cha~q\);

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

-- Location: LCCOMB_X112_Y21_N16
\registo|s_start_cafe~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \registo|s_start_cafe~feeder_combout\ = \SW[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SW[0]~input_o\,
	combout => \registo|s_start_cafe~feeder_combout\);

-- Location: FF_X112_Y21_N17
\registo|s_start_cafe\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \registo|s_start_cafe~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registo|s_start_cafe~q\);

-- Location: LCCOMB_X111_Y21_N30
\escolhaProd|Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|Selector5~0_combout\ = (!\registo|s_start_cafe~q\) # (!\escolhaProd|state.hold_drinks~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \escolhaProd|state.hold_drinks~q\,
	datad => \registo|s_start_cafe~q\,
	combout => \escolhaProd|Selector5~0_combout\);

-- Location: LCCOMB_X113_Y21_N4
\escolhaProd|Selector11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|Selector11~0_combout\ = (!\registo|s_start_cha~q\ & (!\registo|s_start_cafe~q\ & \escolhaProd|state.hold_drinks~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \registo|s_start_cha~q\,
	datac => \registo|s_start_cafe~q\,
	datad => \escolhaProd|state.hold_drinks~q\,
	combout => \escolhaProd|Selector11~0_combout\);

-- Location: LCCOMB_X113_Y21_N12
\escolhaProd|state.hold_helo~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|state.hold_helo~0_combout\ = (!\debouncer|s_pulsedOut~q\ & ((\escolhaProd|state.hold_helo~q\) # (!\escolhaProd|state~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|s_pulsedOut~q\,
	datac => \escolhaProd|state.hold_helo~q\,
	datad => \escolhaProd|state~15_combout\,
	combout => \escolhaProd|state.hold_helo~0_combout\);

-- Location: FF_X113_Y21_N13
\escolhaProd|state.hold_helo\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \escolhaProd|state.hold_helo~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \escolhaProd|state.hold_helo~q\);

-- Location: LCCOMB_X112_Y21_N10
\escolhaProd|NewTime[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|NewTime[0]~0_combout\ = (!\escolhaProd|Selector11~0_combout\ & (!\debouncer|s_pulsedOut~q\ & ((\escolhaProd|state.hold_drinks~q\) # (!\escolhaProd|state.hold_helo~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \escolhaProd|Selector11~0_combout\,
	datab => \escolhaProd|state.hold_drinks~q\,
	datac => \escolhaProd|state.hold_helo~q\,
	datad => \debouncer|s_pulsedOut~q\,
	combout => \escolhaProd|NewTime[0]~0_combout\);

-- Location: FF_X111_Y21_N31
\escolhaProd|NewTime[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \escolhaProd|Selector5~0_combout\,
	ena => \escolhaProd|NewTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \escolhaProd|NewTime\(2));

-- Location: LCCOMB_X112_Y21_N0
\escolhaProd|Selector8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|Selector8~0_combout\ = (!\escolhaProd|Selector11~0_combout\ & ((\escolhaProd|state.hold_drinks~q\) # ((\escolhaProd|start_timer~q\) # (!\escolhaProd|state.hold_helo~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \escolhaProd|state.hold_drinks~q\,
	datab => \escolhaProd|state.hold_helo~q\,
	datac => \escolhaProd|start_timer~q\,
	datad => \escolhaProd|Selector11~0_combout\,
	combout => \escolhaProd|Selector8~0_combout\);

-- Location: FF_X112_Y21_N1
\escolhaProd|start_timer\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \escolhaProd|Selector8~0_combout\,
	ena => \debouncer|ALT_INV_s_pulsedOut~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \escolhaProd|start_timer~q\);

-- Location: LCCOMB_X113_Y21_N8
\escolhaProd|Selector6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|Selector6~0_combout\ = (\escolhaProd|state.hold_drinks~q\ & ((\registo|s_start_cafe~q\) # ((\registo|s_start_cha~q\) # (\escolhaProd|NewTime\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \registo|s_start_cafe~q\,
	datab => \escolhaProd|state.hold_drinks~q\,
	datac => \registo|s_start_cha~q\,
	datad => \escolhaProd|NewTime\(1),
	combout => \escolhaProd|Selector6~0_combout\);

-- Location: LCCOMB_X113_Y21_N18
\escolhaProd|Selector6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|Selector6~1_combout\ = (\escolhaProd|Selector6~0_combout\) # ((\escolhaProd|state.hold_helo~q\ & \escolhaProd|NewTime\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \escolhaProd|state.hold_helo~q\,
	datab => \escolhaProd|Selector6~0_combout\,
	datac => \escolhaProd|NewTime\(1),
	combout => \escolhaProd|Selector6~1_combout\);

-- Location: FF_X113_Y21_N19
\escolhaProd|NewTime[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \escolhaProd|Selector6~1_combout\,
	ena => \debouncer|ALT_INV_s_pulsedOut~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \escolhaProd|NewTime\(1));

-- Location: LCCOMB_X112_Y21_N4
\timer|running~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|running~0_combout\ = (\escolhaProd|start_timer~q\) # ((\timer|running~q\ & !\timer|Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \escolhaProd|start_timer~q\,
	datac => \timer|running~q\,
	datad => \timer|Equal0~0_combout\,
	combout => \timer|running~0_combout\);

-- Location: FF_X112_Y21_N5
\timer|running\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer|running~0_combout\,
	sclr => \debouncer|s_pulsedOut~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer|running~q\);

-- Location: LCCOMB_X111_Y21_N24
\timer|counter[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|counter[0]~1_combout\ = (\escolhaProd|start_timer~q\) # ((\debouncer|s_pulsedOut~q\) # ((!\timer|Equal0~0_combout\ & \timer|running~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|Equal0~0_combout\,
	datab => \escolhaProd|start_timer~q\,
	datac => \debouncer|s_pulsedOut~q\,
	datad => \timer|running~q\,
	combout => \timer|counter[0]~1_combout\);

-- Location: LCCOMB_X111_Y21_N16
\escolhaProd|NewTime[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|NewTime[0]~1_combout\ = !\escolhaProd|state.hold_drinks~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \escolhaProd|state.hold_drinks~q\,
	combout => \escolhaProd|NewTime[0]~1_combout\);

-- Location: FF_X111_Y21_N17
\escolhaProd|NewTime[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \escolhaProd|NewTime[0]~1_combout\,
	ena => \escolhaProd|NewTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \escolhaProd|NewTime\(0));

-- Location: LCCOMB_X111_Y21_N14
\timer|counter[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|counter[0]~4_combout\ = (!\debouncer|s_pulsedOut~q\ & ((\escolhaProd|start_timer~q\ & (\escolhaProd|NewTime\(0))) # (!\escolhaProd|start_timer~q\ & ((!\timer|counter\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_pulsedOut~q\,
	datab => \escolhaProd|NewTime\(0),
	datac => \escolhaProd|start_timer~q\,
	datad => \timer|counter\(0),
	combout => \timer|counter[0]~4_combout\);

-- Location: LCCOMB_X112_Y21_N22
\timer|counter[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|counter[0]~5_combout\ = (\timer|counter[0]~1_combout\ & ((\timer|counter[0]~4_combout\))) # (!\timer|counter[0]~1_combout\ & (\timer|counter\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \timer|counter[0]~1_combout\,
	datac => \timer|counter\(0),
	datad => \timer|counter[0]~4_combout\,
	combout => \timer|counter[0]~5_combout\);

-- Location: FF_X112_Y21_N23
\timer|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer|counter[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer|counter\(0));

-- Location: LCCOMB_X111_Y21_N8
\timer|counter~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|counter~6_combout\ = (\escolhaProd|start_timer~q\ & (\escolhaProd|NewTime\(1))) # (!\escolhaProd|start_timer~q\ & ((\timer|counter\(1) $ (!\timer|counter\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \escolhaProd|NewTime\(1),
	datab => \escolhaProd|start_timer~q\,
	datac => \timer|counter\(1),
	datad => \timer|counter\(0),
	combout => \timer|counter~6_combout\);

-- Location: FF_X111_Y21_N9
\timer|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer|counter~6_combout\,
	sclr => \debouncer|s_pulsedOut~q\,
	ena => \timer|counter[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer|counter\(1));

-- Location: LCCOMB_X111_Y21_N18
\timer|counter~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|counter~2_combout\ = (!\escolhaProd|start_timer~q\ & (\timer|counter\(2) $ (((!\timer|counter\(1) & !\timer|counter\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|counter\(2),
	datab => \timer|counter\(1),
	datac => \escolhaProd|start_timer~q\,
	datad => \timer|counter\(0),
	combout => \timer|counter~2_combout\);

-- Location: LCCOMB_X111_Y21_N26
\timer|counter~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|counter~3_combout\ = (\timer|counter~2_combout\) # ((\escolhaProd|NewTime\(2) & \escolhaProd|start_timer~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \escolhaProd|NewTime\(2),
	datac => \escolhaProd|start_timer~q\,
	datad => \timer|counter~2_combout\,
	combout => \timer|counter~3_combout\);

-- Location: FF_X111_Y21_N27
\timer|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer|counter~3_combout\,
	sclr => \debouncer|s_pulsedOut~q\,
	ena => \timer|counter[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer|counter\(2));

-- Location: LCCOMB_X111_Y21_N10
\timer|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|Add0~0_combout\ = \timer|counter\(3) $ (((\timer|counter\(2)) # ((\timer|counter\(1)) # (\timer|counter\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|counter\(2),
	datab => \timer|counter\(3),
	datac => \timer|counter\(1),
	datad => \timer|counter\(0),
	combout => \timer|Add0~0_combout\);

-- Location: LCCOMB_X113_Y21_N14
\escolhaProd|Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|Selector4~0_combout\ = (\escolhaProd|state.hold_drinks~q\ & ((\registo|s_start_cafe~q\) # ((\escolhaProd|NewTime\(3) & !\registo|s_start_cha~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \registo|s_start_cafe~q\,
	datab => \escolhaProd|NewTime\(3),
	datac => \registo|s_start_cha~q\,
	datad => \escolhaProd|state.hold_drinks~q\,
	combout => \escolhaProd|Selector4~0_combout\);

-- Location: LCCOMB_X113_Y21_N20
\escolhaProd|Selector4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|Selector4~1_combout\ = (\escolhaProd|Selector4~0_combout\) # ((\escolhaProd|state.hold_helo~q\ & (!\escolhaProd|state.hold_drinks~q\ & \escolhaProd|NewTime\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \escolhaProd|state.hold_helo~q\,
	datab => \escolhaProd|state.hold_drinks~q\,
	datac => \escolhaProd|NewTime\(3),
	datad => \escolhaProd|Selector4~0_combout\,
	combout => \escolhaProd|Selector4~1_combout\);

-- Location: FF_X113_Y21_N21
\escolhaProd|NewTime[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \escolhaProd|Selector4~1_combout\,
	ena => \debouncer|ALT_INV_s_pulsedOut~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \escolhaProd|NewTime\(3));

-- Location: LCCOMB_X111_Y21_N20
\timer|counter~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|counter~0_combout\ = (\escolhaProd|start_timer~q\ & ((\escolhaProd|NewTime\(3)))) # (!\escolhaProd|start_timer~q\ & (!\timer|Add0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|Add0~0_combout\,
	datac => \escolhaProd|start_timer~q\,
	datad => \escolhaProd|NewTime\(3),
	combout => \timer|counter~0_combout\);

-- Location: FF_X111_Y21_N21
\timer|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer|counter~0_combout\,
	sclr => \debouncer|s_pulsedOut~q\,
	ena => \timer|counter[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer|counter\(3));

-- Location: LCCOMB_X111_Y21_N12
\timer|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|Equal0~0_combout\ = (!\timer|counter\(2) & (!\timer|counter\(3) & (!\timer|counter\(1) & !\timer|counter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|counter\(2),
	datab => \timer|counter\(3),
	datac => \timer|counter\(1),
	datad => \timer|counter\(0),
	combout => \timer|Equal0~0_combout\);

-- Location: LCCOMB_X112_Y21_N18
\timer|time_exp~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|time_exp~0_combout\ = (!\escolhaProd|start_timer~q\ & ((\timer|time_exp~q\) # ((\timer|Equal0~0_combout\ & \timer|running~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|Equal0~0_combout\,
	datab => \timer|running~q\,
	datac => \timer|time_exp~q\,
	datad => \escolhaProd|start_timer~q\,
	combout => \timer|time_exp~0_combout\);

-- Location: FF_X112_Y21_N19
\timer|time_exp\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timer|time_exp~0_combout\,
	sclr => \debouncer|s_pulsedOut~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer|time_exp~q\);

-- Location: LCCOMB_X112_Y21_N2
\escolhaProd|Selector14~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|Selector14~1_combout\ = (\escolhaProd|state.start_cafe~q\ & ((\timer|time_exp~q\) # ((\escolhaProd|state.cafe_ready~q\ & \SW[0]~input_o\)))) # (!\escolhaProd|state.start_cafe~q\ & (((\escolhaProd|state.cafe_ready~q\ & \SW[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \escolhaProd|state.start_cafe~q\,
	datab => \timer|time_exp~q\,
	datac => \escolhaProd|state.cafe_ready~q\,
	datad => \SW[0]~input_o\,
	combout => \escolhaProd|Selector14~1_combout\);

-- Location: FF_X112_Y21_N3
\escolhaProd|state.cafe_ready\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \escolhaProd|Selector14~1_combout\,
	sclr => \debouncer|s_pulsedOut~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \escolhaProd|state.cafe_ready~q\);

-- Location: LCCOMB_X112_Y21_N8
\escolhaProd|Selector11~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|Selector11~1_combout\ = (\SW[0]~input_o\ & (\timer|time_exp~q\ & (!\escolhaProd|state.hold_helo~q\))) # (!\SW[0]~input_o\ & ((\escolhaProd|state.cafe_ready~q\) # ((\timer|time_exp~q\ & !\escolhaProd|state.hold_helo~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \timer|time_exp~q\,
	datac => \escolhaProd|state.hold_helo~q\,
	datad => \escolhaProd|state.cafe_ready~q\,
	combout => \escolhaProd|Selector11~1_combout\);

-- Location: LCCOMB_X112_Y21_N20
\escolhaProd|Selector11~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|Selector11~2_combout\ = (\escolhaProd|Selector11~1_combout\) # ((\escolhaProd|Selector11~0_combout\) # ((!\SW[1]~input_o\ & \escolhaProd|state.cha_ready~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datab => \escolhaProd|state.cha_ready~q\,
	datac => \escolhaProd|Selector11~1_combout\,
	datad => \escolhaProd|Selector11~0_combout\,
	combout => \escolhaProd|Selector11~2_combout\);

-- Location: FF_X112_Y21_N21
\escolhaProd|state.hold_drinks\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \escolhaProd|Selector11~2_combout\,
	sclr => \debouncer|s_pulsedOut~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \escolhaProd|state.hold_drinks~q\);

-- Location: LCCOMB_X113_Y21_N6
\escolhaProd|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|Selector0~0_combout\ = (\registo|s_start_cha~q\ & (!\registo|s_start_cafe~q\ & \escolhaProd|state.hold_drinks~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \registo|s_start_cha~q\,
	datac => \registo|s_start_cafe~q\,
	datad => \escolhaProd|state.hold_drinks~q\,
	combout => \escolhaProd|Selector0~0_combout\);

-- Location: LCCOMB_X113_Y21_N24
\escolhaProd|state~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|state~17_combout\ = (!\debouncer|s_pulsedOut~q\ & ((\escolhaProd|Selector0~0_combout\) # ((\escolhaProd|state.start_cha~q\ & \escolhaProd|state~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \escolhaProd|Selector0~0_combout\,
	datab => \debouncer|s_pulsedOut~q\,
	datac => \escolhaProd|state.start_cha~q\,
	datad => \escolhaProd|state~15_combout\,
	combout => \escolhaProd|state~17_combout\);

-- Location: FF_X113_Y21_N25
\escolhaProd|state.start_cha\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \escolhaProd|state~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \escolhaProd|state.start_cha~q\);

-- Location: LCCOMB_X112_Y21_N24
\escolhaProd|Selector15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|Selector15~0_combout\ = (\SW[1]~input_o\ & ((\escolhaProd|state.cha_ready~q\) # ((\escolhaProd|state.start_cha~q\ & \timer|time_exp~q\)))) # (!\SW[1]~input_o\ & (\escolhaProd|state.start_cha~q\ & ((\timer|time_exp~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datab => \escolhaProd|state.start_cha~q\,
	datac => \escolhaProd|state.cha_ready~q\,
	datad => \timer|time_exp~q\,
	combout => \escolhaProd|Selector15~0_combout\);

-- Location: FF_X112_Y21_N25
\escolhaProd|state.cha_ready\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \escolhaProd|Selector15~0_combout\,
	sclr => \debouncer|s_pulsedOut~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \escolhaProd|state.cha_ready~q\);

-- Location: LCCOMB_X112_Y21_N12
\escolhaProd|state~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|state~14_combout\ = (!\escolhaProd|state.cafe_ready~q\ & ((\escolhaProd|state.cha_ready~q\ & (\SW[1]~input_o\)) # (!\escolhaProd|state.cha_ready~q\ & ((!\timer|time_exp~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datab => \escolhaProd|state.cha_ready~q\,
	datac => \escolhaProd|state.cafe_ready~q\,
	datad => \timer|time_exp~q\,
	combout => \escolhaProd|state~14_combout\);

-- Location: LCCOMB_X112_Y21_N30
\escolhaProd|Selector14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|Selector14~0_combout\ = (\SW[0]~input_o\ & \escolhaProd|state.cafe_ready~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datad => \escolhaProd|state.cafe_ready~q\,
	combout => \escolhaProd|Selector14~0_combout\);

-- Location: LCCOMB_X112_Y21_N14
\escolhaProd|state~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|state~15_combout\ = (\escolhaProd|Selector11~0_combout\) # ((!\escolhaProd|state.hold_drinks~q\ & ((\escolhaProd|state~14_combout\) # (\escolhaProd|Selector14~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \escolhaProd|state~14_combout\,
	datab => \escolhaProd|state.hold_drinks~q\,
	datac => \escolhaProd|Selector14~0_combout\,
	datad => \escolhaProd|Selector11~0_combout\,
	combout => \escolhaProd|state~15_combout\);

-- Location: LCCOMB_X112_Y21_N26
\escolhaProd|state~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|state~16_combout\ = (!\debouncer|s_pulsedOut~q\ & (((\escolhaProd|state~15_combout\ & \escolhaProd|state.start_cafe~q\)) # (!\escolhaProd|Selector5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|s_pulsedOut~q\,
	datab => \escolhaProd|state~15_combout\,
	datac => \escolhaProd|state.start_cafe~q\,
	datad => \escolhaProd|Selector5~0_combout\,
	combout => \escolhaProd|state~16_combout\);

-- Location: FF_X112_Y21_N27
\escolhaProd|state.start_cafe\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \escolhaProd|state~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \escolhaProd|state.start_cafe~q\);

-- Location: LCCOMB_X112_Y21_N6
\escolhaProd|led_r~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|led_r~0_combout\ = (\escolhaProd|state.start_cafe~q\) # (\escolhaProd|state.start_cha~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \escolhaProd|state.start_cafe~q\,
	datad => \escolhaProd|state.start_cha~q\,
	combout => \escolhaProd|led_r~0_combout\);

-- Location: FF_X112_Y21_N7
\escolhaProd|led_r[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \escolhaProd|led_r~0_combout\,
	ena => \debouncer|ALT_INV_s_pulsedOut~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \escolhaProd|led_r\(0));

-- Location: LCCOMB_X112_Y21_N28
\escolhaProd|Selector9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|Selector9~0_combout\ = (\escolhaProd|state.cha_ready~q\) # ((\escolhaProd|state.cafe_ready~q\) # ((\escolhaProd|led_r~0_combout\ & \escolhaProd|led_g\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \escolhaProd|led_r~0_combout\,
	datab => \escolhaProd|state.cha_ready~q\,
	datac => \escolhaProd|led_g\(0),
	datad => \escolhaProd|state.cafe_ready~q\,
	combout => \escolhaProd|Selector9~0_combout\);

-- Location: FF_X112_Y21_N29
\escolhaProd|led_g[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \escolhaProd|Selector9~0_combout\,
	ena => \debouncer|ALT_INV_s_pulsedOut~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \escolhaProd|led_g\(0));

-- Location: LCCOMB_X113_Y21_N16
\escolhaProd|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|Selector2~0_combout\ = (\escolhaProd|Selector11~0_combout\) # ((\escolhaProd|state.hold_helo~q\ & (\escolhaProd|select_word\(1) & !\escolhaProd|state.hold_drinks~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \escolhaProd|state.hold_helo~q\,
	datab => \escolhaProd|Selector11~0_combout\,
	datac => \escolhaProd|select_word\(1),
	datad => \escolhaProd|state.hold_drinks~q\,
	combout => \escolhaProd|Selector2~0_combout\);

-- Location: FF_X113_Y21_N17
\escolhaProd|select_word[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \escolhaProd|Selector2~0_combout\,
	ena => \debouncer|ALT_INV_s_pulsedOut~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \escolhaProd|select_word\(1));

-- Location: LCCOMB_X113_Y21_N26
\escolhaProd|Selector0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|Selector0~1_combout\ = (\escolhaProd|Selector0~0_combout\) # ((!\escolhaProd|state.hold_drinks~q\ & (\escolhaProd|select_word\(3) & \escolhaProd|state.hold_helo~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \escolhaProd|Selector0~0_combout\,
	datab => \escolhaProd|state.hold_drinks~q\,
	datac => \escolhaProd|select_word\(3),
	datad => \escolhaProd|state.hold_helo~q\,
	combout => \escolhaProd|Selector0~1_combout\);

-- Location: FF_X113_Y21_N27
\escolhaProd|select_word[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \escolhaProd|Selector0~1_combout\,
	ena => \debouncer|ALT_INV_s_pulsedOut~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \escolhaProd|select_word\(3));

-- Location: LCCOMB_X114_Y21_N20
\display|Mux26~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux26~4_combout\ = (!\escolhaProd|select_word\(1) & !\escolhaProd|select_word\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \escolhaProd|select_word\(1),
	datac => \escolhaProd|select_word\(3),
	combout => \display|Mux26~4_combout\);

-- Location: LCCOMB_X113_Y21_N30
\escolhaProd|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|Selector1~0_combout\ = (\escolhaProd|state.hold_drinks~q\ & (\registo|s_start_cafe~q\)) # (!\escolhaProd|state.hold_drinks~q\ & (((\escolhaProd|select_word\(2) & \escolhaProd|state.hold_helo~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \registo|s_start_cafe~q\,
	datab => \escolhaProd|state.hold_drinks~q\,
	datac => \escolhaProd|select_word\(2),
	datad => \escolhaProd|state.hold_helo~q\,
	combout => \escolhaProd|Selector1~0_combout\);

-- Location: FF_X113_Y21_N31
\escolhaProd|select_word[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \escolhaProd|Selector1~0_combout\,
	ena => \debouncer|ALT_INV_s_pulsedOut~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \escolhaProd|select_word\(2));

-- Location: LCCOMB_X109_Y17_N6
\FreqDiv|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~0_combout\ = \FreqDiv|cnt4\(0) $ (VCC)
-- \FreqDiv|Add0~1\ = CARRY(\FreqDiv|cnt4\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt4\(0),
	datad => VCC,
	combout => \FreqDiv|Add0~0_combout\,
	cout => \FreqDiv|Add0~1\);

-- Location: FF_X109_Y17_N7
\FreqDiv|cnt4[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(0));

-- Location: LCCOMB_X109_Y17_N8
\FreqDiv|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~2_combout\ = (\FreqDiv|cnt4\(1) & (!\FreqDiv|Add0~1\)) # (!\FreqDiv|cnt4\(1) & ((\FreqDiv|Add0~1\) # (GND)))
-- \FreqDiv|Add0~3\ = CARRY((!\FreqDiv|Add0~1\) # (!\FreqDiv|cnt4\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \FreqDiv|cnt4\(1),
	datad => VCC,
	cin => \FreqDiv|Add0~1\,
	combout => \FreqDiv|Add0~2_combout\,
	cout => \FreqDiv|Add0~3\);

-- Location: FF_X109_Y17_N9
\FreqDiv|cnt4[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(1));

-- Location: LCCOMB_X109_Y17_N10
\FreqDiv|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~4_combout\ = (\FreqDiv|cnt4\(2) & (\FreqDiv|Add0~3\ $ (GND))) # (!\FreqDiv|cnt4\(2) & (!\FreqDiv|Add0~3\ & VCC))
-- \FreqDiv|Add0~5\ = CARRY((\FreqDiv|cnt4\(2) & !\FreqDiv|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt4\(2),
	datad => VCC,
	cin => \FreqDiv|Add0~3\,
	combout => \FreqDiv|Add0~4_combout\,
	cout => \FreqDiv|Add0~5\);

-- Location: FF_X109_Y17_N11
\FreqDiv|cnt4[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(2));

-- Location: LCCOMB_X109_Y17_N12
\FreqDiv|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~6_combout\ = (\FreqDiv|cnt4\(3) & (!\FreqDiv|Add0~5\)) # (!\FreqDiv|cnt4\(3) & ((\FreqDiv|Add0~5\) # (GND)))
-- \FreqDiv|Add0~7\ = CARRY((!\FreqDiv|Add0~5\) # (!\FreqDiv|cnt4\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt4\(3),
	datad => VCC,
	cin => \FreqDiv|Add0~5\,
	combout => \FreqDiv|Add0~6_combout\,
	cout => \FreqDiv|Add0~7\);

-- Location: FF_X109_Y17_N13
\FreqDiv|cnt4[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(3));

-- Location: LCCOMB_X109_Y17_N14
\FreqDiv|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~8_combout\ = (\FreqDiv|cnt4\(4) & (\FreqDiv|Add0~7\ $ (GND))) # (!\FreqDiv|cnt4\(4) & (!\FreqDiv|Add0~7\ & VCC))
-- \FreqDiv|Add0~9\ = CARRY((\FreqDiv|cnt4\(4) & !\FreqDiv|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \FreqDiv|cnt4\(4),
	datad => VCC,
	cin => \FreqDiv|Add0~7\,
	combout => \FreqDiv|Add0~8_combout\,
	cout => \FreqDiv|Add0~9\);

-- Location: LCCOMB_X109_Y17_N0
\FreqDiv|cnt4~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt4~5_combout\ = (\FreqDiv|Add0~8_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \FreqDiv|Add0~8_combout\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt4~5_combout\);

-- Location: FF_X109_Y17_N1
\FreqDiv|cnt4[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|cnt4~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(4));

-- Location: LCCOMB_X109_Y17_N16
\FreqDiv|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~10_combout\ = (\FreqDiv|cnt4\(5) & (!\FreqDiv|Add0~9\)) # (!\FreqDiv|cnt4\(5) & ((\FreqDiv|Add0~9\) # (GND)))
-- \FreqDiv|Add0~11\ = CARRY((!\FreqDiv|Add0~9\) # (!\FreqDiv|cnt4\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \FreqDiv|cnt4\(5),
	datad => VCC,
	cin => \FreqDiv|Add0~9\,
	combout => \FreqDiv|Add0~10_combout\,
	cout => \FreqDiv|Add0~11\);

-- Location: FF_X109_Y17_N17
\FreqDiv|cnt4[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(5));

-- Location: LCCOMB_X109_Y17_N18
\FreqDiv|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~12_combout\ = (\FreqDiv|cnt4\(6) & (\FreqDiv|Add0~11\ $ (GND))) # (!\FreqDiv|cnt4\(6) & (!\FreqDiv|Add0~11\ & VCC))
-- \FreqDiv|Add0~13\ = CARRY((\FreqDiv|cnt4\(6) & !\FreqDiv|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \FreqDiv|cnt4\(6),
	datad => VCC,
	cin => \FreqDiv|Add0~11\,
	combout => \FreqDiv|Add0~12_combout\,
	cout => \FreqDiv|Add0~13\);

-- Location: FF_X109_Y17_N19
\FreqDiv|cnt4[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(6));

-- Location: LCCOMB_X109_Y17_N20
\FreqDiv|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~14_combout\ = (\FreqDiv|cnt4\(7) & (!\FreqDiv|Add0~13\)) # (!\FreqDiv|cnt4\(7) & ((\FreqDiv|Add0~13\) # (GND)))
-- \FreqDiv|Add0~15\ = CARRY((!\FreqDiv|Add0~13\) # (!\FreqDiv|cnt4\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \FreqDiv|cnt4\(7),
	datad => VCC,
	cin => \FreqDiv|Add0~13\,
	combout => \FreqDiv|Add0~14_combout\,
	cout => \FreqDiv|Add0~15\);

-- Location: FF_X109_Y17_N21
\FreqDiv|cnt4[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|Add0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(7));

-- Location: LCCOMB_X109_Y17_N22
\FreqDiv|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~16_combout\ = (\FreqDiv|cnt4\(8) & (\FreqDiv|Add0~15\ $ (GND))) # (!\FreqDiv|cnt4\(8) & (!\FreqDiv|Add0~15\ & VCC))
-- \FreqDiv|Add0~17\ = CARRY((\FreqDiv|cnt4\(8) & !\FreqDiv|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt4\(8),
	datad => VCC,
	cin => \FreqDiv|Add0~15\,
	combout => \FreqDiv|Add0~16_combout\,
	cout => \FreqDiv|Add0~17\);

-- Location: FF_X109_Y17_N23
\FreqDiv|cnt4[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|Add0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(8));

-- Location: LCCOMB_X109_Y17_N24
\FreqDiv|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~18_combout\ = (\FreqDiv|cnt4\(9) & (!\FreqDiv|Add0~17\)) # (!\FreqDiv|cnt4\(9) & ((\FreqDiv|Add0~17\) # (GND)))
-- \FreqDiv|Add0~19\ = CARRY((!\FreqDiv|Add0~17\) # (!\FreqDiv|cnt4\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \FreqDiv|cnt4\(9),
	datad => VCC,
	cin => \FreqDiv|Add0~17\,
	combout => \FreqDiv|Add0~18_combout\,
	cout => \FreqDiv|Add0~19\);

-- Location: LCCOMB_X110_Y16_N24
\FreqDiv|cnt4~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt4~4_combout\ = (\FreqDiv|Add0~18_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \FreqDiv|Add0~18_combout\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt4~4_combout\);

-- Location: FF_X110_Y16_N25
\FreqDiv|cnt4[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|cnt4~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(9));

-- Location: LCCOMB_X109_Y17_N26
\FreqDiv|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~20_combout\ = (\FreqDiv|cnt4\(10) & (\FreqDiv|Add0~19\ $ (GND))) # (!\FreqDiv|cnt4\(10) & (!\FreqDiv|Add0~19\ & VCC))
-- \FreqDiv|Add0~21\ = CARRY((\FreqDiv|cnt4\(10) & !\FreqDiv|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \FreqDiv|cnt4\(10),
	datad => VCC,
	cin => \FreqDiv|Add0~19\,
	combout => \FreqDiv|Add0~20_combout\,
	cout => \FreqDiv|Add0~21\);

-- Location: LCCOMB_X109_Y17_N2
\FreqDiv|cnt4~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt4~3_combout\ = (\FreqDiv|Add0~20_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Add0~20_combout\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt4~3_combout\);

-- Location: FF_X109_Y17_N3
\FreqDiv|cnt4[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|cnt4~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(10));

-- Location: LCCOMB_X109_Y17_N28
\FreqDiv|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~22_combout\ = (\FreqDiv|cnt4\(11) & (!\FreqDiv|Add0~21\)) # (!\FreqDiv|cnt4\(11) & ((\FreqDiv|Add0~21\) # (GND)))
-- \FreqDiv|Add0~23\ = CARRY((!\FreqDiv|Add0~21\) # (!\FreqDiv|cnt4\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \FreqDiv|cnt4\(11),
	datad => VCC,
	cin => \FreqDiv|Add0~21\,
	combout => \FreqDiv|Add0~22_combout\,
	cout => \FreqDiv|Add0~23\);

-- Location: LCCOMB_X109_Y17_N4
\FreqDiv|cnt4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt4~2_combout\ = (\FreqDiv|Add0~22_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \FreqDiv|Add0~22_combout\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt4~2_combout\);

-- Location: FF_X109_Y17_N5
\FreqDiv|cnt4[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|cnt4~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(11));

-- Location: LCCOMB_X109_Y17_N30
\FreqDiv|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~24_combout\ = (\FreqDiv|cnt4\(12) & (\FreqDiv|Add0~23\ $ (GND))) # (!\FreqDiv|cnt4\(12) & (!\FreqDiv|Add0~23\ & VCC))
-- \FreqDiv|Add0~25\ = CARRY((\FreqDiv|cnt4\(12) & !\FreqDiv|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \FreqDiv|cnt4\(12),
	datad => VCC,
	cin => \FreqDiv|Add0~23\,
	combout => \FreqDiv|Add0~24_combout\,
	cout => \FreqDiv|Add0~25\);

-- Location: LCCOMB_X110_Y16_N16
\FreqDiv|cnt4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt4~1_combout\ = (\FreqDiv|Add0~24_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Add0~24_combout\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt4~1_combout\);

-- Location: FF_X110_Y16_N17
\FreqDiv|cnt4[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|cnt4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(12));

-- Location: LCCOMB_X109_Y16_N0
\FreqDiv|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~26_combout\ = (\FreqDiv|cnt4\(13) & (!\FreqDiv|Add0~25\)) # (!\FreqDiv|cnt4\(13) & ((\FreqDiv|Add0~25\) # (GND)))
-- \FreqDiv|Add0~27\ = CARRY((!\FreqDiv|Add0~25\) # (!\FreqDiv|cnt4\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \FreqDiv|cnt4\(13),
	datad => VCC,
	cin => \FreqDiv|Add0~25\,
	combout => \FreqDiv|Add0~26_combout\,
	cout => \FreqDiv|Add0~27\);

-- Location: FF_X109_Y16_N1
\FreqDiv|cnt4[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|Add0~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(13));

-- Location: LCCOMB_X109_Y16_N2
\FreqDiv|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~28_combout\ = (\FreqDiv|cnt4\(14) & (\FreqDiv|Add0~27\ $ (GND))) # (!\FreqDiv|cnt4\(14) & (!\FreqDiv|Add0~27\ & VCC))
-- \FreqDiv|Add0~29\ = CARRY((\FreqDiv|cnt4\(14) & !\FreqDiv|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt4\(14),
	datad => VCC,
	cin => \FreqDiv|Add0~27\,
	combout => \FreqDiv|Add0~28_combout\,
	cout => \FreqDiv|Add0~29\);

-- Location: LCCOMB_X110_Y16_N2
\FreqDiv|cnt4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt4~0_combout\ = (\FreqDiv|Add0~28_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Add0~28_combout\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt4~0_combout\);

-- Location: FF_X110_Y16_N3
\FreqDiv|cnt4[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|cnt4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(14));

-- Location: LCCOMB_X109_Y16_N4
\FreqDiv|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~30_combout\ = (\FreqDiv|cnt4\(15) & (!\FreqDiv|Add0~29\)) # (!\FreqDiv|cnt4\(15) & ((\FreqDiv|Add0~29\) # (GND)))
-- \FreqDiv|Add0~31\ = CARRY((!\FreqDiv|Add0~29\) # (!\FreqDiv|cnt4\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \FreqDiv|cnt4\(15),
	datad => VCC,
	cin => \FreqDiv|Add0~29\,
	combout => \FreqDiv|Add0~30_combout\,
	cout => \FreqDiv|Add0~31\);

-- Location: FF_X109_Y16_N5
\FreqDiv|cnt4[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|Add0~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(15));

-- Location: LCCOMB_X109_Y16_N6
\FreqDiv|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~32_combout\ = (\FreqDiv|cnt4\(16) & (\FreqDiv|Add0~31\ $ (GND))) # (!\FreqDiv|cnt4\(16) & (!\FreqDiv|Add0~31\ & VCC))
-- \FreqDiv|Add0~33\ = CARRY((\FreqDiv|cnt4\(16) & !\FreqDiv|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt4\(16),
	datad => VCC,
	cin => \FreqDiv|Add0~31\,
	combout => \FreqDiv|Add0~32_combout\,
	cout => \FreqDiv|Add0~33\);

-- Location: LCCOMB_X110_Y16_N4
\FreqDiv|cnt4~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt4~6_combout\ = (\FreqDiv|Add0~32_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \FreqDiv|Add0~32_combout\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt4~6_combout\);

-- Location: FF_X110_Y16_N5
\FreqDiv|cnt4[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|cnt4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(16));

-- Location: LCCOMB_X109_Y16_N8
\FreqDiv|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~34_combout\ = (\FreqDiv|cnt4\(17) & (!\FreqDiv|Add0~33\)) # (!\FreqDiv|cnt4\(17) & ((\FreqDiv|Add0~33\) # (GND)))
-- \FreqDiv|Add0~35\ = CARRY((!\FreqDiv|Add0~33\) # (!\FreqDiv|cnt4\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \FreqDiv|cnt4\(17),
	datad => VCC,
	cin => \FreqDiv|Add0~33\,
	combout => \FreqDiv|Add0~34_combout\,
	cout => \FreqDiv|Add0~35\);

-- Location: LCCOMB_X110_Y16_N22
\FreqDiv|cnt4~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt4~7_combout\ = (\FreqDiv|Add0~34_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Add0~34_combout\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt4~7_combout\);

-- Location: FF_X110_Y16_N23
\FreqDiv|cnt4[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|cnt4~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(17));

-- Location: LCCOMB_X109_Y16_N10
\FreqDiv|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~36_combout\ = (\FreqDiv|cnt4\(18) & (\FreqDiv|Add0~35\ $ (GND))) # (!\FreqDiv|cnt4\(18) & (!\FreqDiv|Add0~35\ & VCC))
-- \FreqDiv|Add0~37\ = CARRY((\FreqDiv|cnt4\(18) & !\FreqDiv|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt4\(18),
	datad => VCC,
	cin => \FreqDiv|Add0~35\,
	combout => \FreqDiv|Add0~36_combout\,
	cout => \FreqDiv|Add0~37\);

-- Location: LCCOMB_X109_Y16_N30
\FreqDiv|cnt4~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt4~8_combout\ = (\FreqDiv|Add0~36_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Add0~36_combout\,
	datac => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt4~8_combout\);

-- Location: FF_X109_Y16_N31
\FreqDiv|cnt4[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|cnt4~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(18));

-- Location: LCCOMB_X109_Y16_N12
\FreqDiv|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~38_combout\ = (\FreqDiv|cnt4\(19) & (!\FreqDiv|Add0~37\)) # (!\FreqDiv|cnt4\(19) & ((\FreqDiv|Add0~37\) # (GND)))
-- \FreqDiv|Add0~39\ = CARRY((!\FreqDiv|Add0~37\) # (!\FreqDiv|cnt4\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \FreqDiv|cnt4\(19),
	datad => VCC,
	cin => \FreqDiv|Add0~37\,
	combout => \FreqDiv|Add0~38_combout\,
	cout => \FreqDiv|Add0~39\);

-- Location: LCCOMB_X109_Y16_N28
\FreqDiv|cnt4~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt4~9_combout\ = (\FreqDiv|Add0~38_combout\ & !\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Add0~38_combout\,
	datac => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|cnt4~9_combout\);

-- Location: FF_X109_Y16_N29
\FreqDiv|cnt4[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|cnt4~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(19));

-- Location: LCCOMB_X109_Y16_N14
\FreqDiv|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~40_combout\ = (\FreqDiv|cnt4\(20) & (\FreqDiv|Add0~39\ $ (GND))) # (!\FreqDiv|cnt4\(20) & (!\FreqDiv|Add0~39\ & VCC))
-- \FreqDiv|Add0~41\ = CARRY((\FreqDiv|cnt4\(20) & !\FreqDiv|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt4\(20),
	datad => VCC,
	cin => \FreqDiv|Add0~39\,
	combout => \FreqDiv|Add0~40_combout\,
	cout => \FreqDiv|Add0~41\);

-- Location: LCCOMB_X109_Y16_N26
\FreqDiv|cnt4~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt4~10_combout\ = (!\FreqDiv|Equal0~8_combout\ & \FreqDiv|Add0~40_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \FreqDiv|Equal0~8_combout\,
	datac => \FreqDiv|Add0~40_combout\,
	combout => \FreqDiv|cnt4~10_combout\);

-- Location: FF_X109_Y16_N27
\FreqDiv|cnt4[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|cnt4~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(20));

-- Location: LCCOMB_X109_Y16_N16
\FreqDiv|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~42_combout\ = (\FreqDiv|cnt4\(21) & (!\FreqDiv|Add0~41\)) # (!\FreqDiv|cnt4\(21) & ((\FreqDiv|Add0~41\) # (GND)))
-- \FreqDiv|Add0~43\ = CARRY((!\FreqDiv|Add0~41\) # (!\FreqDiv|cnt4\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \FreqDiv|cnt4\(21),
	datad => VCC,
	cin => \FreqDiv|Add0~41\,
	combout => \FreqDiv|Add0~42_combout\,
	cout => \FreqDiv|Add0~43\);

-- Location: FF_X109_Y16_N17
\FreqDiv|cnt4[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|Add0~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(21));

-- Location: LCCOMB_X109_Y16_N18
\FreqDiv|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~44_combout\ = (\FreqDiv|cnt4\(22) & (\FreqDiv|Add0~43\ $ (GND))) # (!\FreqDiv|cnt4\(22) & (!\FreqDiv|Add0~43\ & VCC))
-- \FreqDiv|Add0~45\ = CARRY((\FreqDiv|cnt4\(22) & !\FreqDiv|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt4\(22),
	datad => VCC,
	cin => \FreqDiv|Add0~43\,
	combout => \FreqDiv|Add0~44_combout\,
	cout => \FreqDiv|Add0~45\);

-- Location: LCCOMB_X110_Y16_N30
\FreqDiv|cnt4~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|cnt4~11_combout\ = (!\FreqDiv|Equal0~8_combout\ & \FreqDiv|Add0~44_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \FreqDiv|Equal0~8_combout\,
	datad => \FreqDiv|Add0~44_combout\,
	combout => \FreqDiv|cnt4~11_combout\);

-- Location: FF_X110_Y16_N31
\FreqDiv|cnt4[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|cnt4~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(22));

-- Location: LCCOMB_X109_Y16_N20
\FreqDiv|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~46_combout\ = (\FreqDiv|cnt4\(23) & (!\FreqDiv|Add0~45\)) # (!\FreqDiv|cnt4\(23) & ((\FreqDiv|Add0~45\) # (GND)))
-- \FreqDiv|Add0~47\ = CARRY((!\FreqDiv|Add0~45\) # (!\FreqDiv|cnt4\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \FreqDiv|cnt4\(23),
	datad => VCC,
	cin => \FreqDiv|Add0~45\,
	combout => \FreqDiv|Add0~46_combout\,
	cout => \FreqDiv|Add0~47\);

-- Location: FF_X109_Y16_N21
\FreqDiv|cnt4[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|Add0~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(23));

-- Location: LCCOMB_X110_Y16_N12
\FreqDiv|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Equal0~6_combout\ = (\FreqDiv|cnt4\(22) & (!\FreqDiv|cnt4\(21) & (\FreqDiv|cnt4\(20) & !\FreqDiv|cnt4\(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt4\(22),
	datab => \FreqDiv|cnt4\(21),
	datac => \FreqDiv|cnt4\(20),
	datad => \FreqDiv|cnt4\(23),
	combout => \FreqDiv|Equal0~6_combout\);

-- Location: LCCOMB_X110_Y16_N28
\FreqDiv|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Equal0~5_combout\ = (\FreqDiv|cnt4\(17) & (\FreqDiv|cnt4\(18) & (\FreqDiv|cnt4\(16) & \FreqDiv|cnt4\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt4\(17),
	datab => \FreqDiv|cnt4\(18),
	datac => \FreqDiv|cnt4\(16),
	datad => \FreqDiv|cnt4\(19),
	combout => \FreqDiv|Equal0~5_combout\);

-- Location: LCCOMB_X109_Y16_N22
\FreqDiv|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~48_combout\ = (\FreqDiv|cnt4\(24) & (\FreqDiv|Add0~47\ $ (GND))) # (!\FreqDiv|cnt4\(24) & (!\FreqDiv|Add0~47\ & VCC))
-- \FreqDiv|Add0~49\ = CARRY((\FreqDiv|cnt4\(24) & !\FreqDiv|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt4\(24),
	datad => VCC,
	cin => \FreqDiv|Add0~47\,
	combout => \FreqDiv|Add0~48_combout\,
	cout => \FreqDiv|Add0~49\);

-- Location: FF_X109_Y16_N23
\FreqDiv|cnt4[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|Add0~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(24));

-- Location: LCCOMB_X109_Y16_N24
\FreqDiv|Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Add0~50_combout\ = \FreqDiv|Add0~49\ $ (\FreqDiv|cnt4\(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \FreqDiv|cnt4\(25),
	cin => \FreqDiv|Add0~49\,
	combout => \FreqDiv|Add0~50_combout\);

-- Location: FF_X109_Y16_N25
\FreqDiv|cnt4[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|Add0~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|cnt4\(25));

-- Location: LCCOMB_X110_Y16_N14
\FreqDiv|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Equal0~7_combout\ = (!\FreqDiv|cnt4\(24) & !\FreqDiv|cnt4\(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \FreqDiv|cnt4\(24),
	datad => \FreqDiv|cnt4\(25),
	combout => \FreqDiv|Equal0~7_combout\);

-- Location: LCCOMB_X110_Y17_N12
\FreqDiv|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Equal0~2_combout\ = (\FreqDiv|cnt4\(3) & (!\FreqDiv|cnt4\(4) & (!\FreqDiv|cnt4\(5) & !\FreqDiv|cnt4\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt4\(3),
	datab => \FreqDiv|cnt4\(4),
	datac => \FreqDiv|cnt4\(5),
	datad => \FreqDiv|cnt4\(6),
	combout => \FreqDiv|Equal0~2_combout\);

-- Location: LCCOMB_X110_Y16_N8
\FreqDiv|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Equal0~3_combout\ = (\FreqDiv|cnt4\(1) & (!\FreqDiv|cnt4\(15) & (\FreqDiv|cnt4\(2) & \FreqDiv|cnt4\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt4\(1),
	datab => \FreqDiv|cnt4\(15),
	datac => \FreqDiv|cnt4\(2),
	datad => \FreqDiv|cnt4\(0),
	combout => \FreqDiv|Equal0~3_combout\);

-- Location: LCCOMB_X110_Y16_N26
\FreqDiv|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Equal0~0_combout\ = (\FreqDiv|cnt4\(12) & (\FreqDiv|cnt4\(14) & (!\FreqDiv|cnt4\(13) & \FreqDiv|cnt4\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt4\(12),
	datab => \FreqDiv|cnt4\(14),
	datac => \FreqDiv|cnt4\(13),
	datad => \FreqDiv|cnt4\(11),
	combout => \FreqDiv|Equal0~0_combout\);

-- Location: LCCOMB_X110_Y16_N6
\FreqDiv|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Equal0~1_combout\ = (\FreqDiv|cnt4\(10) & (\FreqDiv|cnt4\(9) & (!\FreqDiv|cnt4\(7) & !\FreqDiv|cnt4\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|cnt4\(10),
	datab => \FreqDiv|cnt4\(9),
	datac => \FreqDiv|cnt4\(7),
	datad => \FreqDiv|cnt4\(8),
	combout => \FreqDiv|Equal0~1_combout\);

-- Location: LCCOMB_X110_Y16_N10
\FreqDiv|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Equal0~4_combout\ = (\FreqDiv|Equal0~2_combout\ & (\FreqDiv|Equal0~3_combout\ & (\FreqDiv|Equal0~0_combout\ & \FreqDiv|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Equal0~2_combout\,
	datab => \FreqDiv|Equal0~3_combout\,
	datac => \FreqDiv|Equal0~0_combout\,
	datad => \FreqDiv|Equal0~1_combout\,
	combout => \FreqDiv|Equal0~4_combout\);

-- Location: LCCOMB_X110_Y16_N0
\FreqDiv|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|Equal0~8_combout\ = (\FreqDiv|Equal0~6_combout\ & (\FreqDiv|Equal0~5_combout\ & (\FreqDiv|Equal0~7_combout\ & \FreqDiv|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|Equal0~6_combout\,
	datab => \FreqDiv|Equal0~5_combout\,
	datac => \FreqDiv|Equal0~7_combout\,
	datad => \FreqDiv|Equal0~4_combout\,
	combout => \FreqDiv|Equal0~8_combout\);

-- Location: LCCOMB_X110_Y16_N20
\FreqDiv|s_clk4hz~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FreqDiv|s_clk4hz~0_combout\ = \FreqDiv|s_clk4hz~q\ $ (\FreqDiv|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \FreqDiv|s_clk4hz~q\,
	datad => \FreqDiv|Equal0~8_combout\,
	combout => \FreqDiv|s_clk4hz~0_combout\);

-- Location: FF_X110_Y16_N21
\FreqDiv|s_clk4hz\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \FreqDiv|s_clk4hz~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FreqDiv|s_clk4hz~q\);

-- Location: LCCOMB_X113_Y21_N28
\escolhaProd|Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \escolhaProd|Selector3~0_combout\ = ((!\escolhaProd|state.hold_drinks~q\ & \escolhaProd|select_word\(0))) # (!\escolhaProd|state.hold_helo~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \escolhaProd|state.hold_drinks~q\,
	datac => \escolhaProd|select_word\(0),
	datad => \escolhaProd|state.hold_helo~q\,
	combout => \escolhaProd|Selector3~0_combout\);

-- Location: FF_X113_Y21_N29
\escolhaProd|select_word[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \escolhaProd|Selector3~0_combout\,
	ena => \debouncer|ALT_INV_s_pulsedOut~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \escolhaProd|select_word\(0));

-- Location: LCCOMB_X114_Y21_N6
\display|Mux27~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux27~0_combout\ = ((\escolhaProd|select_word\(2) & ((\escolhaProd|select_word\(0)))) # (!\escolhaProd|select_word\(2) & ((!\escolhaProd|select_word\(0)) # (!\FreqDiv|s_clk4hz~q\)))) # (!\display|Mux26~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|Mux26~4_combout\,
	datab => \escolhaProd|select_word\(2),
	datac => \FreqDiv|s_clk4hz~q\,
	datad => \escolhaProd|select_word\(0),
	combout => \display|Mux27~0_combout\);

-- Location: LCCOMB_X114_Y21_N16
\display|Mux26~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux26~5_combout\ = (\escolhaProd|select_word\(0) & (\FreqDiv|s_clk4hz~q\ & !\escolhaProd|select_word\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \escolhaProd|select_word\(0),
	datac => \FreqDiv|s_clk4hz~q\,
	datad => \escolhaProd|select_word\(2),
	combout => \display|Mux26~5_combout\);

-- Location: LCCOMB_X114_Y21_N22
\display|Mux26~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux26~6_combout\ = (\escolhaProd|select_word\(1)) # ((\escolhaProd|select_word\(3)) # (!\display|Mux26~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \escolhaProd|select_word\(1),
	datac => \escolhaProd|select_word\(3),
	datad => \display|Mux26~5_combout\,
	combout => \display|Mux26~6_combout\);

-- Location: LCCOMB_X114_Y21_N26
\display|Mux13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux13~0_combout\ = (!\escolhaProd|select_word\(3) & !\escolhaProd|select_word\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \escolhaProd|select_word\(3),
	datad => \escolhaProd|select_word\(2),
	combout => \display|Mux13~0_combout\);

-- Location: LCCOMB_X114_Y21_N4
\display|Mux25~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux25~0_combout\ = ((\escolhaProd|select_word\(1) & (\escolhaProd|select_word\(0))) # (!\escolhaProd|select_word\(1) & ((!\FreqDiv|s_clk4hz~q\) # (!\escolhaProd|select_word\(0))))) # (!\display|Mux13~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \escolhaProd|select_word\(1),
	datab => \escolhaProd|select_word\(0),
	datac => \display|Mux13~0_combout\,
	datad => \FreqDiv|s_clk4hz~q\,
	combout => \display|Mux25~0_combout\);

-- Location: LCCOMB_X114_Y21_N18
\display|Mux24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux24~0_combout\ = (\escolhaProd|select_word\(0) & (((\escolhaProd|select_word\(1)) # (\escolhaProd|select_word\(2))) # (!\FreqDiv|s_clk4hz~q\))) # (!\escolhaProd|select_word\(0) & ((\escolhaProd|select_word\(1) $ 
-- (!\escolhaProd|select_word\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|s_clk4hz~q\,
	datab => \escolhaProd|select_word\(0),
	datac => \escolhaProd|select_word\(1),
	datad => \escolhaProd|select_word\(2),
	combout => \display|Mux24~0_combout\);

-- Location: LCCOMB_X114_Y21_N0
\display|Mux24~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux24~1_combout\ = (\escolhaProd|select_word\(3)) # (\display|Mux24~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \escolhaProd|select_word\(3),
	datad => \display|Mux24~0_combout\,
	combout => \display|Mux24~1_combout\);

-- Location: LCCOMB_X114_Y21_N2
\display|Mux21~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux21~0_combout\ = (!\escolhaProd|select_word\(0) & (!\escolhaProd|select_word\(3) & (\escolhaProd|select_word\(1) $ (\escolhaProd|select_word\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \escolhaProd|select_word\(1),
	datab => \escolhaProd|select_word\(0),
	datac => \escolhaProd|select_word\(3),
	datad => \escolhaProd|select_word\(2),
	combout => \display|Mux21~0_combout\);

-- Location: LCCOMB_X114_Y21_N12
\display|Mux20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux20~0_combout\ = (!\escolhaProd|select_word\(0) & ((\escolhaProd|select_word\(1) & (!\escolhaProd|select_word\(3) & !\escolhaProd|select_word\(2))) # (!\escolhaProd|select_word\(1) & (\escolhaProd|select_word\(3) $ 
-- (\escolhaProd|select_word\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \escolhaProd|select_word\(1),
	datab => \escolhaProd|select_word\(0),
	datac => \escolhaProd|select_word\(3),
	datad => \escolhaProd|select_word\(2),
	combout => \display|Mux20~0_combout\);

-- Location: LCCOMB_X114_Y21_N14
\display|Mux19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux19~0_combout\ = (!\escolhaProd|select_word\(1) & (!\escolhaProd|select_word\(0) & (\escolhaProd|select_word\(3) & !\escolhaProd|select_word\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \escolhaProd|select_word\(1),
	datab => \escolhaProd|select_word\(0),
	datac => \escolhaProd|select_word\(3),
	datad => \escolhaProd|select_word\(2),
	combout => \display|Mux19~0_combout\);

-- Location: LCCOMB_X114_Y21_N8
\display|Mux18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux18~0_combout\ = (!\escolhaProd|select_word\(1) & (!\escolhaProd|select_word\(0) & (\escolhaProd|select_word\(3) $ (\escolhaProd|select_word\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \escolhaProd|select_word\(1),
	datab => \escolhaProd|select_word\(0),
	datac => \escolhaProd|select_word\(3),
	datad => \escolhaProd|select_word\(2),
	combout => \display|Mux18~0_combout\);

-- Location: LCCOMB_X114_Y21_N30
\display|Mux16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux16~0_combout\ = (\escolhaProd|select_word\(1) & ((\escolhaProd|select_word\(3)) # (\escolhaProd|select_word\(2)))) # (!\escolhaProd|select_word\(1) & (\escolhaProd|select_word\(3) $ (!\escolhaProd|select_word\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \escolhaProd|select_word\(1),
	datac => \escolhaProd|select_word\(3),
	datad => \escolhaProd|select_word\(2),
	combout => \display|Mux16~0_combout\);

-- Location: LCCOMB_X114_Y21_N24
\display|Mux16~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux16~1_combout\ = (\display|Mux16~0_combout\ & (((\escolhaProd|select_word\(3)) # (!\display|Mux26~5_combout\)))) # (!\display|Mux16~0_combout\ & (\escolhaProd|select_word\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|Mux16~0_combout\,
	datab => \escolhaProd|select_word\(0),
	datac => \escolhaProd|select_word\(3),
	datad => \display|Mux26~5_combout\,
	combout => \display|Mux16~1_combout\);

-- Location: LCCOMB_X114_Y21_N10
\display|Mux13~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux13~1_combout\ = (\escolhaProd|select_word\(0) & (((\escolhaProd|select_word\(3)) # (\escolhaProd|select_word\(2))) # (!\FreqDiv|s_clk4hz~q\))) # (!\escolhaProd|select_word\(0) & ((\escolhaProd|select_word\(3) $ 
-- (!\escolhaProd|select_word\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FreqDiv|s_clk4hz~q\,
	datab => \escolhaProd|select_word\(0),
	datac => \escolhaProd|select_word\(3),
	datad => \escolhaProd|select_word\(2),
	combout => \display|Mux13~1_combout\);

-- Location: LCCOMB_X114_Y21_N28
\display|Mux13~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux13~2_combout\ = (\escolhaProd|select_word\(1)) # (\display|Mux13~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \escolhaProd|select_word\(1),
	datad => \display|Mux13~1_combout\,
	combout => \display|Mux13~2_combout\);

ww_LEDR(0) <= \LEDR[0]~output_o\;

ww_LEDG(0) <= \LEDG[0]~output_o\;

ww_LEDG(1) <= \LEDG[1]~output_o\;

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
END structure;


