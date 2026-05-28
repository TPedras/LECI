library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity maquinas_vendas is
    Port (
        CLOCK_50    : in  std_logic;
        KEY         : in  std_logic_vector(0 downto 0);
        SW          : in  std_logic_vector(1 downto 0);
        LEDR        : out std_logic;
        LEDG        : out std_logic;
        HEX0, HEX1, HEX2, HEX3 : out std_logic_vector(6 downto 0)
    );
end maquinas_vendas;

architecture Structural of maquinas_vendas is

    signal rst, time_exp, start_timer, clk_4hz : std_logic;
    signal blinking_4hz               : std_logic := '1';
    signal s_start_cafe, s_start_cha      : std_logic;
    signal select_word                : std_logic_vector(3 downto 0);
    signal new_time                   : integer range 0 to 15;

begin


    FreqDiv : entity work.FreqDiv
    port map (
        clk50   => CLOCK_50,
        clk4hz  => clk_4Hz
    );

     debouncer : entity work.DebounceUnit
        generic map (
            kHzClkFreq       => 50000,
            mSecMinInWidth   => 10,
            inPolarity       => '0',
            outPolarity      => '1'
        )
        port map (
            refClk    => CLOCK_50,
            dirtyIn   => not KEY(0),
            pulsedOut => rst
        );

    registo : entity work.Registo
        port map (
            clk         => CLOCK_50,
            cafe        => SW(0),
            cha         => SW(1),
            s_start_cafe  => s_start_cafe,
            s_start_cha   => s_start_cha
        );

    timer : entity work.Timer
        port map (
            clk        => CLOCK_50,
            rst        => rst,
            NewTime    => new_time,
            start      => start_timer,
            time_exp   => time_exp
        );

    escolhaProd : entity work.Escolha_Prod_FSM
        port map (
            clk           => CLOCK_50,
            rst           => rst,
            time_exp      => time_exp,
            s_start_cafe    => s_start_cafe,
            s_start_cha     => s_start_cha,
            NewTime       => new_time,
            start_timer   => start_timer,
            select_word   => select_word,
            led_r         => LEDR,
            led_g         => LEDG
        );

    display : entity work.Display_Decoded
        port map (
            select_word   => select_word,
            blinking_4Hz  => clk_4hz,
            HEX0          => HEX0,
            HEX1          => HEX1,
            HEX2          => HEX2,
            HEX3          => HEX3
        );
 
		  
end Structural;
