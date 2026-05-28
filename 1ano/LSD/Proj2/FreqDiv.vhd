library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FreqDiv is
  port (
    clk50   : in  std_logic;
    clk4hz  : out std_logic
  );
end FreqDiv;

architecture behavioral of FreqDiv is
  constant DIV4HZ : natural := 12_500_000;
  
  signal cnt4     : unsigned(25 downto 0) := (others => '0');
  signal s_clk4hz : std_logic := '0';
  
begin

  process(clk50)
  begin
    if rising_edge(clk50) then
      if cnt4 = DIV4HZ/2 - 1 then
        s_clk4hz <= not s_clk4hz;
        cnt4    <= (others => '0');
      else
        cnt4 <= cnt4 + 1;
      end if;
    end if;
  end process;

  clk4hz <= s_clk4hz;

end behavioral;
