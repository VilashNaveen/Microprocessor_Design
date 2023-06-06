----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.06.2023 11:23:17
-- Design Name: 
-- Module Name: Adder_3_bit_Sim - Behavioral
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

entity Adder_3_bit_Sim is

end Adder_3_bit_Sim;

architecture Behavioral of Adder_3_bit_Sim is
component Adder_3_bit is
    Port ( 
           A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal A, S : std_logic_vector(2 downto 0);

begin

UUT: Adder_3_bit PORT MAP(
    A=> A,
    S => S);

process
begin
A <= "001";
wait for 20ns;
A <= "000";
wait for 20ns;
A <= "100";
wait;
end process;

end Behavioral;
