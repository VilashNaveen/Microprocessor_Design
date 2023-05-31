----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.05.2023 12:15:15
-- Design Name: 
-- Module Name: Reg_bank - Behavioral
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

entity Reg_bank is
    Port (
        En : in std_logic_vector(2 downto 0);
        I : in std_logic_vector(3 downto 0);
        Clk : in std_logic;
        O_bus_0,O_bus_1,O_bus_2,O_bus_3,O_bus_4,O_bus_5,O_bus_6,O_bus_7 : out std_logic_vector(3 downto 0)
     );
end Reg_bank;

architecture Behavioral of Reg_bank is

component Reg
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
    EN : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal y : std_logic_vector(7 downto 0);

begin
    Decoder_3_to_8_0 : Decoder_3_to_8
        port map(
            I => En,
            En => '1',
            Y => Y);

    Reg_0 : Reg
        port map(
            D => "0000",
            En => '1',
            Clk => Clk,
            Q => O_bus_0);
            
    Reg_1 : Reg
        port map(
            D => I,
            En => y(1),
            Clk => Clk,
            Q => O_bus_1);
    Reg_2 : Reg
        port map(
            D => I,
            En => y(2),
            Clk => Clk,
            Q => O_bus_2);
    Reg_3 : Reg
        port map(
            D => I,
            En => y(3),
            Clk => Clk,
            Q => O_bus_3);
    Reg_4 : Reg
        port map(
            D => I,
            En => y(4),
            Clk => Clk,
            Q => O_bus_4);
    Reg_5 : Reg
        port map(
            D => I,
            En => y(5),
            Clk => Clk,
            Q => O_bus_5);
    Reg_6 : Reg
        port map(
            D => I,
            En => y(6),
            Clk => Clk,
            Q => O_bus_6);
    Reg_7 : Reg
        port map(
            D => I,
            En => y(7),
            Clk => Clk,
            Q => O_bus_7);
            
            



end Behavioral;
