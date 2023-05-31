----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.05.2023 14:02:27
-- Design Name: 
-- Module Name: Add_Sub_4_bit_Sim - Behavioral
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

entity Add_Sub_4_bit_Sim is
--  Port ( );
end Add_Sub_4_bit_Sim;

architecture Behavioral of Add_Sub_4_bit_Sim is

  COMPONENT Add_Sub_4_bit
      Port ( Mode : in STD_LOGIC;
             A : in STD_LOGIC_VECTOR (3 downto 0);
             S : out STD_LOGIC_VECTOR (3 downto 0);
             C : out STD_LOGIC;
             B : in STD_LOGIC_VECTOR (3 downto 0);
             Zero : out STD_LOGIC);
  end component;

  SIGNAL A,B,S : std_logic_vector(3 downto 0);
  SIGNAL Mode,C,Zero : std_logic;
  

begin
  UUT: Add_Sub_4_bit PORT MAP(
    Mode => Mode,
    C =>C,
    A => A,
    B => B,
    S => S,
    Zero => Zero

  );
  process
    begin
      Mode <= '0';
      A <= "0100";
      B <= "0010";
      wait for 100ns;
      
      Mode <= '1';
      A <= "1000";
      B <= "0001";
      
      wait for 100ns;
      wait;
      
    end process;

end Behavioral;
