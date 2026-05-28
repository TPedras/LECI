library ieee;
use ieee.std_logic_1164.all;

entity bin7segdecoder is
    port(
        bininput  : in  std_logic_vector(3 downto 0);
        binoutput : out std_logic_vector(6 downto 0)
    );
end bin7segdecoder;

architecture behavioral of bin7segdecoder is
begin
    binoutput <= 
        "1111110" when (bininput = "0000") else  -- 0
        "0110000" when (bininput = "0001") else  -- 1
        "1101101" when (bininput = "0010") else  -- 2
        "1111001" when (bininput = "0011") else  -- 3
        "0110011" when (bininput = "0100") else  -- 4
        "1011011" when (bininput = "0101") else  -- 5
        "1011111" when (bininput = "0110") else  -- 6
        "1110000" when (bininput = "0111") else  -- 7
        "1111111" when (bininput = "1000") else  -- 8
        "1111011" when (bininput = "1001") else  -- 9
        "1110111" when (bininput = "1010") else  -- A
        "0011111" when (bininput = "1011") else  -- B
        "1001110" when (bininput = "1100") else  -- C
        "0111101" when (bininput = "1101") else  -- D
        "1001111" when (bininput = "1110") else  -- E
        "1000111" when others;               -- F/Others
end behavioral;