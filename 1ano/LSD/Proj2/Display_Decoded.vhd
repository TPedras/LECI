library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Display_Decoded is
    Port (
        select_word   : in  std_logic_vector(3 downto 0);
        blinking_4Hz  : in  std_logic;
        HEX0, HEX1, HEX2, HEX3 : out std_logic_vector(6 downto 0)
    );
end Display_Decoded;

architecture Behavioral of Display_Decoded is
begin
    process(select_word, blinking_4Hz)
    begin
        case select_word is
            when "0001" =>
                if blinking_4Hz = '1' then
                    HEX3 <= "0001001";   -- h 
                    HEX2 <= "0000110"; -- e
                    HEX1 <= "1000111"; -- l
                    HEX0 <= "1000000"; -- o
                else
                    HEX3 <= "1111111";
                    HEX2 <= "1111111";
                    HEX1 <= "1111111";
                    HEX0 <= "1111111";
                end if;
            when "0010" => -- EbEb
                HEX3 <= "0000110";
                HEX2 <= "0000011";
                HEX1 <= "0000110";
                HEX0 <= "0000011";
            when "0100" => -- CAFE
                HEX3 <= "1000110";
                HEX2 <= "0001000";
                HEX1 <= "0001110";
                HEX0 <= "0000110";
            when "1000" => -- CHA
                HEX3 <= "1000110";
                HEX2 <= "0001001";
                HEX1 <= "0001000";
                HEX0 <= "1111111";
            when others =>
                HEX3 <= "1111111";
                HEX2 <= "1111111";
                HEX1 <= "1111111";
                HEX0 <= "1111111";
        end case;
    end process;
end Behavioral;
