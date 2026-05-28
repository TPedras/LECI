library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CounterUpDown4 is
    port (
        clk    : in  std_logic;
        upDown : in  std_logic;
        reset  : in  std_logic;
        count  : out std_logic_vector(3 downto 0)
    );
end CounterUpDown4;

architecture behavioral of CounterUpDown4 is
    signal s_count : unsigned(3 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                s_count <= (others => '0');
            else
                if upDown = '1' then
                    s_count <= s_count + 1;
                else
                    s_count <= s_count - 1;
                end if;
            end if;
        end if;
    end process;
    count <= std_logic_vector(s_count);
end behavioral;
