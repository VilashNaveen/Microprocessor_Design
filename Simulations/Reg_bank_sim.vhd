----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.05.2023 13:50:33
-- Design Name: 
-- Module Name: Reg_bank_sim - Behavioral
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

entity Reg_bank_sim is
--  Port ( );
end Reg_bank_sim;

architecture Behavioral of Reg_bank_sim is
    component Reg_bank
    Port (
        En : in std_logic_vector(2 downto 0);
        I : in std_logic_vector(3 downto 0);
        Clk : in std_logic;
        O_bus_0,O_bus_1,O_bus_2,O_bus_3,O_bus_4,O_bus_5,O_bus_6,O_bus_7 : out std_logic_vector(3 downto 0)
     );
    end component;
    signal En : std_logic_vector(2 downto 0);
    signal O_bus_0,O_bus_1,O_bus_2,O_bus_3,O_bus_4,O_bus_5,O_bus_6,O_bus_7,I : std_logic_vector(3 downto 0);
    signal clk : std_logic := '0';
    


begin
    UUT: Reg_bank PORT MAP(
    En => En,
    I => I,
    Clk => Clk,
    O_bus_0 => O_bus_0,
    O_bus_1 => O_bus_1,
    O_bus_2 => O_bus_2,
    O_bus_3 => O_bus_3,
    O_bus_4 => O_bus_4,
    O_bus_5 => O_bus_5,
    O_bus_6 => O_bus_6,
    O_bus_7 => O_bus_7
    
    );
    Clk <= not clk after 3ns;
    
    process
    begin
        En <= "001";
        I <= "1010";
        wait for 100ns;
        
        En <= "100";
        I <= "0001";
        wait ;
    end process;


end Behavioral;
