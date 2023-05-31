----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.05.2023 15:15:13
-- Design Name: 
-- Module Name: Instruction_decoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Instruction_decoder is
    Port ( 
    I : in std_logic_vector(11 downto 0);
    Reg_jmp : in std_logic_vector(3 downto 0);
    Mode, Load, Jmp_flag : out std_logic;
    R_en, R_se_1, R_se_2, Ad_Jmp : out std_logic_vector( 2 downto 0);
    Im_val : out std_logic_vector(3 downto 0));
    
end Instruction_decoder;



architecture Behavioral of Instruction_decoder is

    signal instruction : std_logic_vector(1 downto 0);
    signal reg_temp_1,reg_temp_2: std_logic_vector(2 downto 0);
    signal val_temp : std_logic_vector(3 downto 0);
    
begin

    instruction <= I(11 downto 10);
    reg_temp_1 <= I(9 downto 7);
    reg_temp_2 <= I(6 downto 4);
    val_temp <= I(3 downto 0);
process(instruction, reg_temp_1, reg_temp_2, val_temp, Reg_Jmp)
    begin
        if instruction = "10" then
            R_en <= "000";
            Im_val <= val_temp;
            Load <= '0';
            R_en <= reg_temp_1;
            
        elsif instruction = "00" then
            R_en <= "000";
            Mode <= '0';
            R_se_1 <= reg_temp_1;
            R_se_2 <= reg_temp_2;
            
            R_en <= reg_temp_1;
            Load <= '1';
            
            
        elsif instruction = "01" then
            R_en <= "000";
            Mode <= '1';
            R_se_1 <= "000";
            R_se_2 <= reg_temp_1;
            
            R_en <= reg_temp_1;
            Load <= '1';

        else
            R_se_1 <= reg_temp_1;
            R_en <= "000";
            if Reg_Jmp = "0000" then
                Jmp_flag <= '1';
                Ad_jmp <= val_temp(2 downto 0);
            end if;
        end if;
end process;
            
end Behavioral;
