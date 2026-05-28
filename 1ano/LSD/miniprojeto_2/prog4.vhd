library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity prog4 is
    port (
        clk    : in  std_logic;              -- 0.2 Hz clock (5s on/off)
        clk1   : in  std_logic;              -- 1 Hz clock
        clk2   : in  std_logic;              -- 2 Hz clock
        ACTV   : in  std_logic_vector(3 downto 0);
        LEDR   : out std_logic_vector(3 downto 0);
        LEDG   : out std_logic_vector(3 downto 0)
    );
end prog4;

architecture behavioral of prog4 is
    signal ledr_state : std_logic := '0';
    signal ledg_state : std_logic := '0';
    signal mode       : std_logic := '0';  -- 0: green blinks, 1: red blinks
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if ACTV = "1000" then
                mode <= not mode;
            else
                mode <= '0';  
            end if;
        end if;
    end process;

    process(clk1)
    begin
        if rising_edge(clk1) then
            if ACTV = "1000" and mode = '0' then
                ledg_state <= not ledg_state;
            else
                ledg_state <= '0';
            end if;
        end if;
    end process;

    process(clk2)
    begin
        if rising_edge(clk2) then
            if ACTV = "1000" and mode = '1' then
                ledr_state <= not ledr_state;
            else
                ledr_state <= '0';
            end if;
        end if;
    end process;

    -- Outputs
    LEDR <= (others => ledr_state) when ACTV = "1000" and mode = '1' else (others => '0');
    LEDG <= (others => ledg_state) when ACTV = "1000" and mode = '0' else (others => '0');

end behavioral;
