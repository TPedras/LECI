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
    LEDR       : out std_logic_vector(7 downto 0);
    LEDG       : out std_logic_vector(3 downto 0)
  );
end prog4;

architecture behavioral of prog4 is
  signal mode        : std_logic := '0';
  signal green_blink : std_logic := '0';
  signal red_blink   : std_logic := '0';
begin

  process(clk)
  begin
    if rising_edge(clk) then
      if ACTV = "1000" and pulse_mode = '1' then
        mode <= not mode;
      elsif ACTV /= "1000" then
        mode <= '0';
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if ACTV = "1000" and mode = '0' then
        if pulse_1hz = '1' then
          green_blink <= not green_blink;
        end if;
      else
        green_blink <= '0';
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if ACTV = "1000" and mode = '1' then
        if pulse_2hz = '1' then
          red_blink <= not red_blink;
        end if;
      else
        red_blink <= '0';
      end if;
    end if;
  end process;

  LEDG <= (others => green_blink) when (ACTV = "1000" and mode = '0') else (others => '0');
  LEDR <= (others => red_blink) when (ACTV = "1000" and mode = '1') else (others => '0');

end behavioral;