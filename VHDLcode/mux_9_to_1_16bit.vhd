----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 05:16:11 PM
-- Design Name: 
-- Module Name: mux_9_to_1_16bit - Behavioral
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

entity mux_9_to_1_16bit is
--  Port ( );
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
    Z : out std_logic_vector(15 downto 0));
end mux_9_to_1_16bit;

architecture Behavioral of mux_9_to_1_16bit is

begin
    Z <= In0 after 1 ns when S="0000" else
         In1 after 1 ns when S="0001" else
         In2 after 1 ns when S="0010" else
         In3 after 1 ns when S="0011" else
         In4 after 1 ns when S="0100" else
         In5 after 1 ns when S="0101" else
         In6 after 1 ns when S="0110" else
         In7 after 1 ns when S="0111" else         
         In8 after 1 ns when S="1000" else 
         "0000000000000000" after 1 ns;
end Behavioral;
