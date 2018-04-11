----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2018 09:45:52 PM
-- Design Name: 
-- Module Name: zero_filltb - Behavioral
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

entity zero_filltb is
--  Port ( );
end zero_filltb;

architecture Behavioral of zero_filltb is
    component zero_fill port (
        zero_fill_in : in std_logic_vector(2 downto 0);
        zero_fill_out : out std_logic_vector (15 downto 0));
    end component;
    
    signal zero_fill_in : std_logic_vector (2 downto 0);
    signal zero_fill_out :  std_logic_vector (15 downto 0);
    constant delay : Time:=50ns;
    
begin
    
    uut : zero_fill port map (
        zero_fill_in => zero_fill_in,
        zero_fill_out => zero_fill_out);
        
    stim : process 
        begin 
            --output should be 0000 0000 0000 0101
            zero_fill_in <= "101";
            wait for delay;
            --output should be 0000 0000 0000 0110
            zero_fill_in <= "110";
            wait; 
     end process;         
end Behavioral;
