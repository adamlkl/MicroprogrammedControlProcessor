----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 08:16:05 PM
-- Design Name: 
-- Module Name: arithmethic_logic_unittb - Behavioral
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

entity arithmethic_logic_unittb is
--  Port ( );
end arithmethic_logic_unittb;

architecture Behavioral of arithmethic_logic_unittb is
    component arithmethic_logic_unit
    port (
        --S0,S1,S2,
        S : in std_logic_vector(2 downto 0);
        Cin,A,B : in std_logic;
        Cout,G : out std_logic);
    end component;
    --S0,S1,S2,
    signal S : std_logic_vector(2 downto 0);
    signal Cin,A,B,Cout,G : std_logic;
    
begin
    uut:arithmethic_logic_unit port map(
--        S0=>S0,
--        S1=>S1,
--        S2=>S2,
        S=>S,
        A=>A,
        B=>B,
        Cin=>Cin,
        Cout=>Cout,
        G=>G);
   
   stim: process
   begin
        A<='1';
        B<='0';
       
        Cin<='1';
        S(2)<='1';
       
       --A AND B 
        S(0)<='0';
        S(1)<='0';
        wait for 50ns;

        --A OR B 
        S(0)<='1';
        S(1)<='0';
        wait for 50ns;
        
        --A XOR B 
        S(0)<='0';
        S(1)<='1';
        wait for 50ns;               
                
        --NOT A        
        S(0)<='1';
        S(1)<='1';
        wait for 50ns;  
        
        S(2)<='0';
        Cin<='0';   
        
        --A    
        S(0)<='0';
        S(1)<='0';
        wait for 50ns;
        
        --A+1
        Cin<='1';
        S(0)<='1';
        S(1)<='0';
        wait for 50ns;
         
        --A + NOT B
        Cin<='0';        
        S(0)<='0';
        S(1)<='1';
        wait for 50ns;               
           
        --A    
        Cin<='1';                
        S(0)<='1';
        S(1)<='1';                
        wait; 
    end process;
end Behavioral;
