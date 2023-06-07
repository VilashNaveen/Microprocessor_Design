----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.05.2023 12:36:28
-- Design Name: 
-- Module Name: MicroProcessor_sim - Behavioral
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


entity MicroProcessor_sim is
--  Port ( );
end MicroProcessor_sim;

architecture Behavioral of MicroProcessor_sim is
    component MicroProcessor
    Port ( 
        Clk,Res : in std_logic;
        Overflow, Zero : out std_logic;
        Seg_out : out STD_LOGIC_VECTOR (6 downto 0);
        Reg_out : out std_logic_vector(3 downto 0)
    );
    end component;

 SIGNAL Overflow,Zero : std_logic;
 SIGNAL Res : std_logic := '1';
 SIGNAL Reg_out :STD_LOGIC_VECTOR(3 downto 0);
 signal Clk : std_logic := '0';
 signal seg_out : std_logic_vector (6 downto 0);
    
begin
    UUT: Microprocessor PORT MAP(
        Res=>Res,
        Clk=>Clk,
        Overflow => Overflow,
        Zero => Zero,
        Reg_out => Reg_out,
        Seg_out => seg_out
        
  );
   
process
begin
        wait for 2ns;
        Clk<=not(Clk);
         
end process;

process
begin
    Res <='1';
    wait for 50ns;
    Res <= '0';
    wait;
end process;
end Behavioral;