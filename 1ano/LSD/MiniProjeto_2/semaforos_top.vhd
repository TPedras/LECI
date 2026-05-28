library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity semaforos_top is
	port(CLOCK_50	: in  std_logic;
		  KEY			: in  std_logic_vector(0 downto 0);
		  SW			: in  std_logic_vector(0 downto 0);
		  LEDR		: out std_logic_vector(12 downto 0);
		  HEX0     : out std_logic_vector(6 downto 0);
		  HEX1     : out std_logic_vector(6 downto 0);
		  HEX2     : out std_logic_vector(6 downto 0);
		  HEX3     : out std_logic_vector(6 downto 0);
		  HEX4     : out std_logic_vector(6 downto 0);
		  HEX5     : out std_logic_vector(6 downto 0)
		);
end semaforos_top;

architecture Structural of semaforos_top is

    signal clk_en, pulse_1Hz,clk_1Hz, rst : STD_LOGIC;
	 signal TimeLeft12, TimeLeft3 	  : integer range 0 to 15;

    signal S1, S2, S3 : STD_LOGIC_VECTOR(2 downto 0);

begin


    FreqDiv : entity work.FreqDiv
    port map (
        clk50   => CLOCK_50,
        clk1hz  => clk_1Hz,
        clk_en  => pulse_1Hz
    );
	 
		Debouncer : entity work.DebounceUnit
		  generic map (
			 kHzClkFreq       => 50000,
			 mSecMinInWidth   => 10,
			 inPolarity       => '0',
			 outPolarity      => '1'
		  )
		  port map (
			 refClk    => CLOCK_50,
			 dirtyIn   => KEY(0),
			 pulsedOut => rst
		  );    

	 TrafficFSM : entity work.Traffic_FSM
    port map (
        clk                => CLOCK_50,
        rst       			=> rst,
        en                 => pulse_1Hz,
		  clk_blink          => clk_1Hz,
        modo_intermitente  => SW(0),
        S1                 => S1,
        S2                 => S2,
        S3                 => S3,
		  timer12 => TimeLeft12,
		  timer3  => TimeLeft3
		  
    );
	 
	 Display1 : entity work.Hex2Display
	 port map (
        valor => TimeLeft12,
        HEX0  => HEX0,
        HEX1  => HEX1
	 );

	 Display2 : entity work.Hex2Display
	 port map (
        valor => TimeLeft12,
        HEX0  => HEX2,
        HEX1  => HEX3
	 );
	  
	 Display3 : entity work.Hex2Display
    port map (
        valor => TimeLeft3,
        HEX0  => HEX4,
        HEX1  => HEX5
    );


    LEDR(2 downto 0)  <= S1; --  1
    LEDR(7 downto 5)  <= S2; --  2
    LEDR(12 downto 10)  <= S3; --  3
    LEDR(4 downto 3) <= (others => '0');
    LEDR(9 downto 8) <= (others => '0');
	 
	 

end Structural;