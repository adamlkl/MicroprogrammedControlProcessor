----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 04:42:59 PM
-- Design Name: 
-- Module Name: mux_4_to_1_1bit - Behavioral
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

entity mux_4_to_1_1bit is
--  Port ( );
    PORT(
        In0, In1, In2, In3 : in std_logic;    
        S0, S1 : in std_logic;
        Z : out std_logic);
end mux_4_to_1_1bit;

architecture Behavioral of mux_4_to_1_1bit is

begin
    

    Z <= In0 after 1 ns when S1='0' and S0='0' else
         In1 after 1 ns when S1='0' and S0='1' else
         In2 after 1 ns when S1='1' and S0='0' else
         In3 after 1 ns when S1='1' and S0='1' else
         '0' after 1 ns;


end Behavioral;
