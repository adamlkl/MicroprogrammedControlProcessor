----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 07:02:36 PM
-- Design Name: 
-- Module Name: arithmethic_unit - Behavioral
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

entity arithmethic_unit is
--  Port ( );
    port(
        Cin :in std_logic;
        A,B :in std_logic;
        aS0,aS1 :in std_logic;
        Cout :out std_logic;
        G :out std_logic);
end arithmethic_unit;

architecture Behavioral of arithmethic_unit is
    component mux_2_to_1_1bit
        port(   
            In0 : in std_logic;
            In1 : in std_logic;
            s : in std_logic;
            Z : out std_logic);   
        end component; 
        
    component full_adder
        port(
            A    : in STD_LOGIC;
            B    : in STD_LOGIC;
            Cin  : in STD_LOGIC;
            G    : out STD_LOGIC;
            Cout : out STD_LOGIC); 
        end component;
        
    signal Y : std_logic;
    signal  and_b, and_not_b, or_b : std_logic;

begin
    and_b <= B after 1ns when aS0='1' else '0' after 1ns;
    and_not_b <= (not B) after 1ns when aS1='1' else '0' after 1ns;
    or_b <= (and_b or and_not_b);
        

    au_mux2to1: mux_2_to_1_1bit port map(
        In0 => aS1,
        In1 => aS0,
        s   => B,
        Z   => Y);

    au_full_adder: full_adder port map(
        A => A,
        B => Y,
        Cin => Cin,
        Cout => Cout,
        G => G);
        
end Behavioral;
