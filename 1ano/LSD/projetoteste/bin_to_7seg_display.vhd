library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin_to_7seg_display is
  port (
    count   : in  unsigned(3 downto 0);
    enable  : in  std_logic;  -- SW(0) ativa displays
    hex0    : out std_logic_vector(6 downto 0); -- Unidades
    hex1    : out std_logic_vector(6 downto 0)  -- Dezenas
  );
end bin_to_7seg_display;

architecture behavioral of bin_to_7seg_display is
  signal unidades : unsigned(3 downto 0);
  signal dezenas  : unsigned(3 downto 0);
  signal seg_u, seg_d : std_logic_vector(6 downto 0);

  -- Tabela de 7 segmentos (comum cátodo)
  function to_7seg(n : unsigned(3 downto 0)) return std_logic_vector is
    variable seg : std_logic_vector(6 downto 0);
  begin
    case n is
      when "0000" => seg := "1000000"; -- 0
      when "0001" => seg := "1111001"; -- 1
      when "0010" => seg := "0100100"; -- 2
      when "0011" => seg := "0110000"; -- 3
      when "0100" => seg := "0011001"; -- 4
      when "0101" => seg := "0010010"; -- 5
      when "0110" => seg := "0000010"; -- 6
      when "0111" => seg := "1111000"; -- 7
      when "1000" => seg := "0000000"; -- 8
      when "1001" => seg := "0010000"; -- 9
      when others => seg := "1111111"; -- Apagado
    end case;
    return seg;
  end function;
begin
  -- Separar dezenas e unidades (0–11)
  process(count)
  begin
    if count < 10 then
      dezenas  <= "0000";
      unidades <= count;
    else
      dezenas  <= "0001";      dezenas  <= "0001";
      unidades <= count - 10;

      unidades <= count - 10;
    end if;
  end process;

  -- Aplicar conversão para 7 segmentos
  seg_u <= to_7seg(unidades);
  seg_d <= to_7seg(dezenas);

  -- Mostrar ou apagar com base no switch
  hex0 <= seg_u when enable = '1' else "1111111";
  hex1 <= seg_d when enable = '1' else "1111111";
end behavioral;
