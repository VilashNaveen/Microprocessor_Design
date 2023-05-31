----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.05.2023 16:03:42
-- Design Name: 
-- Module Name: Mux_8_Way_4_bit - Behavioral
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

entity Mux_8_Way_4_bit is
    Port (
        I_0 : in STD_LOGIC_VECTOR(3 downto 0);
        I_1 : in STD_LOGIC_VECTOR(3 downto 0);
        I_2 : in STD_LOGIC_VECTOR(3 downto 0);
        I_3 : in STD_LOGIC_VECTOR(3 downto 0);
        I_4 : in STD_LOGIC_VECTOR(3 downto 0);
        I_5 : in STD_LOGIC_VECTOR(3 downto 0);
        I_6 : in STD_LOGIC_VECTOR(3 downto 0);
        I_7 : in STD_LOGIC_VECTOR(3 downto 0);
        S   : in STD_LOGIC_VECTOR(2 downto 0);
        Y   : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Mux_8_Way_4_bit;

architecture Behavioral of Mux_8_Way_4_bit is
begin
    process (S, I_0, I_1, I_2, I_3, I_4, I_5, I_6, I_7)
    begin
        case S is
            when "000" =>
                Y <= I_0;
            when "001" =>
                Y <= I_1;
            when "010" =>
                Y <= I_2;
            when "011" =>
                Y <= I_3;
            when "100" =>
                Y <= I_4;
            when "101" =>
                Y <= I_5;
            when "110" =>
                Y <= I_6;
            when "111" =>
                Y <= I_7;
            when others =>
                Y <= (others => '0'); -- Default case
        end case;
    end process;
end Behavioral;
