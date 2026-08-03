----------------------------------------------------------------------------------
-- Engineer: Turan
-- Module Name: tb_alu - Behavioral
-- Project Name: Custom 32-Bit FPGA Processor
-- Description: ALU Testbench (Simulation Verification)
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Testbench modüllerinin dış dünyaya açılan PORT'u OLMAZ!
entity tb_alu is
end entity tb_alu;

architecture Behavioral of tb_alu is

    -- 1. Test Edeceğimiz ALU Modülünü Tanımlıyoruz (Component)
    component alu is
        generic (
            DATA_WIDTH : integer := 32;
            CTRL_WIDTH : integer := 5
        );
        port (
            a        : in  std_logic_vector(DATA_WIDTH-1 downto 0);
            b        : in  std_logic_vector(DATA_WIDTH-1 downto 0);
            alu_ctrl : in  std_logic_vector(CTRL_WIDTH-1 downto 0);
            shamt    : in  std_logic_vector(4 downto 0);
            result   : out std_logic_vector(DATA_WIDTH-1 downto 0);
            zero     : out std_logic
        );
    end component;

    -- 2. ALU Giriş ve Çıkışlarına Bağlayacağımız Test Sinyalleri
    signal tb_a        : std_logic_vector(31 downto 0) := (others => '0');
    signal tb_b        : std_logic_vector(31 downto 0) := (others => '0');
    signal tb_alu_ctrl : std_logic_vector(4 downto 0)  := (others => '0');
    signal tb_shamt    : std_logic_vector(4 downto 0)  := (others => '0');
    signal tb_result   : std_logic_vector(31 downto 0);
    signal tb_zero     : std_logic;

begin

    -- 3. ALU Modülünü Bağlama (Unit Under Test - UUT)
    uut: alu
        generic map (
            DATA_WIDTH => 32,
            CTRL_WIDTH => 5
        )
        port map (
            a        => tb_a,
            b        => tb_b,
            alu_ctrl => tb_alu_ctrl,
            shamt    => tb_shamt,
            result   => tb_result,
            zero     => tb_zero
        );

    -- 4. Test Senaryolarını Çalıştıran Process
    stim_proc: process
    begin
        -- Test 1: Toplama (ADD) -> 10 + 20 = 30
        tb_a        <= x"0000000A"; -- Hex 10
        tb_b        <= x"00000014"; -- Hex 20
        tb_alu_ctrl <= "00000";     -- ADD kodu
        tb_shamt    <= "00000";
        wait for 10 ns;

        -- Test 2: Çıkarma (SUB) -> 50 - 50 = 0 (Zero Flag '1' olmalı!)
        tb_a        <= x"00000032"; -- Hex 50
        tb_b        <= x"00000032"; -- Hex 50
        tb_alu_ctrl <= "00001";     -- SUB kodu
        wait for 10 ns;

        -- Test 3: Sağa Mantıksal Kaydırma (SRL) -> 16 >> 2 = 4
        tb_a        <= x"00000010"; -- Hex 16
        tb_shamt    <= "00010";     -- 2 bit kaydır
        tb_alu_ctrl <= "00111";     -- SRL kodu
        wait for 10 ns;

        -- Testleri Bitir
        wait;
    end process;

end Behavioral;