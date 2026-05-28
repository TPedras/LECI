library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Hex2Display is
    Port (
        valor : in integer range 0 to 15;
        HEX0  : out std_logic_vector(6 downto 0); -- unidade
        HEX1  : out std_logic_vector(6 downto 0)  -- dezena
    );
end Hex2Display;

architecture Behavioral of Hex2Display is

    function to_7seg(input : integer) return std_logic_vector is
        variable seg : std_logic_vector(6 downto 0);
    begin
        case input is
            when 0 => seg := "1000000"; -- 0
            when 1 => seg := "1111001";
            when 2 => seg := "0100100";
            when 3 => seg := "0110000";
            when 4 => seg := "0011001";
            when 5 => seg := "0010010";
            when 6 => seg := "0000010";
            when 7 => seg := "1111000";
            when 8 => seg := "0000000";
            when 9 => seg := "0010000";
            when others => seg := "1111111";
        end case;
        return seg;
    end function;

    signal dezena, unidade : integer range 0 to 9;

begin

    process(valor)
    begin
        if valor < 10 then
            dezena  <= 0;
            unidade <= valor;
        else
            dezena  <= 1;
            unidade <= valor - 10;
        end if;
    end process;

    HEX1 <= to_7seg(dezena);
    HEX0 <= to_7seg(unidade);

end Behavioral;
