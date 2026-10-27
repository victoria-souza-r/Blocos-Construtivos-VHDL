library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU is
    -- Entradas e saídas
    port (
        i_clk    : in  std_logic;
        i_enable : in  std_logic;
        i_clr_n  : in  std_logic;
        i_ctrl   : in  std_logic_vector(2 downto 0);
        i_a      : in  std_logic_vector(2 downto 0);
        i_b      : in  std_logic_vector(2 downto 0);
        o_result : out std_logic_vector(2 downto 0)
    );
end ALU;

architecture arch_0 of ALU is

    -- Declaração dos sinais internos e do registrador
    signal w_som, w_sub, w_inc, w_passA : std_logic_vector(2 downto 0);
    signal w_and, w_or, w_xor, w_not    : std_logic_vector(2 downto 0);
    signal w_mux_out                    : std_logic_vector(2 downto 0);
    signal r_register_result            : std_logic_vector(2 downto 0);

    -- Componente do multiplexador
    component mux8to1 is
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
    end component;

    -- Componente da soma
    component som3
        port (
            i_a : in  std_logic_vector(2 downto 0);
            i_b : in  std_logic_vector(2 downto 0);
            o_s : out std_logic_vector(2 downto 0)
        );
    end component;

    -- Componente da subtração
    component sub3
        port (
            i_a : in  std_logic_vector(2 downto 0);
            i_b : in  std_logic_vector(2 downto 0);
            o_s : out std_logic_vector(2 downto 0)
        );
    end component;

    -- Componente da incrementação
    component inc3
        port (
            i_a : in  std_logic_vector(2 downto 0);
            o_s : out std_logic_vector(2 downto 0)
        );
    end component;

    -- Componente da passagem de A
    component passa3
        port (
            i_a : in  std_logic_vector(2 downto 0);
            o_s : out std_logic_vector(2 downto 0)
        );
    end component;

    -- Componente AND
    component P_and3
        port (
            i_a : in  std_logic_vector(2 downto 0);
            i_b : in  std_logic_vector(2 downto 0);
            o_s : out std_logic_vector(2 downto 0)
        );
    end component;

    -- Componente OR
    component P_or3
        port (
            i_a : in  std_logic_vector(2 downto 0);
            i_b : in  std_logic_vector(2 downto 0);
            o_s : out std_logic_vector(2 downto 0)
        );
    end component;

    -- Componente XOR
    component P_xor3
        port (
            i_a : in  std_logic_vector(2 downto 0);
            i_b : in  std_logic_vector(2 downto 0);
            o_s : out std_logic_vector(2 downto 0)
        );
    end component;

    -- Componente NOT
    component P_not3
        port (
            i_a : in  std_logic_vector(2 downto 0);
            o_s : out std_logic_vector(2 downto 0)
        );
    end component;

    -- Componente do registrador de saída
    component output_register
        port (
            i_clk    : in  std_logic;
            i_clr_n  : in  std_logic;
            i_enable : in  std_logic;
            i_result : in  std_logic_vector(2 downto 0);
            o_result : out std_logic_vector(2 downto 0)
        );
    end component;

begin

    -- Instanciação e mapeamento dos componentes

    u_som : som3
        port map (
            i_a => i_a,
            i_b => i_b,
            o_s => w_som
        );

    u_sub : sub3
        port map (
            i_a => i_a,
            i_b => i_b,
            o_s => w_sub
        );

    u_inc : inc3
        port map (
            i_a => i_a,
            o_s => w_inc
        );

    u_passA : passa3
        port map (
            i_a => i_a,
            o_s => w_passA
        );

    u_and : P_and3
        port map (
            i_a => i_a,
            i_b => i_b,
            o_s => w_and
        );

    u_or : P_or3
        port map (
            i_a => i_a,
            i_b => i_b,
            o_s => w_or
        );

    u_xor : P_xor3
        port map (
            i_a => i_a,
            i_b => i_b,
            o_s => w_xor
        );

    u_not : P_not3
        port map (
            i_a => i_a,
            o_s => w_not
        );

    u_mux : mux8to1
        port map (
            i_ctrl   => i_ctrl,
            i_som    => w_som,
            i_sub    => w_sub,
            i_inc    => w_inc,
            i_passA  => w_passA,
            i_and    => w_and,
            i_or     => w_or,
            i_xor    => w_xor,
            i_not    => w_not,
            o_result => w_mux_out
        );

    u_output_reg_inst : output_register
        port map (
            i_clk    => i_clk,
            i_clr_n  => i_clr_n,
            i_enable => i_enable,
            i_result => w_mux_out,
            o_result => r_register_result
        );

    o_result <= r_register_result;

end arch_0;
