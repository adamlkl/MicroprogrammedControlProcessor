----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 04:20:50 PM
-- Design Name: 
-- Module Name: logic_unit - Behavioral
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

entity logic_unit is
--  Port ( );
    Port (     
    A,B :in std_logic;
    lgS0,lgS1 :in std_logic;
    G :out std_logic);
end logic_unit;

architecture Behavioral of logic_unit is
    
    component mux_4_to_1_1bit
    PORT(
        In0, In1, In2, In3 : in std_logic;    
        S0, S1 : in std_logic;
        Z : out std_logic);
    end component;
    
    signal In0,In1,In2,In3: std_logic;
     
begin
    In0<=A AND B after 1ns;
    In1<=A OR B after 1ns;
    In2<=A XOR B after 1ns;
    In3<=NOT A after 1ns;
    
    mux4to1 : mux_4_to_1_1bit port map(
        In0=>In0,
        In1=>In1,
        In2=>In2,
        In3=>In3,
        S0=>lgS0,
        S1=>lgS1,
        Z=>G);

end Behavioral;