----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2018 03:40:24 PM
-- Design Name: 
-- Module Name: decoder_3_to_8tb - Behavioral
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

entity decoder_3_to_8tb is
--  Port ( );
end decoder_3_to_8tb;

--change to decoder 4 to 9
architecture Behavioral of decoder_3_to_8tb is

    component decoder_3_to_8
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
    end component;
    
    signal q0,q1,q2,q3,q4,q5,q6,q7,q8 : std_logic;
    signal input : std_logic_vector(3 downto 0);
    constant delay: Time := 100ns;
    
begin
    uut: decoder_3_to_8 PORT MAP ( 
        A => input,
        Q0 => q0,
        Q1 => q1,
        Q2 => q2,
        Q3 => q3,
        Q4 => q4,
        Q5 => q5,
        Q6 => q6,
        Q7 => q7,
        Q8 => q8
    );
 
 --loading inputs from 0 to 7 in bits of 3.   
    dec_proc : process 
        begin
            --(not input(0)) and (not input(1)) and (not input(2)) and (not input(3))
            input <= "0000";
            wait for delay;
            --input(0)) and (not input(1)) and (not input(2) and (not input(3))
            input <= "0001";
            wait for delay;
            --(not input(0)) and input(1) and (not input(2)) and (not input(3))
            input <= "0010";
            wait for delay;
            --(input(0) and input(1) and (not input(2)) and (not input(3))
            input <= "0011";
            wait for delay;
            --(not input(0)) and (not input(1)) and  input(2) and (not input(3))
            input <= "0100";
            wait for delay;
            --input(0) and (not input(1)) and  input(2) and (not input(3))
            input <= "0101";
            wait for delay;
            --(not input(0)) and input(1) and  input(2) and (not input(3))
            input <= "0110";
            wait for delay;
            --input(0) and input(1) and  input(2) and (not input(3))
            input <= "0111";
            wait for delay; 
            --(not input(0)) and (not input(1)) and (not input(2)) and input(3)
            input <= "1000";
            wait for delay;
            
            --dont care inputs, should have no effect on the output
            input <= "1001";
            wait for delay;
            input <= "1010";
            wait for delay;
            input <= "1011";
            wait for delay;
            input <= "1100";
            wait for delay;
            input <= "1101";
            wait for delay;
            input <= "1110";
            wait for delay; 
            input <= "1111";
            wait;
        end process;                                                                               
end Behavioral;
