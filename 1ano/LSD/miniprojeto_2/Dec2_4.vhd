library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Dec2_4 is
    port(
        SW   : in  std_logic_vector(1 downto 0);
		  PROG : out std_logic_vector(3 downto 0);
		  HEX_N : out std_logic_vector(6 downto 0)
    );
end Dec2_4;


architecture behavioral of Dec2_4 is
begin
	PROG <= "0001" when (SW = "00") else --1
				  "0010" when (SW = "01") else --2
				  "0100" when (SW = "10") else --3
				  "1000" when (SW = "11") else --4
				  "0000";
	HEX_N <= "1111001" when (SW = "00") else --1
				 "0100100" when (SW = "01") else --2
             "0110000" when (SW = "10") else --3
             "0011001" when (SW = "11") else --4
				 "1000000"; -- 0


		
end Behavioral;