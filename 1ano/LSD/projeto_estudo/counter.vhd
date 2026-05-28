library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
  port (
    clk   : in  std_logic;
    rst   : in  std_logic;           -- Reset síncrono (ativo alto)
	 frz 	 : in std_logic;
    count : out unsigned(3 downto 0);  -- Saída de 4 (-16 a -1) ou (0 a 15)
	 sinal : out std_logic
  );
end counter;

architecture behavioral of counter is
  signal s_count : unsigned(3 downto 0) := (others => '0');
  signal s_sinal : std_logic := '1';
  signal s_frz     : std_logic := '0';  -- Freeze mode flag (toggle)
  signal frz_reg   : std_logic := '0';  -- To hold previous value for edge detection

begin
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then                -- Reset síncrono (acionado por KEY[0])
        s_count <= (others => '0');
		  s_sinal <= '1';
      else
        if (frz = '1' and frz_reg = '0') then
          s_frz <= not s_frz;  -- Toggle the freeze mode flag
		  end if;
        frz_reg <= frz;  -- Update the freeze register


		if s_frz = '0' then
        if s_count = 15 then
          s_count <= (others => '0');
			 s_sinal <= not s_sinal;
        else
          s_count <= s_count + 1;
        end if;
      end if;
		end if;
    end if;
  end process;

  count <= s_count;
  sinal <= s_sinal;
end behavioral;