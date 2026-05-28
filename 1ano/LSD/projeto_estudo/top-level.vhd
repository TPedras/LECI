library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_level is  -- Fixed entity name (no hyphen)
  port (
    CLOCK_50 : in  std_logic;                     -- Clock de 50MHz
    KEY      : in  std_logic_vector(1 downto 0);  -- KEY[0] reset, KEY[1] freeze
    HEX0     : out std_logic_vector(6 downto 0);  -- Unidades
    HEX1     : out std_logic_vector(6 downto 0);  -- Dezenas
    HEX2     : out std_logic_vector(6 downto 0)   -- Negativo
  );
end top_level;

architecture structural of top_level is
  signal clk2hz     : std_logic;
  signal count      : unsigned(3 downto 0);
  signal sinal      : std_logic;
  signal hex0_sig   : std_logic_vector(6 downto 0);
  signal hex1_sig   : std_logic_vector(6 downto 0);
  signal hex2_sig   : std_logic_vector(6 downto 0);
  signal decOut0_sig: std_logic_vector(3 downto 0);
  signal decOut1_sig: std_logic_vector(3 downto 0);

begin

  clkdiv_inst : entity work.clk_divider
    port map (
      clk50   => CLOCK_50,
      rst     => '0',
      frz     => '0',
      clk2hz  => clk2hz
    );

  counter_inst : entity work.counter
    port map (
      clk   => clk2hz,        -- Fixed clock name
      rst   => not KEY(0),
      frz   => not KEY(1),
      count => count,
      sinal => sinal
    );

  bin2bcd : entity work.Bin2Bcd
    port map (
      count => count,
      sinal => sinal,
      decOut0 => decOut0_sig,
      decOut1 => decOut1_sig
    );

  display0 : entity work.Bin7SegDecoder
    port map (
      binInput => decOut0_sig,
      decOut_n => hex0_sig
    );

  display1 : entity work.Bin7SegDecoder
    port map (
      binInput => decOut1_sig,
      decOut_n => hex1_sig    -- Fixed output signal
    );

  -- Concurrent conditional assignment for HEX2
  hex2_sig <= "0111111" when sinal = '1' else "1111111";

  HEX0 <= hex0_sig;
  HEX1 <= hex1_sig;
  HEX2 <= hex2_sig;
  
end structural;