library IEEE;
use IEEE.std_logic_1164.all;

entity output_register is
    -- Entradas e saída
    port (
        i_CLK    : in  std_logic;
        i_CLR_n  : in  std_logic;
        i_ENABLE : in  std_logic;
        i_RESULT : in  std_logic_vector(2 downto 0);
        o_RESULT : out std_logic_vector(2 downto 0)
    );
end output_register;

architecture arch_0 of output_register is
begin

    process (i_CLR_n, i_CLK)
    begin
        if (i_CLR_n = '0') then
            -- Funcionamento do reset
            o_RESULT <= "000";

        elsif rising_edge(i_CLK) then
            -- Funcionamento do enable
            if i_ENABLE = '1' then
                o_RESULT <= i_RESULT;
            end if;
        end if;
    end process;

end arch_0;
