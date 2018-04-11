----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 07:23:14 PM
-- Design Name: 
-- Module Name: arithmethic_unittb - Behavioral
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

entity arithmethic_unittb is
--  Port ( );
end arithmethic_unittb;

architecture Behavioral of arithmethic_unittb is
    component arithmethic_unit 
    port(
         Cin :in std_logic;
         A,B :in std_logic;
         aS0,aS1 :in std_logic;
         Cout :out std_logic;
         G :out std_logic);
    end component;
    
    signal Cin,A,B,aS0,aS1,Cout,G : std_logic;
   
begin
    
    uut: arithmethic_unit port map(
        Cin=>Cin,
        A=>A,
        B=>B,
        aS0=>aS0,
        aS1=>aS1,
        Cout=>Cout,
        G=>G);
        
    stim: process
        begin 
            A<='0';
            B<='1';
            Cin<='1';
            
            --A+1
            aS0<='0';
            aS1<='0';
            wait for 50ns;
            
            --A+B+1            
            aS0<='1';
            aS1<='0';
            wait for 50ns;
                   
            --A + NOT B + 1                         
            aS0<='0';
            aS1<='1';
            wait for 50ns;
            
            --A                                   
            aS0<='1';
            aS1<='1';
            wait for 50ns;
            
            
            Cin<='0';
            --A
            aS0<='0';
            aS1<='0';
            wait for 50ns;
            
            --A+B                        
            aS0<='1';
            aS1<='0';
            wait for 50ns;
            
            --A + NOT B                                    
            aS0<='0';
            aS1<='1';
            wait for 50ns;
              
            --A-1                                                
            aS0<='1';
            aS1<='1';
            wait;
    end process;
end Behavioral;
