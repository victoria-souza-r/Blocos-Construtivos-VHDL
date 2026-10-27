library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity som3 is
    -- Entradas e saída
    port (
        i_a : in  std_logic_vector(2 downto 0);
        i_b : in  std_logic_vector(2 downto 0);
        o_s : out std_logic_vector(2 downto 0)
    );
end som3;

architecture arch_1 of som3 is
begin

    -- unsigned = número sem sinal
    o_s <= std_logic_vector(unsigned(i_a) + unsigned(i_b));

end arch_1;
