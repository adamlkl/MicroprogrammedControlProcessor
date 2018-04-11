----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 06:00:41 PM
-- Design Name: 
-- Module Name: arithmethic_logic_unit - Behavioral
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

entity arithmethic_logic_unit is
--  Port ( );
    port (
       S : in std_logic_vector (2 downto 0);
       --S0,S1,S2,
       Cin,A,B : in std_logic;
       Cout,G : out std_logic);
       
end arithmethic_logic_unit;

architecture Behavioral of arithmethic_logic_unit is

    component arithmethic_unit 
    port (
        Cin :in std_logic;
        A,B :in std_logic;
        aS0,aS1 :in std_logic;
        Cout :out std_logic;
        G :out std_logic);
    end component;
    
    component logic_unit
    port (
        A,B :in std_logic;
        lgS0,lgS1 :in std_logic;
        G :out std_logic);
    end component;
    
    component mux_2_to_1_1bit
    port (
        In0 : in std_logic;
        In1 : in std_logic;
        s : in std_logic;
        Z : out std_logic);
    end component;
    
    signal ariout,logout : std_logic;
    
begin
    au : arithmethic_unit port map(
        Cin=>Cin,
        A=>A,
        B=>B,
        aS0=>S(0),
        aS1=>S(1),
        Cout=>Cout,
        G=>ariout);
        
    lu : logic_unit port map(
        A=>A,
        B=>B,
        lgS0=>S(0),
        lgS1=>S(1),     
        G=>logout);
    
    mux2to1: mux_2_to_1_1bit port map(
        In0 => ariout,
        In1 => logout,
        s   => S(2),
        Z   => G);
end Behavioral;
