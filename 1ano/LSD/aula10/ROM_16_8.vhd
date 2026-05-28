library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ROM_16_8 is
    Port (
        address : in  std_logic_vector(3 downto 0);
        dataOut : out std_logic_vector(7 downto 0)
    );
end ROM_16_8;

architecture Behavioral of ROM_16_8 is
    subtype TDataWord is std_logic_vector(7 downto 0);

    type TROM is array (0 to 15) of TDataWord;

constant c_memory : TROM := (
    "00000000",
    "00000001",
    "00000010",
    "00000100",
    "00001000",
    "00010000",
    "00100000",
    "01000000",
    "10000000",
    "10000001",
    "10000010",
    "10000100",
    "10001000",
    "10010000",
    "10100000",
    "11111111" 
);
begin
    dataOut <= c_memory(to_integer(unsigned(address)));
end Behavioral;
