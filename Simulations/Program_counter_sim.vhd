----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.05.2023 15:32:13
-- Design Name: 
-- Module Name: Program_counter_sim - Behavioral
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

entity Program_counter_sim is
--  Port ( );
end Program_counter_sim;

architecture Behavioral of Program_counter_sim is

component Program_counter
    Port ( 
           Q :out  STD_LOGIC_VECTOR  (2 downto 0);
           D : in std_logic_vector (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC);
end component;

signal Q,D : std_logic_vector(2 downto 0);
signal Res,Clk : std_logic;

begin

UUT: Program_counter PORT MAP(
    Q => Q,
    D => D,
    Res => Res,
    Clk => Clk );
    
process
        begin
        for i in 1 to 100 loop
        Clk <='0';
         WAIT FOR 10 ns;
        Clk <='1';
        WAIT FOR 10 ns;
        end loop;
        wait;
end process;
process
    begin
    D <= "110";
    Res <= '1';
    wait for 20ns;
    Res <='0';
    wait;
end process;


end Behavioral;
