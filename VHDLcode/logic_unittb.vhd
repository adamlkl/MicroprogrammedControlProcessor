----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 05:24:36 PM
-- Design Name: 
-- Module Name: logic_unittb - Behavioral
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

entity logic_unittb is
--  Port ( );
end logic_unittb;

architecture Behavioral of logic_unittb is
    component logic_unit
    port(
         A,B :in std_logic;
         lgS0,lgS1 :in std_logic;
         G :out std_logic);
    end component;
    
    signal A,B,lgS0,lgS1,G : std_logic;
begin
    uut: logic_unit port map(
    lgS0=>lgS0,
    lgS1=>lgS1,
    A=>A,
    B=>B,
    G=>G);
    stim:process
        begin 
            A<='1';
            B<='1';
            --A AND B
            lgS0<='0';
            lgS1<='0';
            wait for 100ns;
            
            --A OR B
            lgS0<='1';
            lgS1<='0';
            wait for 100ns;
                    
            --A XOR B            
            lgS0<='0';
            lgS1<='1';
            wait for 100ns;
                     
            --NOT A                        
            lgS0<='1';
            lgS1<='1';
            wait for 100ns;
            
            A<='0';
            B<='1';
            --A AND B
            lgS0<='0';
            lgS1<='0';
            wait for 100ns;
                     
            --A OR B            
            lgS0<='1';
            lgS1<='0';
            wait for 100ns;
                   
            --A XOR B                        
            lgS0<='0';
            lgS1<='1';
            wait for 100ns;
            
            --NOT A                                    
            lgS0<='1';
            lgS1<='1';
            wait;
       end process;                                         
       
end Behavioral;
