library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity prog4 is
  port (
    clk        : in  std_logic;
    pulse_1hz  : in  std_logic;
    pulse_2hz  : in  std_logic;
    pulse_mode : in  std_logic;
    ACTV       : in  std_logic_vector(3 downto 0);
    LEDR       : out std_logic_vector(3 downto 0);
    LEDG       : out std_logic_vector(3 downto 0);
    COUNT_R    : out unsigned(3 downto 0);
    COUNT_G    : out unsigned(3 downto 0)
  );
end prog4;

architecture behavioral of prog4 is
  signal mode : std_logic := '0';
  signal count_gr, count_rd : unsigned(3 downto 0);
begin
-- processo para ver o mode
  process(clk)
  begin
    if rising_edge(clk) then
      if ACTV /= "1000" then
        mode <= '0';
      elsif pulse_mode = '1' then
        mode <= not mode;
      end if;
    end if;
  end process;
-- processo para leds verde
  process(clk)
  begin
    if rising_edge(clk) then
      if ACTV = "1000" and mode = '0' then
        if pulse_1hz = '1' then
          count_gr <= count_gr + 1;
        end if;
      else
        count_gr <= (others => '0');
      end if;
    end if;
  end process;
-- processo para leds vermelhos
  process(clk)
  begin
    if rising_edge(clk) then
      if ACTV = "1000" and mode = '1' then
        if pulse_2hz = '1' then
          count_rd <= count_rd + 1;
        end if;
      else
        count_rd <= (others => '0');
      end if;
    end if;
  end process;

  COUNT_G <= count_gr;
  COUNT_R <= count_rd;
  LEDG <= (others => '1') when (mode = '0' and ACTV = "1000") else (others => '0');
  LEDR <= (others => '1') when (mode = '1' and ACTV = "1000") else (others => '0');

end behavioral;