library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_ALU is
end tb_ALU;

architecture arch_tb of tb_ALU is

    -- Componente da ALU
    component ALU is
        port (
            i_clk    : in  std_logic;
            i_enable : in  std_logic;
            i_clr_n  : in  std_logic;
            i_ctrl   : in  std_logic_vector(2 downto 0);
            i_a      : in  std_logic_vector(2 downto 0);
            i_b      : in  std_logic_vector(2 downto 0);
            o_result : out std_logic_vector(2 downto 0)
        );
    end component;

    -- Sinais internos
    signal i_clk    : std_logic := '0';
    signal w_enable : std_logic := '1';
    signal w_clr_n  : std_logic := '1'; -- Reset ativo baixo
    signal w_ctrl   : std_logic_vector(2 downto 0) := (others => '0');
    signal w_a      : std_logic_vector(2 downto 0) := (others => '0');
    signal w_b      : std_logic_vector(2 downto 0) := (others => '0');
    signal w_result : std_logic_vector(2 downto 0);

    constant clk_period : time := 10 ns;

begin

    -- Instância do DUT
    uut : ALU
        port map (
            i_clk    => i_clk,
            i_enable => w_enable,
            i_clr_n  => w_clr_n,
            i_ctrl   => w_ctrl,
            i_a      => w_a,
            i_b      => w_b,
            o_result => w_result
        );

    -- Geração do clock
    clk_process : process
    begin
        while true loop
            i_clk <= '0';
            wait for clk_period / 2;

            i_clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    stim_proc : process
    begin
        -- Reset
        w_clr_n <= '0';
