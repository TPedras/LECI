library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Bin2Bcd is
  port(
    count   : in  unsigned(3 downto 0);
    sinal   : in  std_logic;
    decOut0 : out std_logic_vector(3 downto 0);
    decOut1 : out std_logic_vector(3 downto 0)
  );
end Bin2Bcd;

architecture Behavioral of Bin2Bcd is
begin
  process (count, sinal)
    variable abs_val : unsigned(3 downto 0);
  begin
    if sinal = '1' then
      abs_val := (not count) + 1;  -- Fixed variable name
    else
      abs_val := count;
    end if;
	 if sinal = '1' and count = "0000" then
		decOut1 <= "0001";
		decOut0 <= "0110";
    elsif abs_val < 10 then
      decOut1 <= "0000";
      decOut0 <= std_logic_vector(abs_val);
    else
      decOut1 <= "0001";
      decOut0 <= std_logic_vector(abs_val - 10);
    end if;
  end process;
end Behavioral;