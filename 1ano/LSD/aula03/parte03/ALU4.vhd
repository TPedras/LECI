library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu4 is
    port(
        a, b : in  std_logic_vector(3 downto 0);
        op   : in  std_logic_vector(2 downto 0);
        r, m : out std_logic_vector(3 downto 0)
    );
end alu4;

architecture behavioral of alu4 is
    signal s_a, s_b, s_r : unsigned(3 downto 0);
    signal s_m           : unsigned(7 downto 0);
begin
    s_a <= unsigned(a);
    s_b <= unsigned(b);
    s_m <= s_a * s_b;

    -- Process to handle division-by-zero and op codes
    process(op, s_a, s_b, s_m)
    begin
        case op is
            when "000" => 
                s_r <= s_a + s_b;         -- Addition
            when "001" => 
                s_r <= s_a - s_b;         -- Subtraction
            when "010" => 
                s_r <= s_m(3 downto 0);   -- Multiplication (lower 4 bits)
            when "011" => 
                if s_b /= 0 then          -- Division (handle divide-by-zero)
                    s_r <= s_a / s_b;
                else
                    s_r <= (others => '0');
                end if;
            when "100" => 
                if s_b /= 0 then          -- Remainder (handle divide-by-zero)
                    s_r <= s_a rem s_b;
                else
                    s_r <= (others => '0');
                end if;
            when "101" => 
                s_r <= s_a and s_b;       -- Bitwise AND
            when "110" => 
                s_r <= s_a or s_b;        -- Bitwise OR
            when "111" => 
                s_r <= s_a xor s_b;      -- Bitwise XOR
            when others => 
                s_r <= (others => '0');  -- Default case
        end case;
    end process;

    -- Output assignments
    r <= std_logic_vector(s_r);
    m <= std_logic_vector(s_m(7 downto 4)) when (op = "010") else (others => '0');

end behavioral;