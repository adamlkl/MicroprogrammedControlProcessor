----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2018 09:56:36 PM
-- Design Name: 
-- Module Name: Extend_PC - Behavioral
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

entity Extend_PC is
--  Port ( );
    port (
        DR_in, SB_in : in std_logic_vector (2 downto 0);
        Extend_PC_out : out std_logic_vector (15 downto 0));
end Extend_PC;

architecture Behavioral of Extend_PC is

begin
    Extend_PC_out (2 downto 0) <= SB_in;
    Extend_PC_out (5 downto 3) <= DR_in;
    Extend_PC_out (15 downto 6) <= "0000000000" when (DR_in(2)='0') else "1111111111"; 
end Behavioral;
