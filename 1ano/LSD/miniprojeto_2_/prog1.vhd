library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity prog1 is
    port(
		  ACTV : in std_logic_vector(3 downto 0);
		  LEDR : out std_logic_vector(3 downto 0);
		  LEDG : out std_logic_vector(3 downto 0)
    );
end prog1;
architecture behavioral of prog1 is
begin
    LEDR <= (others => '1') when ACTV = "0001" else (others => '0');
	 LEDG <= (others => '1') when ACTV = "0001" else (others => '0');
end behavioral;

