----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.05.2023 10:59:53
-- Design Name: 
-- Module Name: MicroProcessor - Behavioral
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

entity MicroProcessor is
    Port ( 
        Clk,Res : in std_logic;
        Overflow, Zero : out std_logic;
        Reg_out : out std_logic_vector(3 downto 0);
        Seg_out : out STD_LOGIC_VECTOR (6 downto 0)
    );
end MicroProcessor;

architecture Behavioral of MicroProcessor is
    component Reg_bank
    Port (
        En : in std_logic_vector(2 downto 0);
        I : in std_logic_vector(3 downto 0);
        Clk : in std_logic;
        O_bus_0,O_bus_1,O_bus_2,O_bus_3,O_bus_4,O_bus_5,O_bus_6,O_bus_7 : out std_logic_vector(3 downto 0)
     );
    end component;
     component Instruction_decoder
     Port ( 
         I : in std_logic_vector(11 downto 0);
         Reg_jmp : in std_logic_vector(3 downto 0);
         Mode, Load, Jmp_flag : out std_logic;
         R_en, R_se_1, R_se_2, Ad_Jmp : out std_logic_vector( 2 downto 0);
         Im_val : out std_logic_vector(3 downto 0));
     end component;
     component ROM
     Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
                data : out STD_LOGIC_VECTOR (11 downto 0));
     end component;
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
     component Mux_2_Way_4_bit
     Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
                B : in STD_LOGIC_VECTOR (3 downto 0);
                S : out STD_LOGIC_VECTOR (3 downto 0);
                En : in STD_LOGIC);
     end component;
     component Mux_2_Way_3_bit
     Port ( A_3 : in STD_LOGIC_VECTOR (2 downto 0);
                A_J : in STD_LOGIC_VECTOR (2 downto 0);
                S : out STD_LOGIC_VECTOR (2 downto 0);
                Jmp : in STD_LOGIC);
     end component;
     component Slow_Clk
     Port ( Clk_in : in STD_LOGIC;
        Clk_out : out STD_LOGIC);
     end component;
     component Add_Sub_4_bit
     Port ( Mode : in STD_LOGIC;
        A : in STD_LOGIC_VECTOR (3 downto 0);
        B : in STD_LOGIC_VECTOR (3 downto 0);
        S : out STD_LOGIC_VECTOR (3 downto 0);
        C : out STD_LOGIC;
        Zero : out STD_LOGIC;
        Overflow : out std_logic);
     end component;
     component Adder_3_bit
     Port ( 
        A : in STD_LOGIC_VECTOR (2 downto 0);
        S : out STD_LOGIC_VECTOR (2 downto 0));
     end component;
      component Program_counter
      Port ( 
         Q :out  STD_LOGIC_VECTOR  (2 downto 0);
         D : in std_logic_vector (2 downto 0);
         Res : in STD_LOGIC;
         Clk : in STD_LOGIC);
     end component;
     component Seg_7 is
         Port (I : in STD_LOGIC_VECTOR (3 downto 0);
         O : out STD_LOGIC_VECTOR (6 downto 0));
     end component; 
     
     signal Clk_temp, Jmp_flag, Load, Mode, temp_1 : std_logic;
     signal Im_val, I,A,B,S : std_logic_vector (3 downto 0);
     signal Mux_jmp, Ad_3_to_Mux, R_en, Reg_se_1,Reg_se_2, Address_temp,Ad_jmp : std_logic_vector (2 downto 0);
     signal Bus_12 : std_logic_vector (11 downto 0);
     signal O_bus_n,O_bus_1,O_bus_2,O_bus_3,O_bus_4,O_bus_5,O_bus_6,O_bus_7 : std_logic_vector(3 downto 0);
begin
    
    Slow_Clk_0 : Slow_Clk
        port map (
            Clk_in => Clk,
            Clk_out => Clk_temp);
            
    Instruction_decoder_0 : Instruction_decoder
            port map (
                I => Bus_12,
                Reg_jmp => A,
                Mode => Mode,
                Load => Load,
                Jmp_flag => Jmp_flag,
                R_en => R_en,
                R_se_1 => Reg_se_1,
                R_se_2 => Reg_se_2,
                Ad_Jmp => Ad_jmp,
                Im_val => Im_val);
            
    Rom_0 : Rom
            port map (
                address => Address_temp,
                data => Bus_12);
                
    program_counter_0 : Program_counter
        port map (
            Q => Address_temp,
            D => Mux_jmp,
            Res => Res,
            Clk => Clk_temp);

    Adder_3_bit_0 : Adder_3_bit
        port map (
            A => Address_temp,
            S => Ad_3_to_Mux);

    Mux_2_Way_3_bit_0 : Mux_2_Way_3_bit
        port map (
            A_3 => Ad_3_to_Mux,
            A_J => Ad_jmp,
            S => Mux_jmp,
            Jmp => Jmp_flag);
            
        Reg_bank_0 : Reg_bank
        port map (
            En => R_en,
            I => I,
            Clk => Clk_temp,
            O_bus_0 => O_bus_n,
            O_bus_1 => O_bus_1,
            O_bus_2 => O_bus_2,
            O_bus_3 =>O_bus_3,
            O_bus_4 =>O_bus_4,
            O_bus_5 =>O_bus_5,
            O_bus_6 =>O_bus_6,
            O_bus_7 =>O_bus_7);
            
    Mux_2_Way_4_bit_0 : Mux_2_Way_4_bit
        port map (
            A => S,
            B => Im_val,
            S => I,
            En => Load);
            
    Add_Sub_4_bit_0 : Add_Sub_4_bit
            port map (
                Mode => Mode,
                A => A,
                B => B,
                S => S,
                C => temp_1,
                Zero => Zero,
                Overflow => Overflow);                  

    Mux_8_Way_4_bit_0 : Mux_8_Way_4_bit
        port map (
            I_0 =>O_bus_n,
            I_1 =>O_bus_1,
            I_2 =>O_bus_2,
            I_3 =>O_bus_3,
            I_4 =>O_bus_4,
            I_5 =>O_bus_5,
            I_6 =>O_bus_6,
            I_7 =>O_bus_7,
            S => Reg_se_1,
            Y => A);
    Mux_8_Way_4_bit_1 : Mux_8_Way_4_bit
        port map (
            I_0 =>O_bus_n,
            I_1 =>O_bus_1,
            I_2 =>O_bus_2,
            I_3 =>O_bus_3,
            I_4 =>O_bus_4,
            I_5 =>O_bus_5,
            I_6 =>O_bus_6,
            I_7 =>O_bus_7,
            S => Reg_se_2,
            Y => B);
    Seg_7_0 : Seg_7
        Port map(I=> O_bus_7,
             O=>Seg_out); 

        
    Reg_out <= O_bus_7;


end Behavioral;
