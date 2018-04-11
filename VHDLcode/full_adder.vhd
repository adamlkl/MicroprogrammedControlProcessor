----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2018 06:33:15 PM
-- Design Name: 
-- Module Name: full_adder - Behavioral
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

entity full_adder is
--  Port ( );
    Port ( 
        A    : in STD_LOGIC;
        B    : in STD_LOGIC;
        Cin  : in STD_LOGIC;
        G    : out STD_LOGIC;
        Cout : out STD_LOGIC);
end full_adder;

architecture gate_level  of full_adder is
    constant gate_delay: Time :=1ns;
begin
     G <= (A XOR B XOR Cin) after gate_delay;
     --Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B) after gate_delay ;
     Cout <= (A AND B) OR (Cin AND (A XOR B)) after gate_delay ;
end gate_level;
