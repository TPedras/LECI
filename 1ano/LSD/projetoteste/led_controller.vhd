library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_controller is
  port (
    count    : in  unsigned(3 downto 0);
    clk4hz   : in  std_logic;
    ledr     : out std_logic_vector(3 downto 0);
    ledg     : out std_logic_vector(8 downto 0)
  );
end led_controller;

architecture behavioral of led_controller is
  signal blink : std_logic := '0';
begin
  process(clk4hz)
  begin
    if rising_edge(clk4hz) then
      blink <= not blink;
    end if;
  end process;

  ledr <= std_logic_vector(count) when blink = '1' else "0000";
  ledg <= (others => '1');  -- LEDs verdes sempre ligados
end behavioral;
