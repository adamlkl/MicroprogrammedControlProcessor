----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2018 04:48:55 PM
-- Design Name: 
-- Module Name: Arithmethic_Logic_Unit_x16 - Behavioral
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

entity Arithmethic_Logic_Unit_x16 is
--  Port ( );
     Port ( 
        A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        Cin : in STD_LOGIC;
        S : in std_logic_vector (2 downto 0);
        G : out STD_LOGIC_VECTOR (15 downto 0);
        Cout : out STD_LOGIC);  
    
end Arithmethic_Logic_Unit_x16;

architecture Behavioral of Arithmethic_Logic_Unit_x16 is
    
    component arithmethic_logic_unit
    port (
        S : in std_logic_vector (2 downto 0);
        Cin,A,B : in std_logic;
        Cout,G : out std_logic);
    end component;
    
    -- Intermediate Carry declaration
    signal c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15: STD_LOGIC;
    
begin
    
    alu00: arithmethic_logic_unit port map(
        A=>A(0),
        B=>B(0),
        S=>S,
        Cin=>Cin,
        Cout=>c1,
        G=>G(0));   
             
    alu01: arithmethic_logic_unit port map(
        A=>A(1),
        B=>B(1),
        S=>S,
        Cin=>c1,
        Cout=>c2,
        G=>G(1));
        
    alu02: arithmethic_logic_unit port map(
        A=>A(2),
        B=>B(2),
        S=>S,
        Cin=>c2,
        Cout=>c3,
        G=>G(2));
        
    alu03: arithmethic_logic_unit port map(
        A=>A(3),
        B=>B(3),
        S=>S,
        Cin=>c3,
        Cout=>c4,
        G=>G(3));
        
    alu04: arithmethic_logic_unit port map(
        A=>A(4),
        B=>B(4),
        S=>S,
        Cin=>c4,
        Cout=>c5,
        G=>G(4));
        
    alu05: arithmethic_logic_unit port map(
        A=>A(5),
        B=>B(5),
        S=>S,
        Cin=>c5,
        Cout=>c6,
        G=>G(5));
        
    alu06: arithmethic_logic_unit port map(
        A=>A(6),
        B=>B(6),
        S=>S,
        Cin=>c6,
        Cout=>c7,
        G=>G(6));
        
    alu07: arithmethic_logic_unit port map(
        A=>A(7),
        B=>B(7),
        S=>S,
        Cin=>c7,
        Cout=>c8,
        G=>G(7));
        
    alu08: arithmethic_logic_unit port map(
        A=>A(8),
        B=>B(8),
        S=>S,
        Cin=>C8,
        Cout=>c9,
        G=>G(8));
        
    alu09: arithmethic_logic_unit port map(
        A=>A(9),
        B=>B(9),
        S=>S,
        Cin=>c9,
        Cout=>c10,
        G=>G(9));
        
    alu10: arithmethic_logic_unit port map(
        A=>A(10),
        B=>B(10),
        S=>S,
        Cin=>c10,
        Cout=>c11,
        G=>G(10));
        
    alu11: arithmethic_logic_unit port map(
        A=>A(11),
        B=>B(11),
        S=>S,
        Cin=>c11,
        Cout=>c12,
        G=>G(11));
        
    alu12: arithmethic_logic_unit port map(
        A=>A(12),
        B=>B(12),
        S=>S,
        Cin=>c12,
        Cout=>c13,
        G=>G(12));
        
    alu13: arithmethic_logic_unit port map(
        A=>A(13),
        B=>B(13),
        S=>S,
        Cin=>c13,
        Cout=>c14,
        G=>G(13));
        
    alu14: arithmethic_logic_unit port map(
        A=>A(14),
        B=>B(14),
        S=>S,
        Cin=>c14,
        Cout=>c15,
        G=>G(14));
        
    alu15: arithmethic_logic_unit port map(
        A=>A(15),
        B=>B(15),
        S=>S,
        Cin=>c15,
        Cout=>Cout,
        G=>G(15));
        
end Behavioral;
