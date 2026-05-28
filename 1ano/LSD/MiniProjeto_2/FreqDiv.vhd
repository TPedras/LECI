library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FreqDiv is
  port (
    clk50   : in  std_logic;
    clk1hz  : out std_logic;
    clk_en  : out std_logic
  );
end FreqDiv;

architecture behavioral of FreqDiv is
  constant DIV1HZ : natural := 50_000_000;

  signal cnt1     : unsigned(25 downto 0) := (others => '0');
  signal s_clk1hz : std_logic := '0';
  signal s_en     : std_logic := '0';
begin

  process(clk50)
  begin
    if rising_edge(clk50) then
      if cnt1 = DIV1HZ/2 - 1 then
        s_clk1hz <= not s_clk1hz;
        cnt1     <= (others => '0');
        s_en     <= '1';
      else
        cnt1 <= cnt1 + 1;
        s_en <= '0';
      end if;
    end if;
  end process;

  clk1hz <= s_clk1hz;
  clk_en <= s_en;

end behavioral;
