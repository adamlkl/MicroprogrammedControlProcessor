----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2018 06:11:15 PM
-- Design Name: 
-- Module Name: function_unit - Behavioral
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

entity function_unit is
--  Port ( );
     port (
        A,B     : in std_logic_vector(15 downto 0);
        mfS : in std_logic_vector (4 downto 0);
        F   : out std_logic_vector (15 downto 0);
        V,C,N,Z : out std_logic);
          
end function_unit;

architecture Behavioral of function_unit is

    component mux_2_to_1 
    port (
        In0 : in std_logic_vector(15 downto 0);
        In1 : in std_logic_vector(15 downto 0);
        s : in std_logic;
        Z : out std_logic_vector(15 downto 0));
    end component;
    
     component shifter 
     port (
        b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15 : in std_logic;
        il,ir : in std_logic;
        h : out std_logic_vector(15 downto 0);
        S : in std_logic_vector ( 1 downto 0));
     end component;
     
     component Arithmethic_Logic_Unit_x16
     port (
        A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        Cin : in STD_LOGIC;
        S : std_logic_vector ( 2 downto 0);
--        s0: in STD_LOGIC;
--        s1: in STD_LOGIC;
--        s2: in std_logic;
        G : out STD_LOGIC_VECTOR (15 downto 0);
        Cout : out STD_LOGIC);
        end component;
        
        signal G,H : std_logic_vector (15 downto 0);
        
begin
        ALUx16: Arithmethic_Logic_Unit_x16 port map(
            A=>A,
            B=>B,
            Cin=>mfS(0),
            S(0)=>mfS(1),
            S(1)=>mfS(2),
            S(2)=>mfS(3),         
            G=>G,
            Cout=>C );
        
        shift : shifter port map (
            b0=>B(0),
            b1=>B(1),
            b2=>B(2),
            b3=>B(3),
            b4=>B(4),
            b5=>B(5),
            b6=>B(6),
            b7=>B(7),
            b8=>B(8),
            b9=>B(9),
            b10=>B(10),
            b11=>B(11),
            b12=>B(12),
            b13=>B(13),
            b14=>B(14),
            b15=>B(15),
            ir=>'0',
            il=>'0',
            S(0)=>mfS(2),
            S(1)=>mfS(3),   
            h => H);
        
        mux : mux_2_to_1 port map (
            In0=>G,
            In1=>H,
            s=>mfS(4),
            Z=>F);
        
        Z<='1' after 1 ns when G = "0" else 
           '0' after 1 ns;
        N<='1' after 1 ns when G(15)='1' else 
           '0' after 1 ns;
        V<='0' after 1 ns when (G(15)=A(15) and G(15)=B(15)) else
           '1' after 1 ns;
end Behavioral;
