----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leong Kai Ler
-- 
-- Create Date: 02/19/2018 07:33:52 PM
-- Design Name: Datapath Design 
-- Module Name: register_filetb - Behavioral
-- Project Name: Project 1 -Datapath Design -Part A
-- Target Devices: 
-- Tool Versions: 
-- Description: Design the VHDL components (Register, Decoder, and two Multiplexer
-- 16 bit) and interconnect them to build a register file. 
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

entity register_filetb is
--  Port ( );
     
end register_filetb;

architecture Behavioral of register_filetb is
       component register_file
            Port (
               addB, addA : in std_logic_vector (3 downto 0);
               write: in std_logic; 
               des_A0: in std_logic;
               des_A1: in std_logic;
               des_A2: in std_logic;
               des_A3: in std_logic;
               Clk : in std_logic;
               data : in std_logic_vector(15 downto 0);
               reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8 : out std_logic_vector(15 downto 0);
               A,B : out std_logic_vector (15 downto 0));
        end component;
        
        --signal src_s0,src_s1,src_s2,des_A0,des_A1,des_A2,Clk,data_src : std_logic;
        signal des_A0,des_A1,des_A2,des_A3,Clk : std_logic;
        signal write : std_logic;
        signal data, A,B : std_logic_vector (15 downto 0);
        signal reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8 : std_logic_vector(15 downto 0);
        --signal data,reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7 : std_logic_vector(15 downto 0);
        signal addB, addA : std_logic_vector (3 downto 0);
        constant delay: Time := 50ns;
begin
        dut: register_file port map(
         addA => addA,
         addB => addB,
         des_A0 => des_A0,
         des_A1 => des_A1,
         des_A2 => des_A2,
         des_A3 => des_A3,
         Clk => Clk,
         write =>write, 
         data => data,
         reg0 => reg0,
         reg1 => reg1,
         reg2 => reg2,
         reg3 => reg3,
         reg4 => reg4,
         reg5 => reg5,
         reg6 => reg6,
         reg7 => reg7,
         reg8 => reg8,         
         A=>A,
         B=>B);
         
         stim : process 
         begin
 --start at 0
 --loading arbitrary hex values into each register
--   
            --enable write
            --set default addressA and B to reg0
            write <= '1';
            addA<="0000";
            addB<="0000";
            data <= x"0000";
            des_A0 <= '0';
            des_A1 <= '0';
            des_A2 <= '0';         
            des_A3 <= '0';      
            wait for delay;
                      
            --load data into reg1          
            des_A0 <= '1';
            des_A1 <= '0';
            des_A2 <= '0';   
            des_A3 <= '0';             
            data <= x"1111";
            wait for delay;
    
            
            --load data into reg2           
            des_A0 <= '0';
            des_A1 <= '1';
            des_A2 <= '0';  
            des_A3 <= '0';             
            data <= x"2222";
            wait for delay;      
            
            
            --load data into reg3           
            des_A0 <= '1';
            des_A1 <= '1';
            des_A2 <= '0';    
            des_A3 <= '0';            
            data <= x"3333";
            wait for delay;      
                        
            --load data into reg4                     
            des_A0 <= '0';
            des_A1 <= '0';
            des_A2 <= '1';   
            des_A3 <= '0';             
            data <= x"4444";
            wait for delay;      
                        
            --load data into reg5                                                    
            des_A0 <= '1';
            des_A1 <= '0';
            des_A2 <= '1'; 
            des_A3 <= '0';              
            data <= x"5555";
            wait for delay;      
                        
            --load data into reg6                       
            des_A0 <= '0';
            des_A1 <= '1';
            des_A2 <= '1';      
            des_A3 <= '0';           
            data <= x"6666";
            wait for delay;      
                                    
           --load data into reg7                                    
           des_A0 <= '1';
           des_A1 <= '1';
           des_A2 <= '1';    
           des_A3 <= '0';            
           data <= x"7777";
           wait for delay;      
           
           --load data into reg8                                    
           des_A0 <= '0';
           des_A1 <= '0';
           des_A2 <= '0';    
           des_A3 <= '1';            
           data <= x"8888";
           wait for delay; 
           
--disable write to prevent new data from being loaded
--expected result at register4: x"1111"
                     
           data <=x"ffff";                    
           write <= '0';
           addA <= "0001";
           addB <= "0001";
           des_A0 <= '1';
           des_A1 <= '0';
           des_A2 <= '0';    
           des_A3 <= '0';       
           wait for delay;
                            
--expected result at register 4: x"4444"
           addA <= "0100";    
           addB <= "0100";                                                   
           des_A0 <= '0';
           des_A1 <= '0';
           des_A2 <= '1';   
           des_A3 <= '0';      
           wait for delay;
                                 
--expected result at register 6: x"6666"                 
           addA<="0110";   
           addB<="0110";                                           
           des_A0 <= '0';
           des_A1 <= '1';
           des_A2 <= '1';  
           des_A3 <= '0';                          
           wait for delay;
           
 --expected result at register 8: x"7777"                           
           addA<="1000";   
           addB<="1000";                                           
           des_A0 <= '0';
           des_A1 <= '0';
           des_A2 <= '0';    
           des_A3 <= '1';                        
           wait;
        end process;
     
--clock transition between 1 and 0                
        clock : process
        begin
            Clk <= '0';
            wait for 25ns;
            Clk <= '1';
            wait for 25ns;
        end process;
                                        
end Behavioral;
