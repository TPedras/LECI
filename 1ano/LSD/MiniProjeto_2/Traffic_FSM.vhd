library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Traffic_FSM is
    Port (
        clk                : in  STD_LOGIC;
        rst                : in  STD_LOGIC;
        en                 : in  STD_LOGIC;
        modo_intermitente  : in  STD_LOGIC;
        clk_blink          : in  STD_LOGIC;
        S1, S2, S3         : out STD_LOGIC_VECTOR(2 downto 0);
		  timer12, timer3 : out integer range 0 to 15
    );
end Traffic_FSM;

architecture Behavioral of Traffic_FSM is

    signal timer, timer_1_2, timer_3      : integer range 0 to 15 := 0;
    signal blink      : STD_LOGIC := '0';
	 signal s_intermitente	: std_LOGIC := '0';
    type State_Type is (S1_S2_GREEN, S1_S2_YELLOW, S3_GREEN, S3_YELLOW);
	 signal state : State_Type := S1_S2_GREEN;
	 

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                state <= S1_S2_GREEN;
                timer <= 9;
				elsif modo_intermitente = '1' and (state = S3_GREEN or state = S3_YELLOW) then
					s_intermitente <= '1';
            elsif modo_intermitente = '0' and en = '1' then
                if timer = 0 then
                    case state is
                        when S1_S2_GREEN =>
                            state <= S1_S2_YELLOW;
                            timer <= 3;
									 timer_3 <= 9;
                        when S1_S2_YELLOW =>
                            state <= S3_GREEN;
                            timer <= 6;
                        when S3_GREEN =>
                            state <= S3_YELLOW;
                            timer <= 3;
									 timer_1_2 <= 12;
                        when S3_YELLOW =>
                            state <= S1_S2_GREEN;
                            timer <= 9;
                    end case;
                else
                    timer <= timer - 1;
						  if timer_3 = 0 then
								timer_1_2 <= timer_1_2 -1;
						  elsif timer_1_2 = 0 then
								timer_3 <= timer_3 -1;
						  end if;
                end if;
            end if;
        end if;
    end process;
	 
	     process(state, s_intermitente, clk_blink)
    begin
        if s_intermitente = '1' then
            S1 <= "0" & clk_blink & "0";
            S2 <= "0" & clk_blink & "0";
            S3 <= "0" & clk_blink & "0";
        else
            case state is
                when S1_S2_GREEN =>
                    S1 <= "001";
                    S2 <= "001";
                    S3 <= "100";
                when S1_S2_YELLOW =>
                    S1 <= "010";
                    S2 <= "010";
                    S3 <= "100";
                when S3_GREEN =>
                    S1 <= "100";
                    S2 <= "100";
                    S3 <= "001";
                when S3_YELLOW =>
                    S1 <= "100";
                    S2 <= "100";
                    S3 <= "010";
            end case;
        end if;
    end process;
	 
	timer12 <= timer_1_2;
	timer3  <= timer_3;
	 
end Behavioral;
