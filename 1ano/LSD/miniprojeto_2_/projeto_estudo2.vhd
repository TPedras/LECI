library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity projeto_estudo2 is
  port (
    CLOCK_50 : in  std_logic;
    SW       : in  std_logic_vector(1 downto 0);
    HEX0     : out std_logic_vector(6 downto 0);
    HEX4     : out std_logic_vector(6 downto 0);
    HEX6     : out std_logic_vector(6 downto 0);
    LEDR     : out std_logic_vector(3 downto 0);
    LEDG     : out std_logic_vector(3 downto 0)
  );
end projeto_estudo2;

architecture structural of projeto_estudo2 is
  signal pulse_1hz, pulse_2hz, pulse_0_25hz : std_logic;
  signal prog_sel   : std_logic_vector(3 downto 0);
  signal count_gr, count_rd : unsigned(3 downto 0);
  
  -- Sinais dos programas
  signal ledr_p1, ledr_p2, ledr_p3, ledr_p4 : std_logic_vector(3 downto 0);
  signal ledg_p1, ledg_p2, ledg_p3, ledg_p4 : std_logic_vector(3 downto 0);
begin

  clock_gen: entity work.clock_generator
    port map(
      CLOCK_50    => CLOCK_50,
      pulse_1hz   => pulse_1hz,
      pulse_2hz   => pulse_2hz,
      pulse_0_25hz => pulse_0_25hz
    );

  decoder: entity work.Dec2_4
    port map(
      SW     => SW,
      HEX_N  => HEX0,
      PROG   => prog_sel
    );

  -- Instância de todos os programas
  prog1_inst: entity work.prog1
    port map(
      ACTV  => prog_sel,
      LEDR  => ledr_p1,
      LEDG  => ledg_p1
    );

  prog2_inst: entity work.prog2
    port map(
      clk   => CLOCK_50,
      pulse => pulse_2hz,
      ACTV  => prog_sel,
      LEDR  => ledr_p2,
      LEDG  => ledg_p2
    );

  prog3_inst: entity work.prog3
    port map(
      clk   => CLOCK_50,
      pulse => pulse_1hz,
      ACTV  => prog_sel,
      LEDR  => ledr_p3,
      LEDG  => ledg_p3
    );

  prog4_inst: entity work.prog4
    port map(
      clk         => CLOCK_50,
      pulse_1hz   => pulse_1hz,
      pulse_2hz   => pulse_2hz,
      pulse_mode  => pulse_0_25hz,
      ACTV        => prog_sel,
      LEDR        => ledr_p4,
      LEDG        => ledg_p4,
      COUNT_R     => count_rd,
      COUNT_G     => count_gr
    );

  -- Multiplexação das saídas
  LEDR <= ledr_p1 when prog_sel = "0001" else
          ledr_p2 when prog_sel = "0010" else
          ledr_p3 when prog_sel = "0100" else
          ledr_p4 when prog_sel = "1000" else
          (others => '0');

  LEDG <= ledg_p1 when prog_sel = "0001" else
          ledg_p2 when prog_sel = "0010" else
          ledg_p3 when prog_sel = "0100" else
          ledg_p4 when prog_sel = "1000" else
          (others => '0');

  -- Decodificadores para displays
  hex4_decoder: entity work.Bin7SegDecoder
    port map(
      binInput => std_logic_vector(count_gr),
      decOut_n => HEX4
    );

  hex6_decoder: entity work.Bin7SegDecoder
    port map(
      binInput => std_logic_vector(count_rd),
      decOut_n => HEX6
    );

end structural;