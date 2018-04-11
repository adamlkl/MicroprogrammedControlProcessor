----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2018 06:11:29 PM
-- Design Name: 
-- Module Name: mux_2_to_1 - Behavioral
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

entity mux_2_to_1 is
--  Port ( );
port ( 
    In0 : in std_logic_vector(15 downto 0);
    In1 : in std_logic_vector(15 downto 0);
    s : in std_logic;
    Z : out std_logic_vector(15 downto 0));    
end mux_2_to_1;

architecture Behavioral of mux_2_to_1 is

begin
    Z <= In0 after 1 ns when s='0' else
         In1 after 1 ns when s='1'else
         x"0000" after 1 ns;
end Behavioral;