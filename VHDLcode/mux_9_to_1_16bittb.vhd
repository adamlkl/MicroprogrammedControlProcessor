----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 05:21:11 PM
-- Design Name: 
-- Module Name: mux_9_to_1_16bittb - Behavioral
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

entity mux_9_to_1_16bittb is
--  Port ( );
end mux_9_to_1_16bittb;

architecture Behavioral of mux_9_to_1_16bittb is
     component mux_9_to_1_16bit 
        port ( 
             In0 : in std_logic_vector(15 downto 0);
             In1 : in std_logic_vector(15 downto 0);
             In2 : in std_logic_vector(15 downto 0);
             In3 : in std_logic_vector(15 downto 0);
             In4 : in std_logic_vector(15 downto 0);
             In5 : in std_logic_vector(15 downto 0);
             In6 : in std_logic_vector(15 downto 0);
             In7 : in std_logic_vector(15 downto 0);
             In8 : in std_logic_vector(15 downto 0);
             S : in std_logic_vector (3 downto 0);      
             Z : out std_logic_vector(15 downto 0)
             );
        end component;
        
        signal In0,In1,In2,In3,In4,In5,In6,In7,In8,Z : std_logic_vector (15 downto 0);
        signal S : std_logic_vector (3 downto 0);
        constant delay: Time := 100ns;
        
begin
    uut: mux_9_to_1_16bit port map (
         In0 => In0,
         In1 => In1,
         In2 => In2,
         In3 => In3,
         In4 => In4,
         In5 => In5,
         In6 => In6,
         In7 => In7,   
         In8=>In8,
         S=>S,
         Z => z);
         
    stim : process 
        begin 
            In0 <= X"0000";
            In1 <= X"0001";
            In2 <= X"0002";
            In3 <= X"0003";
            In4 <= X"0004";
            In5 <= X"0005";
            In6 <= X"0006";     
            In7 <= X"0007";
            In8 <= X"0008";
            wait for delay;
            
            --select In0
            S<="0000";
            wait for delay;
            --select In1
            S<="0001";
            wait for delay;
            --select In2
            S<="0010";
            wait for delay;
            --select In3
            S<="0011";
            wait for delay;
            --select In4
            S<="0100";
            wait for delay;
            --select In5
            S<="0101";
            wait for delay;
            --select In6
            S<="0110";
            wait for delay;
            --select In7
            S<="0111";
            wait for delay;
            --select In8
            S<="1000";
            wait;
        end process;
end Behavioral;
