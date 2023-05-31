----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.05.2023 14:24:19
-- Design Name: 
-- Module Name: Program_counter - Behavioral
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_counter is
    Port ( 
           Q :out  STD_LOGIC_VECTOR  (2 downto 0);
           D : in std_logic_vector (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC);
end Program_counter;

architecture Behavioral of Program_counter is 
    
    component D_FF 
        Port ( D : in STD_LOGIC_vector( 2 downto 0);
              Res : in STD_LOGIC;
              Clk : in STD_LOGIC;
              Q : out STD_LOGIC_vector (2 downto 0));
    end component; 
    
 
 signal Clk_slow : std_logic; 
 
begin 
    
        
    D_FF_0 : D_FF
        port map (
        D => D,
        Clk => Clk,
        Res => Res,
        Q => Q );
        
   
    
end Behavioral;
