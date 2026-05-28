library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity projetonatal is
  port (
    CLOCK_50 : in  std_logic;                     
    SW       : in  std_logic_vector(1 downto 0);  
    HEX0     : out std_logic_vector(6 downto 0);  
    LEDR     : out std_logic_vector(3 downto 0);
    LEDG     : out std_logic_vector(3 downto 0)
  );
end projetonatal;

architecture structural of projetonatal is
  signal clk1hz     : std_logic;
  signal clk2hz     : std_logic;
  signal clk0_2hz   : std_logic;
  signal prog_sel   : std_logic_vector(3 downto 0);
  signal hex0_sig   : std_logic_vector(6 downto 0);
  signal ledr_p1, ledr_p2, ledr_p3, ledr_p4 : std_logic_vector(3 downto 0);
  signal ledg_p1, ledg_p2, ledg_p3, ledg_p4 : std_logic_vector(3 downto 0);
  signal ledr_sig   : std_logic_vector(3 downto 0);
signal ledg_sig   : std_logic_vector(3 downto 0);
  begin

  -- Instância do divisor de clock
  clkdiv_inst : entity work.clk_divider
    port map (
      clk50     => CLOCK_50,
      clk1hz    => clk1hz,
      clk2hz    => clk2hz,
      clk0_2hz  => clk0_2hz
    );

  -- Conversão direta dos switches
  sw_decoder : entity work.Dec2_4
    port map (
      SW     => SW,
      HEX_N  => hex0_sig,
      PROG   => prog_sel
    );

  -- Saída do display
  HEX0 <= hex0_sig;

  -- Seleção do programa com ativação por enable
	prog1_inst : entity work.prog1
	  port map (
		 ACTV  => prog_sel,
		 LEDR  => ledr_p1,
		 LEDG  => ledg_p1
	  );

	prog2_inst : entity work.prog2
	  port map (
		 clk   => clk2hz,
		 ACTV  => prog_sel,
		 LEDR  => ledr_p2,
		 LEDG  => ledg_p2
	  );

	prog3_inst : entity work.prog3
	  port map (
		 clk   => clk1hz,
		 ACTV  => prog_sel,
		 LEDR  => ledr_p3,
		 LEDG  => ledg_p3
	  );

	prog4_inst : entity work.prog4
	  port map (
		 clk    => clk0_2hz,
		 clk1   => clk1hz,
		 clk2   => clk2hz,
		 ACTV   => prog_sel,
		 LEDR   => ledr_p4,
		 LEDG   => ledg_p4
	  );

	process(prog_sel, ledr_p1, ledr_p2, ledr_p3, ledr_p4, ledg_p1, ledg_p2, ledg_p3, ledg_p4)
	begin
	  case prog_sel is
		 when "0001" =>
			ledr_sig <= ledr_p1;
			ledg_sig <= ledg_p1;
		 when "0010" =>
			ledr_sig <= ledr_p2;
			ledg_sig <= ledg_p2;
		 when "0100" =>
			ledr_sig <= ledr_p3;
			ledg_sig <= ledg_p3;
		 when "1000" =>
			ledr_sig <= ledr_p4;
			ledg_sig <= ledg_p4;
		 when others =>
			ledr_sig <= (others => '0');
			ledg_sig <= (others => '0');
	  end case;
	end process;
	
  LEDR <= ledr_sig;
  LEDG <= ledg_sig;
end structural;
