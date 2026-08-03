----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Turan
-- 
-- Create Date: 02.08.2026 20:52:15
-- Design Name: RISC-V 32-Bit Core (2D Game Engine Compatible)
-- Module Name: alu - Behavioral
-- Project Name: Custom 32-Bit FPGA Processor
-- Target Devices: Sipeed Tang Nano 9K / Gowin FPGA
-- Tool Versions: Gowin EDA / Vivado
-- Description: 
-- 32-bit RISC-V uyumlu Arithmetic Logic Unit (ALU).
-- Aritmetik (ADD, SUB), mantıksal (AND, OR, XOR, NOR), kaydırma (SLL, SRL, SRA)
-- ve karşılaştırma (SLT, SLTU) işlemlerini destekler.
-- 2D oyun grafik hesaplamaları ve koordinat güncellemeleri için tasarlanmıştır.
-- 
-- Dependencies: IEEE.STD_LOGIC_1164, IEEE.NUMERIC_STD
-- 
-- Revision:
-- Revision 0.01 - File Created (Initial 32-bit ALU Core Design)
-- Additional Comments:
----------------------------------------------------------------------------------

-- Kütüphane
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Entity
entity alu is
    generic (
        DATA_WIDTH : integer := 32; -- veri 32bit
        CTRL_WIDTH : integer := 5   -- alu kontrol 5 bit
    );
    port (
        a     : in std_logic_vector(DATA_WIDTH-1 downto 0); -- 1. 32-bitlik Sayı
        b        : in  std_logic_vector(DATA_WIDTH-1 downto 0); -- 2. 32-bitlik Sayı
        alu_ctrl     : in std_logic_vector(CTRL_WIDTH-1 downto 0); -- 5-bitlik İşlem Kodu
        shamt    :  in  std_logic_vector(4 downto 0); -- 5-bitlik giriş Kodu
        result   : out std_logic_vector(DATA_WIDTH-1 downto 0); -- 32-bitlik Sonuç
        zero     :  out std_logic -- 1-bitlik Sıfır

        -- Port kısmı giriş ve çıkış yani şöyle bir devre için 2 kablo bağladınız ve oradan 1 kablo çıkardınız bi tık saçma oldu ama öyle


        
    );
end entity;

-- Architecture
architecture Kaiser of alu is

begin

    

end Kaiser;