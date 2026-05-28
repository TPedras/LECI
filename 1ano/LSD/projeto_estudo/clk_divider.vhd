library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk_divider is
  port (
    clk50  : in  std_logic;
    rst    : in  std_logic;    -- Reset: when high, resets counter and clock
    frz    : in  std_logic;    -- Freeze button: toggles mode on rising edge
    clk2hz : out std_logic     -- 2 Hz output clock
  );
end clk_divider;

architecture behavioral of clk_divider is
  constant DIV2HZ : natural := 25_000_000;  -- For 2Hz output from 50MHz input
  
  signal cnt       : unsigned(25 downto 0) := (others => '0');
  signal s_clk2hz  : std_logic := '0';
  signal s_frz     : std_logic := '0';  -- Freeze mod1e flag (toggle)
  signal frz_reg   : std_logic := '0';  -- To hold previous value for edge detection
begin
  process(clk50)
  begin
    if rising_edge(clk50) then
      if rst = '1' then
        cnt      <= (others => '0');
        s_clk2hz <= '0';
      else
        if (frz = '1' and frz_reg = '0') then
          s_frz <= not s_frz;  -- Toggle the freeze mode flag
        end if;
        frz_reg <= frz;  -- Update the freeze register
        
        -- Normal operation: count and toggle clock only if freeze mode is off
        if s_frz = '0' then
          if cnt = (DIV2HZ/2 - 1) then
            s_clk2hz <= not s_clk2hz;
            cnt <= (others => '0');
          else
            cnt <= cnt + 1;
          end if;
        end if;
      end if;
    end if;
  end process;
  
  clk2hz <= s_clk2hz;
end behavioral;
