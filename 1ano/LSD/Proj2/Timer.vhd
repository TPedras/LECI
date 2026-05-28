library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Timer is
    Port (
        clk        : in  std_logic;
        rst        : in  std_logic;
        NewTime    : in  integer range 0 to 15;
        start      : in  std_logic;
        time_exp   : out std_logic
    );
end Timer;

architecture Behavioral of Timer is
    signal counter : integer range 0 to 15 := 0;
    signal active  : std_logic := '0';
begin

    process(clk)
    begin
        if rising_edge(clk) then
            time_exp <= '0';

            if rst = '1' then
                counter <= 0;
                active  <= '0';

            elsif start = '1' then
                counter <= NewTime;
                active  <= '1';
                time_exp <= '0';

            elsif active = '1' then
                if counter > 0 then
                    counter <= counter - 1;
                else
                    time_exp <= '1';
                    active <= '0';
                end if;
            end if;
        end if;
    end process;

end Behavioral;
