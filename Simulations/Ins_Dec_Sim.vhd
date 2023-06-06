----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.05.2023 14:16:55
-- Design Name: 
-- Module Name: Ins_Dec_Sim - Behavioral
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

entity Ins_Dec_Sim is
--  Port ( );
end Ins_Dec_Sim;

architecture Behavioral of Ins_Dec_Sim is
component Instruction_decoder
    Port ( 
    I : in std_logic_vector(11 downto 0);
    Reg_jmp : in std_logic_vector(3 downto 0);
    Mode, Load, Jmp_flag : out std_logic;
    R_en, R_se_1, R_se_2, Ad_Jmp : out std_logic_vector( 2 downto 0);
    Im_val : out std_logic_vector(3 downto 0));
   
end component;

signal  I :  std_logic_vector(11 downto 0); 
signal Reg_jmp :  std_logic_vector(3 downto 0);
signal Mode, Load, Jmp_flag :  std_logic;
signal R_en, R_se_1, R_se_2, Ad_Jmp  : std_logic_vector( 2 downto 0);
signal Im_val : std_logic_vector(3 downto 0);
begin
UUT: Instruction_decoder PORT MAP(
        I => I,
        Reg_jmp=>Reg_jmp,
        Mode => Mode,
        Load => Load,
      Jmp_flag => Jmp_flag,
        R_en => R_en,
      R_se_1 => R_se_1,
        R_se_2 => R_se_2,
        Ad_Jmp => Ad_Jmp,
        Im_val => Im_val

        
  );
  
  process
    begin
    Reg_jmp <= "0000";
    I <= "101110000001";
        wait for 100 ns;
        
        I <= "100010000010";
        wait for 100 ns;
        
        I <= "100100000011";
        wait for 100 ns;
        
        I <= "001110010000";
        
        wait;
end process;
    

end Behavioral;