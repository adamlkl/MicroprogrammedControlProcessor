----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 02:57:19 PM
-- Design Name: 
-- Module Name: mux_8_to_1_1bit - Behavioral
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

entity mux_8_to_1_1bit is
--  Port ( );
    port ( 
    In0 : in std_logic;
    In1 : in std_logic;
    In2 : in std_logic;
    In3 : in std_logic;
    In4 : in std_logic;
    In5 : in std_logic;
    In6 : in std_logic;
    In7 : in std_logic;
    S : in std_logic_vector(2 downto 0);
    Z : out std_logic);
end mux_8_to_1_1bit;

architecture Behavioral of mux_8_to_1_1bit is
begin
     Z <= In0 after 1 ns when S="000" else
          In1 after 1 ns when S="001" else
          In2 after 1 ns when S="010" else
          In3 after 1 ns when S="011" else
          In4 after 1 ns when S="100" else
          In5 after 1 ns when S="101" else
          In6 after 1 ns when S="110" else
          In7 after 1 ns when S="111" else         
          '0' after 1 ns;
end Behavioral;
