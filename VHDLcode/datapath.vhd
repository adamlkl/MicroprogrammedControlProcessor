----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2018 09:39:21 PM
-- Design Name: 
-- Module Name: datapath - Behavioral
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

entity datapath is
--  Port ( );

    --    control word structure 
    --    control_word(16 downto 14) => DA,
    --    control_word(13 downto 11) => AA,
    --    control_word(10 downto => BA,
    --    control_word(7) => MB,
    --    control_word(6 downto 2) => FS,   
    --    control_word(1) => MD,
    --    control_word(0) => RW,
     
    port (
        dataIn,PC : in std_logic_vector (15 downto 0);
        zeroFill_in : in std_logic_vector (2 downto 0);
        control_word : in std_logic_vector ( 16 downto 0);
        TA,TB,TD,MM : in std_logic;
        Clk : in std_logic;
        V,C,N,Z : out std_logic;
        addOut,dataOut: out std_logic_vector (15 downto 0);
        --test outputs
        reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8 : out std_logic_vector(15 downto 0));
         
end datapath;

architecture Behavioral of datapath is
    
    component mux_2_to_1 
        port ( 
           In0 : in std_logic_vector(15 downto 0);
           In1 : in std_logic_vector(15 downto 0);
           s : in std_logic;
           Z : out std_logic_vector(15 downto 0)); 
       end component;
       
    component function_unit 
        port (
            A,B     : in std_logic_vector(15 downto 0);
            mfS : in std_logic_vector (4 downto 0);
            F   : out std_logic_vector (15 downto 0);
            V,C,N,Z : out std_logic);
        end component;
        
    component register_file 
        port (
            des_A0: in std_logic;
            des_A1: in std_logic;
            des_A2: in std_logic;
            des_A3: in std_logic;
            write: in std_logic;
            addB, addA : in std_logic_vector (3 downto 0);
            Clk : in std_logic;
            data : in std_logic_vector(15 downto 0);
            reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8 : out std_logic_vector(15 downto 0);
            A,B : out std_logic_vector (15 downto 0));
       end component;
       
    component zero_fill 
        port (
            zero_fill_in : in std_logic_vector(2 downto 0);
            zero_fill_out : out std_logic_vector (15 downto 0));
        end component;
        
       signal A,B,Fout,data_src_muxB_out,data_src_muxD_out,data_src_muxM_out,constIn : std_logic_vector (15 downto 0);
       signal q_reg0,q_reg1,q_reg2,q_reg3,q_reg4,q_reg5,q_reg6,q_reg7,q_reg8 : std_logic_vector (15 downto 0);

begin
    
    rf : register_file port map (
        data=>data_src_muxD_out,
        des_A0=>control_word(14),
        des_A1=>control_word(15),
        des_A2=>control_word(16),
        des_A3=>TD,        
        addB(0)=>control_word(8),
        addB(1)=>control_word(9),
        addB(2)=>control_word(10),
        addB(3)=>TB,
        addA(0)=>control_word(11),
        addA(1)=>control_word(12),
        addA(2)=>control_word(13),
        addA(3)=>TA,
        write=>control_word(0),
        Clk=>Clk,
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
        
    fu : function_unit port map (
         A => A,
         B => data_src_muxB_out,
         mfS(0)=>control_word(2),
         mfS(1)=>control_word(3),
         mfS(2)=>control_word(4),
         mfS(3)=>control_word(5),
         mfS(4)=>control_word(6),
         F=>Fout,
         V=>V,
         C=>C,
         N=>N,
         Z=>Z); 
         
    Const_Zero_Fill : zero_fill port map (     
        zero_fill_in => zeroFill_in,
        zero_fill_out => constIn);
        
    muxB : mux_2_to_1 port map (
        In0 => B,
        In1 => constIn,
        S => control_word(7),
        Z => data_src_muxB_out);
        
    muxD : mux_2_to_1 port map (
        In0=>Fout,
        In1=>dataIn,
        S=>control_word(1),
        Z=>data_src_muxD_out);
        
    muxM : mux_2_to_1 port map (
        In0=>A,
        In1=>PC,
        S=>MM,
        Z=>data_src_muxM_out);
        
    addOut<=data_src_muxM_out;
    dataOut<=data_src_muxB_out;
        
    end Behavioral;