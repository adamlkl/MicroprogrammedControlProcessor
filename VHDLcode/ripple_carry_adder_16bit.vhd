----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2018 02:29:47 PM
-- Design Name: 
-- Module Name: ripple_carry_adder_16bit - Behavioral
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

entity ripple_carry_adder_16bit is
--  Port ( );
    port (
        A : in std_logic_vector(15 downto 0);
        B : in std_logic_vector(15 downto 0);
        Cin : in std_logic;
        Cout : out std_logic;
        Vout : out std_logic;
        G : out std_logic_vector(15 downto 0));       
end ripple_carry_adder_16bit;

architecture Behavioral of ripple_carry_adder_16bit is
    component full_adder port(
         A    : in STD_LOGIC;
         B    : in STD_LOGIC;
         Cin  : in STD_LOGIC;
         G    : out STD_LOGIC;
         Cout : out STD_LOGIC);
    end component;
    
    signal C : std_logic_vector(15 downto 0);
        
begin
    
    fa0 : full_adder port map (
        A => A(0),
        B => B(0),
        Cin => Cin,
        G => G(0),
        Cout => C(1));
        
    fa1 : full_adder port map (
        A => A(1),
        B => B(1),
        Cin => C(1),
        G => G(1),
        Cout => C(2));
        
    fa2 : full_adder port map (
        A => A(2),
        B => B(2),
        Cin => C(2),
        G => G(2),
        Cout => C(3));
        
    fa3 : full_adder port map (
        A => A(3),
        B => B(3),
        Cin => C(3),
        G => G(3),
        Cout => C(4));
        
    fa4 : full_adder port map (
        A => A(4),
        B => B(4),
        Cin => C(4),
        G => G(4),
        Cout => C(5));
        
        
    fa5 : full_adder port map (
        A => A(5),
        B => B(5),
        Cin => C(5),
        G => G(5),
        Cout => C(6));
                
                
    fa6 : full_adder port map (
        A => A(6),
        B => B(6),
        Cin => C(6),
        G => G(6),
        Cout => C(7));
                        
    fa7 : full_adder port map (
        A => A(7),
        B => B(7),
        Cin => C(7),
        G => G(7),
        Cout => C(8));
                                
    fa8 : full_adder port map (
        A => A(8),
        B => B(8),
        Cin => C(8),
        G => G(8),
        Cout => C(9));
                            
    fa9 : full_adder port map (
        A => A(9),
        B => B(9),
        Cin => C(9),
        G => G(9),
        Cout => C(10));
        
    fa10 : full_adder port map (
        A => A(10),
        B => B(10),
        Cin => C(10),
        G => G(10),
        Cout => C(11));
        
    fa11 : full_adder port map (
        A => A(11),
        B => B(11),
        Cin => C(11),
        G => G(11),
        Cout => C(12));
                
    fa12 : full_adder port map (
        A => A(12),
        B => B(12),
        Cin => C(12),
        G => G(12),
        Cout => C(13));
            
    fa13 : full_adder port map (
        A => A(13),
        B => B(13),
        Cin => C(13),
        G => G(13),
        Cout => C(14));                               
           
    fa14 : full_adder port map (
        A => A(14),
        B => B(14),
        Cin => C(14),
        G => G(14),
        Cout => C(15));
    
    fa15 : full_adder port map (
        A => A(15),
        B => B(15),
        Cin => C(15),
        G => G(15),
        Cout => C(0));
        
    Cout <= C(0);
    Vout <= (C(0) XOR C(15));
end Behavioral;
