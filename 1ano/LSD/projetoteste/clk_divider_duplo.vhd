library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk_divider_duplo is
  port (
    clk50   : in  std_logic;
    rst     : in  std_logic;
    clk1hz  : out std_logic;
    clk4hz  : out std_logic
  );
end clk_divider_duplo;

architecture behavioral of clk_divider_duplo is
  constant DIV1HZ : natural := 50_000_000;
  constant DIV4HZ : natural := 12_500_000;

  signal cnt1 : unsigned(25 downto 0) := (others => '0');
  signal cnt4 : unsigned(24 downto 0) := (others => '0');

  signal s_clk1hz : std_logic := '0';
  signal s_clk4hz : std_logic := '0';
begin
  process(clk50)
  begin
    if rising_edge(clk50) then
      if rst = '1' then
        cnt1 <= (others => '0');
        cnt4 <= (others => '0');
      else
        -- 1Hz clock
        if cnt1 = DIV1HZ/2 - 1 then
          s_clk1hz <= not s_clk1hz;
          cnt1 <= (others => '0');
        else
          cnt1 <= cnt1 + 1;
        end if;
        
        -- 4Hz clock
        if cnt4 = DIV4HZ/2 - 1 then
          s_clk4hz <= not s_clk4hz;
          cnt4 <= (others => '0');
        else
          cnt4 <= cnt4 + 1;
        end if;
      end if;
    end if;
  end process;

  clk1hz <= s_clk1hz;
  clk4hz <= s_clk4hz;
end behavioral;
