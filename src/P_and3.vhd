library IEEE;
use IEEE.std_logic_1164.all;

entity P_and3 is
    port (
        i_a : in  std_logic_vector(2 downto 0);
        i_b : in  std_logic_vector(2 downto 0);
        o_s : out std_logic_vector(2 downto 0)
    );
end P_and3;

architecture arch_1 of P_and3 is
begin

    o_s <= i_a AND i_b;

end arch_1;
