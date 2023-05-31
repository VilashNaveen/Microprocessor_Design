----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.04.2023 13:28:00
-- Design Name: 
-- Module Name: AU - Behavioral
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

entity AU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Carry : out STD_LOGIC);
end AU;

architecture Behavioral of AU is
    component Reg
        Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
               En : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (3 downto 0));
   end component;
   
   component RCA_4
        Port ( A0 : in STD_LOGIC;
        A1 : in STD_LOGIC;
        A2 : in STD_LOGIC;
        A3 : in STD_LOGIC;
        B0 : in STD_LOGIC;
        B1 : in STD_LOGIC;
        B2 : in STD_LOGIC;
        B3 : in STD_LOGIC;
        C_in : in STD_LOGIC;
        S0 : out STD_LOGIC;
        S1 : out STD_LOGIC;
        S2 : out STD_LOGIC;
        S3 : out STD_LOGIC;
        C_out : out STD_LOGIC);
    end component;
    
    component Slow_Clk
        Port ( Clk_in : in STD_LOGIC;
               Clk_out : out STD_LOGIC);
    end component;
    
    
    SIGNAL A_0,A_1,A_2,A_3,B_0,B_1,B_2,B_3,RegSel_n,S_0,S_1,S_2,S_3,Clk_o,carry_o : std_logic;
    
        

begin
    Slow_Clk_1 : Slow_Clk
        port map (
            Clk_in => Clk,
            Clk_out => Clk_o );
            

    Reg_0 : Reg
        port map (
            D => A,
            En => RegSel,
            Clk => Clk_o,
            Q(0) => A_0,
            Q(1) => A_1,
            Q(2) => A_2,
            Q(3) => A_3);
            
    Reg_1 : Reg
        port map (
            D => A,
            En =>  RegSel_n,
            Clk => Clk_o,
            Q(0) => B_0,
            Q(1) => B_1,
            Q(2) => B_2,
            Q(3) => B_3);
            
    RCA_4_1 : RCA_4
        port map(
                A0 => A_0,
               A1 => A_1,
               A2 => A_2,
               A3 => A_3,
               B0 => B_0,
               B1 => B_1,
               B2 => B_2,
               B3 => B_3,
               C_in => '0',
               S0 => S_0,
               S1 => S_1,
               S2 => S_2,
               S3 => S_3,
               C_out => Carry_o);
            
    RegSel_n <= not RegSel;
    zero <= not ( (S_0 or S_1 ) or (S_2 or S_3 ) or Carry_o );
    S(0) <= S_0;
    S(1) <= S_1;
    S(2) <= S_2;
    S(3) <= S_3;
    Carry <= Carry_o;
            
           


end Behavioral;
