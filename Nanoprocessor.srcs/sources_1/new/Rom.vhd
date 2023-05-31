----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.05.2023 19:35:49
-- Design Name: 
-- Module Name: LUT_16_7 - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Rom is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end Rom;

architecture Behavioral of Rom is
begin
    process (address)
    begin  
        case address is
            when "000" =>
                data <= "100010001010";
            when "001" =>
                data <= "100100000001";
            when "010" =>
                data <= "010100000000";
            when "011" =>
                data <= "000010100000";
            when "100" =>
                data <= "110010000111";
            when "101" =>
                data <= "110000000011";
            when "110" =>
                data <= "000000000000";
            when others =>
                data <= "000000000000";
        end case;
    end process;

end Behavioral;