library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sub3 is
    -- Entradas e saída
    port (
        i_a : in  std_logic_vector(2 downto 0);
        i_b : in  std_logic_vector(2 downto 0);
        o_s : out std_logic_vector(2 downto 0)
    );
end sub3;

architecture arch_1 of sub3 is
begin

    -- Subtração usando complemento de dois
    o_s <= std_logic_vector(
        unsigned(i_a) - unsigned(i_b)
    );

end arch_1;
