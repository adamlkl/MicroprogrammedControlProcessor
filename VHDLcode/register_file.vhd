----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2018 06:16:15 PM
-- Design Name: 
-- Module Name: register_file - Behavioral
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

entity register_file is
--  Port ( );
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
        
                 
end register_file;

architecture Behavioral of register_file is
    component reg_4
    port(
       D : in std_logic_vector(15 downto 0);
       load : in std_logic;
       Clk : in std_logic;
       Q : out std_logic_vector(15 downto 0));
   end component;
   
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
   
   component mux_9_to_1_16bit
       port ( 
       In0 : in std_logic_vector(15 downto 0);
       In1 : in std_logic_vector(15 downto 0);
       In2 : in std_logic_vector(15 downto 0);
       In3 : in std_logic_vector(15 downto 0);
       In4 : in std_logic_vector(15 downto 0);
       In5 : in std_logic_vector(15 downto 0);
       In6 : in std_logic_vector(15 downto 0);
       In7 : in std_logic_vector(15 downto 0);
       In8 : in std_logic_vector(15 downto 0);
       S : in std_logic_vector (3 downto 0);
       Z : out std_logic_vector(15 downto 0)
       );
       end component; 
   
   signal load_reg0,load_reg1,load_reg2,load_reg3,load_reg4,load_reg5,load_reg6,load_reg7,load_reg8 : std_logic;
   signal q_reg0,q_reg1,q_reg2,q_reg3,q_reg4,q_reg5,q_reg6,q_reg7,q_reg8 : std_logic_vector (15 downto 0);
   signal load_reg00,load_reg01,load_reg02,load_reg03,load_reg04,load_reg05,load_reg06,load_reg07,load_reg08 : std_logic;
    
begin
    
    load_reg00<=load_reg0 and write after 1ns;
    load_reg01<=load_reg1 and write after 1ns;
    load_reg02<=load_reg2 and write after 1ns;
    load_reg03<=load_reg3 and write after 1ns;
    load_reg04<=load_reg4 and write after 1ns;
    load_reg05<=load_reg5 and write after 1ns;
    load_reg06<=load_reg6 and write after 1ns;
    load_reg07<=load_reg7 and write after 1ns;
    load_reg08<=load_reg8 and write after 1ns;
    
    reg0<=q_reg0;
    reg1<=q_reg1;
    reg2<=q_reg2;
    reg3<=q_reg3;
    reg4<=q_reg4;
    reg5<=q_reg5;
    reg6<=q_reg6;
    reg7<=q_reg7;
    reg8<=q_reg8;
    
        
    reg00:reg_4 PORT MAP(
        D => data,
        load => load_reg00,
        Clk => Clk,
        Q => q_reg0);
        
    reg01:reg_4 PORT MAP(
        D => data,
        load => load_reg01,
        Clk => Clk,
        Q => q_reg1);
          
    reg02:reg_4 PORT MAP(
        D => data,
        load => load_reg02,
        Clk => Clk,
        Q => q_reg2);
                        
    reg03:reg_4 PORT MAP(
        D => data,
        load => load_reg03,
        Clk => Clk,
        Q => q_reg3);   
        
    reg04:reg_4 PORT MAP(
        D => data,
        load => load_reg04,
        Clk => Clk,
        Q => q_reg4);  
                
    reg05:reg_4 PORT MAP(
        D => data,
        load => load_reg05,
        Clk => Clk,
        Q => q_reg5);  
                        
    reg06:reg_4 PORT MAP(
        D => data,
        load => load_reg06,
        Clk => Clk,
        Q => q_reg6);  
                                
    reg07:reg_4 PORT MAP(
        D => data,
        load => load_reg07,
        Clk => Clk,
        Q => q_reg7);  
        
    reg08:reg_4 PORT MAP(
        D => data,
        load => load_reg08,
        Clk => Clk,
        Q => q_reg8);                                                                                             
             
    des_decoder_3to8:decoder_3_to_8 PORT MAP(
        A(0) => des_A0,
        A(1) => des_A1,
        A(2) => des_A2,
        A(3) => des_A3,
        Q0 => load_reg0,
        Q1 => load_reg1,
        Q2 => load_reg2,
        Q3 => load_reg3,
        Q4 => load_reg4,
        Q5 => load_reg5,
        Q6 => load_reg6,
        Q7 => load_reg7,
        Q8 => load_reg8    
    );
    
    data_src_mux_9to1A:mux_9_to_1_16bit PORT MAP(
        In0 => q_reg0,
        In1 => q_reg1,
        In2 => q_reg2,
        In3 => q_reg3,
        In4 => q_reg4,
        In5 => q_reg5,
        In6 => q_reg6,
        In7 => q_reg7,
        In8 => q_reg8,
        S => addA,   
        Z => A);
        
    data_src_mux_8to1B:mux_9_to_1_16bit PORT MAP(
        In0 => q_reg0,
        In1 => q_reg1,
        In2 => q_reg2,
        In3 => q_reg3,
        In4 => q_reg4,
        In5 => q_reg5,
        In6 => q_reg6,
        In7 => q_reg7,
        In8 => q_reg8,
        S => addB,   
        Z => B);
               
end Behavioral;
