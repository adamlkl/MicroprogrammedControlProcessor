----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2018 09:40:38 PM
-- Design Name: 
-- Module Name: zero_fill - Behavioral
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

entity zero_fill is
--  Port ( );
    port (
        zero_fill_in : in std_logic_vector(2 downto 0);
        zero_fill_out : out std_logic_vector (15 downto 0));
        

end zero_fill;

architecture Behavioral of zero_fill is

begin
    zero_fill_out (2 downto 0) <= zero_fill_in;
    zero_fill_out (15 downto 3) <= "0000000000000";

end Behavioral;
