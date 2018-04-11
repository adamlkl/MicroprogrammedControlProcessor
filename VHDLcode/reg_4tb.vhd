----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/16/2018 11:52:42 AM
-- Design Name: 
-- Module Name: reg_4tb - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg_4tb is
--  Port ( );
end reg_4tb;

architecture Behavioral of reg_4tb is
    component reg_4 
        port (
        D : in std_logic_vector(15 downto 0);
        load : in std_logic;
        Clk : in std_logic;
        Q : out std_logic_vector(15 downto 0));
    end component;

    signal d : std_logic_vector(15 downto 0);
    signal load: std_logic;
    signal clk: std_logic;
    signal q: std_logic_vector(15 downto 0);
    
begin
    dut: reg_4 PORT MAP (
    D => d,
    load => load,
    Clk => clk,
    Q => q 
    );
    
     stim_proc: process
 --to check transition of q based on values in D when load = 1
        begin            
        --cannot load 
            load <= '0';
            D <= x"AAAA";
            wait for 10ns;          
        --load value
            load <= '1';            
            wait for 10ns;
         --disable load again 
            load <= '0';                
            wait for 10ns;     
        --load again     
            D <= x"CCCC";                     
            wait for 10ns;
            load <= '1';  
            wait for 10ns;  
        end process;
              
        clock : process 
        begin 
             Clk <= '0';          
             wait for 2ns;
             Clk <= '1';          
             wait for 2ns;
        end process;
end Behavioral;
