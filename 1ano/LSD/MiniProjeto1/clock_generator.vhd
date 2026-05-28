library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_generator is
  port(
    CLOCK_50    : in  std_logic;
    pulse_1hz   : out std_logic;
    pulse_2hz   : out std_logic;
    pulse_6s : out std_logic
  );
end clock_generator;

architecture structural of clock_generator is
begin
  gen_1hz: entity work.pulse_gen
    generic map(MAX => 25_000_000)
    port map(clk => CLOCK_50, pulse => pulse_1hz);

  gen_2hz: entity work.pulse_gen
    generic map(MAX => 12_500_000)
    port map(clk => CLOCK_50, pulse => pulse_2hz);

  gen_6s: entity work.pulse_gen
    generic map(MAX => 300_000_000)
    port map(clk => CLOCK_50, pulse => pulse_6s);
end structural;