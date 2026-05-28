library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
  port (
    CLOCK_50 : in  std_logic;                     -- Clock de 50MHz
    KEY      : in  std_logic_vector(3 downto 0);  -- KEY[0] usado para reset
    SW       : in  std_logic_vector(17 downto 0); -- SW[0] ativa displays
    LEDR     : out std_logic_vector(3 downto 0);  -- LEDs vermelhos
    LEDG     : out std_logic_vector(8 downto 0);  -- LEDs verdes
    HEX0     : out std_logic_vector(6 downto 0);  -- Unidades
    HEX1     : out std_logic_vector(6 downto 0)   -- Dezenas
  );
end top;

architecture structural of top is
  signal clk1hz, clk4hz  : std_logic;                  -- Clocks de 1Hz e 4Hz
  signal count           : unsigned(3 downto 0);        -- Contador mod 12 (4 bits)
  signal ledr_sig        : std_logic_vector(3 downto 0); -- LEDs vermelhos
  signal ledg_sig        : std_logic_vector(8 downto 0); -- LEDs verdes
  signal hex0_sig        : std_logic_vector(6 downto 0); -- Display HEX0
  signal hex1_sig        : std_logic_vector(6 downto 0); -- Display HEX1
begin

  -- Instância do divisor de clock (1Hz e 4Hz)
clkdiv_inst : entity work.clk_divider_duplo
  port map (
    clk50   => CLOCK_50,
    rst     => '0',
    clk1hz  => clk1hz,
    clk4hz  => clk4hz
  );
  -- Instância do contador mod 12
  counter_inst : entity work.mod12_counter
    port map (
      clk   => clk1hz,        -- Usando clk1hz para contar
      rst   => not KEY(0),    -- Reset via KEY0
      count => count
    );

  -- Instância do controlador de LEDs
  leds_inst : entity work.led_controller
    port map (
      count  => count,        -- Passando o valor do contador para controlar os LEDs
      clk4hz => clk4hz,       -- Usando o clock de 4Hz para piscar LEDs
      ledr   => ledr_sig,      -- LEDs vermelhos (saída)
      ledg   => ledg_sig       -- LEDs verdes (saída)
    );

  -- Instância do conversor para displays de 7 segmentos
  display_inst : entity work.bin_to_7seg_display
    port map (
      count  => count,        -- Passando o valor do contador para o display
      enable => SW(0),        -- SW[0] ativa/desativa displays
      hex0   => hex0_sig,     -- HEX0 para as unidades
      hex1   => hex1_sig      -- HEX1 para as dezenas
    );

  -- Atribuições às saídas reais
  LEDR(3 downto 0) <= ledr_sig;   -- LEDs vermelhos conectados à saída

  LEDG <= ledg_sig;               -- LEDs verdes conectados à saída

  HEX0 <= hex0_sig;               -- Display HEX0 conectado à saída
  HEX1 <= hex1_sig;               -- Display HEX1 conectado à saída

end structural;
