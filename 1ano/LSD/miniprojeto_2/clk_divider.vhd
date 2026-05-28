library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk_divider is
  port (
    clk50   : in  std_logic;
    clk1hz  : out std_logic;
    clk2hz  : out std_logic;
	 clk0_2hz :out std_logic
  );
end clk_divider;

architecture behavioral of clk_divider is
  constant DIV1HZ : natural := 25_000_000;
  constant DIV2HZ : natural := 12_500_000;
  constant DIV0_2HZ : natural := 250_000_000;


  signal cnt1 : unsigned(25 downto 0) := (others => '0');
  signal cnt2 : unsigned(25 downto 0) := (others => '0');
  signal cnt3 : unsigned(30 downto 0) := (others => '0');


  signal s_clk1hz : std_logic := '0';
  signal s_clk2hz : std_logic := '0';
  signal s_clk0_2hz : std_logic := '0';

begin
  process(clk50)
  begin
    if rising_edge(clk50) then
        -- 1Hz clock
        if cnt1 = DIV1HZ/2 - 1 then
          s_clk1hz <= not s_clk1hz;
          cnt1 <= (others => '0');
        else
          cnt1 <= cnt1 + 1;
        end if;
        
        -- 2Hz clock
        if cnt2 = DIV2HZ/2 - 1 then
          s_clk2hz <= not s_clk2hz;
          cnt2 <= (others => '0');
        else
          cnt2 <= cnt2 + 1;
        end if;
		  -- 0_2Hz clock
        if cnt3 = DIV0_2HZ/2 - 1 then
          s_clk0_2hz <= not s_clk0_2hz;
          cnt3 <= (others => '0');
        else
          cnt3 <= cnt3 + 1;
        end if;

      end if;
  end process;

  clk1hz <= s_clk1hz;
  clk2hz <= s_clk2hz;
  clk0_2hz <= s_clk0_2hz;

end behavioral;
