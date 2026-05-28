library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Registo is
    Port (
        clk    : in  std_logic;
        cafe   : in  std_logic;
        cha    : in  std_logic;
        s_start_cafe : out std_logic;
        s_start_cha  : out std_logic
    );
end Registo;

architecture Behavioral of Registo is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            s_start_cafe <= cafe;
            s_start_cha  <= cha;
        end if;
    end process;
end Behavioral;
