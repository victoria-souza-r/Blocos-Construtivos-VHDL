library IEEE;
use IEEE.std_logic_1164.all;

entity mux8to1 is
    port (
        i_ctrl   : in  std_logic_vector(2 downto 0);
        i_som    : in  std_logic_vector(2 downto 0);
        i_sub    : in  std_logic_vector(2 downto 0);
        i_inc    : in  std_logic_vector(2 downto 0);
        i_passA  : in  std_logic_vector(2 downto 0);
        i_and    : in  std_logic_vector(2 downto 0);
        i_or     : in  std_logic_vector(2 downto 0);
        i_xor    : in  std_logic_vector(2 downto 0);
        i_not    : in  std_logic_vector(2 downto 0);
        o_result : out std_logic_vector(2 downto 0)
    );
end mux8to1;

architecture arch_mux of mux8to1 is
begin

    process (
        i_ctrl,
        i_som,
        i_sub,
        i_inc,
        i_passA,
        i_and,
        i_or,
        i_xor,
        i_not
    )
    begin
        case i_ctrl is
            when "000" =>
                o_result <= i_som;

            when "001" =>
                o_result <= i_sub;

            when "010" =>
                o_result <= i_inc;

            when "011" =>
                o_result <= i_passA;

            when "100" =>
                o_result <= i_and;

            when "101" =>
                o_result <= i_or;

            when "110" =>
                o_result <= i_xor;

            when "111" =>
                o_result <= i_not;
        end case;
    end process;

end arch_mux;
