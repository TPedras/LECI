library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity prog3 is
  port (
    clk    : in  std_logic;
    pulse  : in  std_logic;  -- 1 Hz
    ACTV   : in  std_logic_vector(3 downto 0);
    LEDR   : out std_logic_vector(7 downto 0);
    LEDG   : out std_logic_vector(3 downto 0)
  );
end prog3;

architecture behavioral of prog3 is
  signal led_state : std_logic := '0';
begin
  LEDR <= (others => '0');

  process(clk)
  begin
    if rising_edge(clk) then
      if ACTV = "0100" and pulse = '1' then
        led_state <= not led_state;
      else
        led_state <= '0';
      end if;
    end if;
  end process;

  LEDG <= (others => led_state);
end behavioral;