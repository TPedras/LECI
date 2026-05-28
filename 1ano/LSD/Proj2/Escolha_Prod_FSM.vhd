library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Escolha_Prod_FSM is
    Port (
        clk           : in  std_logic;
        rst           : in  std_logic;
        time_exp      : in  std_logic;
        s_start_cafe  : in  std_logic;
        s_start_cha   : in  std_logic;
        NewTime       : out integer range 0 to 15;
        start_timer   : out std_logic;
        select_word   : out std_logic_vector(3 downto 0);
        led_r         : out std_logic;
        led_g         : out std_logic
    );
end Escolha_Prod_FSM;

architecture Behavioral of Escolha_Prod_FSM is

    type State_Type is (
        INIT, HOLD_HELO, HOLD_DRINKS,
        START_CAFE, CAFE_READY,
        START_CHA, CHA_READY
    );

    signal state, next_state : State_Type := INIT;

    signal r_NewTime     : integer range 0 to 15 := 0;
    signal r_start_timer : std_logic := '0';
    signal r_select_word : std_logic_vector(3 downto 0) := (others => '0');
    signal r_led_r       : std_logic := '0';
    signal r_led_g       : std_logic := '0';

begin

    process(clk, rst)
    begin
        if rst = '1' then
            state <= INIT;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;

    process(state, time_exp, s_start_cafe, s_start_cha)
    begin
        next_state     <= state;
        r_NewTime      <= 0;
        r_start_timer  <= '0';
        r_select_word  <= (others => '0');
        r_led_r        <= '0';
        r_led_g        <= '0';

        case state is

            when INIT =>
                r_NewTime     <= 5;
                r_start_timer <= '1';
                next_state    <= HOLD_HELO;

            when HOLD_HELO =>
                r_select_word <= "0001"; -- "HELO"
                if time_exp = '1' then
                    next_state <= HOLD_DRINKS;
                end if;

            when HOLD_DRINKS =>
                r_select_word <= "0010"; -- "EbEb"
                if s_start_cafe = '1' then
                    r_NewTime     <= 10;
                    r_start_timer <= '1';
                    next_state    <= START_CAFE;
                elsif s_start_cha = '1' then
                    r_NewTime     <= 6;
                    r_start_timer <= '1';
                    next_state    <= START_CHA;
                end if;

            when START_CAFE =>
                r_select_word <= "0100"; -- "CAFE"
                r_led_r       <= '1';
                if time_exp = '1' then
                    next_state <= CAFE_READY;
                end if;

            when CAFE_READY =>
                r_select_word <= "0100"; -- "CAFE"
                r_led_g       <= '1';
                if s_start_cafe = '0' then
                    next_state <= HOLD_DRINKS;
                end if;

            when START_CHA =>
                r_select_word <= "1000"; -- "CHA"
                r_led_r       <= '1';
                if time_exp = '1' then
                    next_state <= CHA_READY;
                end if;

            when CHA_READY =>
                r_select_word <= "1000"; -- "CHA"
                r_led_g       <= '1';
                if s_start_cha = '0' then
                    next_state <= HOLD_DRINKS;
                end if;
        end case;
    end process;

    NewTime     <= r_NewTime;
    start_timer <= r_start_timer;
    select_word <= r_select_word;
    led_r       <= r_led_r;
    led_g       <= r_led_g;

end Behavioral;
