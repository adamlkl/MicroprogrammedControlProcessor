----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/16/2018 12:20:10 PM
-- Design Name: 
-- Module Name: decoder_3_to_8 - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder_3_to_8 is
--  Port ( );
--  modified to fit 4 inputs and 9 outputs 
    Port ( 
        A : in std_logic_vector(3 downto 0);        
        Q0 : out std_logic;
        Q1 : out std_logic;
        Q2 : out std_logic;
        Q3 : out std_logic;
        Q4 : out std_logic;
        Q5 : out std_logic;
        Q6 : out std_logic;
        Q7 : out std_logic;
        Q8 : out std_logic
        );
end decoder_3_to_8;

architecture Behavioral of decoder_3_to_8 is
    
begin
    Q0 <= ((not A(0)) and (not A(1)) and (not A(2)) and (not A(3))) after 1 ns;
    Q1 <= ((A(0)) and (not A(1)) and (not A(2)) and (not A(3))) after 1 ns;
    Q2 <= ((not A(0)) and  A(1) and (not A(2)) and (not A(3))) after 1 ns;
    Q3 <= (A(0) and  A(1) and (not A(2)) and (not A(3))) after 1 ns;
    Q4 <= ((not A(0)) and (not A(1)) and  A(2) and (not A(3))) after 1 ns;
    Q5 <= (A(0) and (not A(1)) and  A(2) and (not A(3))) after 1 ns;
    Q6 <= ((not A(0)) and A(1) and  A(2) and (not A(3))) after 1 ns;
    Q7 <= (A(0) and A(1) and A(2) and (not A(3))) after 1 ns;
    Q8 <= ((not A(0)) and (not A(1)) and (not A(2)) and  A(3)) after 1 ns;
  
end Behavioral;
