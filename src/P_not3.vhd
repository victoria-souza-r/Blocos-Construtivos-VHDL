library IEEE;
use IEEE.std_logic_1164.all;

entity P_not3 is
    port (
        i_a : in  std_logic_vector(2 downto 0);
        o_s : out std_logic_vector(2 downto 0)
    );
end P_not3;

architecture arch_1 of P_not3 is
begin

    o_s <= NOT i_a;

end arch_1;
