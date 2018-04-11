----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2018 01:40:31 AM
-- Design Name: 
-- Module Name: function_unittb - Behavioral
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

entity function_unittb is
--  Port ( );
end function_unittb;

architecture Behavioral of function_unittb is
    component function_unit 
        port (
             A,B : in std_logic_vector(15 downto 0);
             mfS : in std_logic_vector (4 downto 0);
             F   : out std_logic_vector (15 downto 0);
             V,C,N,Z : out std_logic);
        end component;
    
    signal A,B,F : std_logic_vector (15 downto 0);
    signal V,C,N,Z : std_logic;
    signal mfS : std_logic_vector (4 downto 0);
    
begin

    uut : function_unit port map (
        A => A,
        B => B,
        mfS => mfS,
        F => F,
        V => V,
        C => C,
        N => N,
        Z => Z); 
        
    stim : process 
        begin 
            A <= x"0001";
            B <= x"0003";
            
            --partA
            --A
            mfS <= "00000";
            wait for 50ns;
            
            --A+1
            mfS <= "00001";
            wait for 50ns;
            
            --A+B
            mfS <= "00010";
            wait for 50ns;
            
            --A+B+1
            mfS <= "00011";
            wait for 50ns;
            
            --A + NOT B
            mfS <= "00100";
            wait for 50ns;
            
            --A + NOT B + 1
            mfS <= "00101";
            wait for 50ns;
            
            --A-1
            mfS <= "00110";
            wait for 50ns;
            
            --A
            mfS <= "00111";
            wait for 50ns;
            
            --A AND B
            mfS <= "01000";
            wait for 50ns;
            
            --A AND B
            mfS <= "01001";
            wait for 50ns;
            
            --A OR B
            mfS <= "01010";
            wait for 50ns;
            
            --A OR B 
            mfS <= "01011";
            wait for 50ns;
            
            --A XOR B
            mfS <= "01100";
            wait for 50ns;
            
            --A XOR B 
            mfS <= "01101";
            wait for 50ns;
            
            --NOT A
            mfS <= "01110";
            wait for 50ns;
            
            --NOT A
            mfS <= "01111";
            wait for 50ns;
            
            --this is where part B starts 
            --B
            mfS <= "10000";
            wait for 50ns;
            
            --shift right B
            mfS <= "10100";
            wait for 50ns;
            
            --shift left B
            mfS <= "11000";
            wait;
        end process;
end Behavioral;
