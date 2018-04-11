----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 09:52:34 PM
-- Design Name: 
-- Module Name: shifter - Behavioral
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

entity shifter is
--  Port ( );
    port (
        b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15 : in std_logic;
        il,ir : in std_logic;
        --h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,h15 : out std_logic;
        h : out std_logic_vector (15 downto 0);
        S : in std_logic_vector ( 1 downto 0));
        
end shifter;

architecture Behavioral of shifter is

    component mux_3_to_1_1bit
        port(   
            In0, In1, In2 : in std_logic;    
            S0, S1 : in std_logic;
            Z : out std_logic);  
        end component; 
        
    begin 
        
        mux00 :  mux_3_to_1_1bit port map (
            In0=>b0,
            In1=>b1,
            In2=>il,
            S0=>S(0),
            S1=>S(1),
            Z=>h(0));
            
        mux01 :  mux_3_to_1_1bit port map (
            In0=>b1,
            In1=>b2,
            In2=>b0,
            S0=>S(0),
            S1=>S(1),
            Z=>h(1));
            
        mux02 :  mux_3_to_1_1bit port map (
            In0=>b2,
            In1=>b3,
            In2=>b1,
            S0=>S(0),
            S1=>S(1),
            Z=>h(2));
            
        mux03 :  mux_3_to_1_1bit port map (
            In0=>b3,
            In1=>b4,
            In2=>b2,
            S0=>S(0),
            S1=>S(1),
            Z=>h(3));
            
        mux04 :  mux_3_to_1_1bit port map (
            In0=>b4,
            In1=>b5,
            In2=>b3,
            S0=>S(0),
            S1=>S(1),
            Z=>h(4));
            
        mux05 :  mux_3_to_1_1bit port map (
            In0=>b5,
            In1=>b6,
            In2=>b4,
            S0=>S(0),
            S1=>S(1),
            Z=>h(5));
            
        mux06 :  mux_3_to_1_1bit port map (
            In0=>b6,
            In1=>b7,
            In2=>b5,
            S0=>S(0),
            S1=>S(1),
            Z=>h(6));
            
        mux07 :  mux_3_to_1_1bit port map (
            In0=>b7,
            In1=>b8,
            In2=>b6,
            S0=>S(0),
            S1=>S(1),
            Z=>h(7));
            
        mux08 :  mux_3_to_1_1bit port map (
            In0=>b8,
            In1=>b9,
            In2=>b7,
            S0=>S(0),
            S1=>S(1),
            Z=>h(8));
            
        mux09 :  mux_3_to_1_1bit port map (
            In0=>b9,
            In1=>b10,
            In2=>b8,
            S0=>S(0),
            S1=>S(1),
            Z=>h(9));
            
        mux10 :  mux_3_to_1_1bit port map (
            In0=>b10,
            In1=>b11,
            In2=>b9,
            S0=>S(0),
            S1=>S(1),
            Z=>h(10));
            
        mux11 :  mux_3_to_1_1bit port map (
            In0=>b11,
            In1=>b12,
            In2=>b10,
            S0=>S(0),
            S1=>S(1),
            Z=>h(11));
            
        mux12 :  mux_3_to_1_1bit port map (
            In0=>b12,
            In1=>b13,
            In2=>b11,
            S0=>S(0),
            S1=>S(1),
            Z=>h(12));
            
        mux13 :  mux_3_to_1_1bit port map ( 
            In0=>b13,
            In1=>b14,
            In2=>b12,
            S0=>S(0),
            S1=>S(1),
            Z=>h(13));
            
        mux14 :  mux_3_to_1_1bit port map (
            In0=>b14,
            In1=>b15,
            In2=>b13,
            S0=>S(0),
            S1=>S(1),
            Z=>h(14));
            
        mux15 :  mux_3_to_1_1bit port map (
            In0=>b15,
            In1=>ir,
            In2=>b14,
            S0=>S(0),
            S1=>S(1),
            Z=>h(15));
                                
end Behavioral;
