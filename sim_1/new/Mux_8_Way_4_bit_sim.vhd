----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.05.2023 15:54:48
-- Design Name: 
-- Module Name: Mux_8_Way_4_bit_sim - Behavioral
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

entity Mux_8_Way_4_bit_sim is
--  Port ( );
end Mux_8_Way_4_bit_sim;

architecture Behavioral of Mux_8_Way_4_bit_sim is

component Mux_8_Way_4_bit
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
end component;

signal I_0,I_1,I_2,I_3,I_4,I_5,I_6,I_7,Y : std_logic_vector(3 downto 0);
signal S : std_logic_vector(2 downto 0);

begin

UUT: Mux_8_Way_4_bit PORT MAP(
    I_0 => I_0,
    I_1 => I_1,
    I_2 => I_2,
    I_3 => I_3,
    I_4 => I_4,
    I_5 => I_5,
    I_6 => I_6,
    I_7 => I_7,
    s => s,
    y => y
);
process
begin

    I_1 <= "1001";
    I_3 <= "1101";
    I_5 <= "1011";
    I_7 <= "1000";
    
    S <= "011";
    wait for 100 ns;
    S <= "101";
    wait for 100 ns;
    s <= "111";
    wait;
    
    
end process;


end Behavioral;
