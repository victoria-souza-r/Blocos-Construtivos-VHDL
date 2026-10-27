library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity inc3 is
    port (
        i_a : in  std_logic_vector(2 downto 0);
        o_s : out std_logic_vector(2 downto 0)
    );
end inc3;

architecture arch_1 of inc3 is
begin

    -- unsigned = número sem sinal
    o_s <= std_logic_vector(unsigned(i_a) + 1);

end arch_1;
