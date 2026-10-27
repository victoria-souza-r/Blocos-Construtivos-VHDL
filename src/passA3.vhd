library IEEE;
use IEEE.std_logic_1164.all;

entity passA3 is
    port (
        i_a : in  std_logic_vector(2 downto 0);
        o_s : out std_logic_vector(2 downto 0)
    );
end passA3;

architecture arch_0 of passA3 is
begin

    o_s <= i_a;

end arch_0;
