library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SeqDetector is
    port (
        CLOCK_50 : in std_logic;
        KEY      : in std_logic_vector(0 downto 0);
        SW       : in std_logic_vector(0 downto 0);
        LEDR     : out std_logic_vector(0 downto 0);
        LEDG     : out std_logic_vector(0 downto 0)
    );
end SeqDetector;

architecture structural of SeqDetector is
    signal s_clk : std_logic;
begin
    freq_divider : entity work.ClkDividerN(Behavioral)
        generic map(divFactor => 125_000_000)
        port map(
            clkIn  => CLOCK_50,
            clkOut => s_clk
        );

    seq_det : entity work.SeqDetFSM(MealyArch)
        port map(
            clk   => s_clk,
            reset => not KEY(0),
            xIn   => SW(0),
            zOut  => LEDR(0)
        );

    LEDG(0) <= s_clk;
end structural;
