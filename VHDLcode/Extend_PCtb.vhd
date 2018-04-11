----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2018 10:07:07 PM
-- Design Name: 
-- Module Name: Extend_PCtb - Behavioral
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

entity Extend_PCtb is
--  Port ( );
end Extend_PCtb;

architecture Behavioral of Extend_PCtb is
    component Extend_PC port(
        DR_in, SB_in : in std_logic_vector (2 downto 0);
        Extend_PC_out : out std_logic_vector (15 downto 0));
    end component;
    
    signal DR_in, SB_in : std_logic_vector (2 downto 0);
    signal Extend_PC_out : std_logic_vector (15 downto 0);
    constant delay : time := 50ns;
    
begin
    
    uut : Extend_PC port map (
        DR_in => DR_in,
        SB_in => SB_in,
        Extend_PC_out => Extend_PC_out);
    
    stim: process 
        begin 
            --load negative number 
            --result : FFEE
            DR_in <= "101";
            SB_in <= "110";
            wait for delay;
            
            --load positive number
            --result : 001d
            DR_in <= "011";
            SB_in <= "101";
            wait for delay;
        end process;
end Behavioral;
