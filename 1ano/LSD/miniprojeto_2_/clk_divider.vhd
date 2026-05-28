----------------------------------------------------------------------------------
-- Modified Clock Divider (0.25 Hz for 4-second modes)
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk_divider is
  port (
    clk50    : in  std_logic;
    clk1hz   : out std_logic;
    clk2hz   : out std_logic;
    clk0_25hz : out std_logic  -- Renamed for 4-second period (0.25 Hz)
  );
end clk_divider;

architecture behavioral of clk_divider is
  constant DIV1HZ    : natural := 25_000_000;    -- 1 Hz
  constant DIV2HZ    : natural := 12_500_000;    -- 2 Hz
  constant DIV0_25HZ : natural := 200_000_000;   -- 0.25 Hz (4-second period)

  signal cnt1      : unsigned(25 downto 0) := (others => '0');
  signal cnt2      : unsigned(25 downto 0) := (others => '0');
  signal cnt0_25   : unsigned(27 downto 0) := (others => '0');  -- Adjusted for 100M

  signal s_clk1hz   : std_logic := '0';
  signal s_clk2hz   : std_logic := '0';
  signal s_clk0_25hz : std_logic := '0';

begin
  process(clk50)
  begin
    if rising_edge(clk50) then
      -- 1Hz clock (unchanged)
      if cnt1 = DIV1HZ/2 - 1 then
        s_clk1hz <= not s_clk1hz;
        cnt1 <= (others => '0');
      else
        cnt1 <= cnt1 + 1;
      end if;

      -- 2Hz clock (unchanged)
      if cnt2 = DIV2HZ/2 - 1 then
        s_clk2hz <= not s_clk2hz;
        cnt2 <= (others => '0');
      else
        cnt2 <= cnt2 + 1;
      end if;

      -- 0.25Hz clock (NEW 4-second period)
      if cnt0_25 = DIV0_25HZ/2 - 1 then
        s_clk0_25hz <= not s_clk0_25hz;
        cnt0_25 <= (others => '0');
      else
        cnt0_25 <= cnt0_25 + 1;
      end if;
    end if;
  end process;

  clk1hz <= s_clk1hz;
  clk2hz <= s_clk2hz;
  clk0_25hz <= s_clk0_25hz;  -- Renamed output
end behavioral;