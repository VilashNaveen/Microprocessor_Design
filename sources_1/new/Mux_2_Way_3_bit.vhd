----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.05.2023 15:36:17
-- Design Name: 
-- Module Name: Mux_2_Way_3_bit - Behavioral
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

entity Mux_2_Way_3_bit is
    Port ( A_3 : in STD_LOGIC_VECTOR (2 downto 0);
           A_J : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0);
           Jmp : in STD_LOGIC);
end Mux_2_Way_3_bit;

architecture Behavioral of Mux_2_Way_3_bit is

begin

process (A_3, A_J, Jmp)
    begin
        if Jmp = '1' then
            S <= A_J;
        else
            S <= A_3;
        end if;
    end process;
    

end Behavioral;
