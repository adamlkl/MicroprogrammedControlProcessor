----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 03:24:24 PM
-- Design Name: 
-- Module Name: mux_2_to_1_8bittb - Behavioral
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

entity mux_2_to_1_8bittb is
--  Port ( );
end mux_2_to_1_8bittb;

architecture Behavioral of mux_2_to_1_8bittb is
   component mux_2_to_1_8bit port (
       In0 : in std_logic_vector(7 downto 0);
       In1 : in std_logic_vector(7 downto 0);
       s : in std_logic;
       Z : out std_logic_vector(7 downto 0));  
   end component; 
   
   signal In0,In1,Z : std_logic_vector(7 downto 0);
   signal s : std_logic;
   
begin
    
    uut: mux_2_to_1_8bit port map (
        In0=>In0,
        In1=>In1,
        s=>s,
        Z=>Z);

    stim : process 
        begin 
            In0 <= "10000000";
            In1 <= "11111111";
            wait for 100 ns;
            --select In0
            s<='0';
            wait for 100 ns;
            --select In1
            s<='1';
            end process;
end Behavioral;
