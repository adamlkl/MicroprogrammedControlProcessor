----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2018 05:44:57 PM
-- Design Name: 
-- Module Name: Arithmethic_Logic_Unit_x16tb - Behavioral
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

entity Arithmethic_Logic_Unit_x16tb is
--  Port ( );
end Arithmethic_Logic_Unit_x16tb;

architecture Behavioral of Arithmethic_Logic_Unit_x16tb is
    component Arithmethic_Logic_Unit_x16
    port (
        A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        Cin : in STD_LOGIC;
        S : in std_logic_vector (2 downto 0);
        G : out STD_LOGIC_VECTOR (15 downto 0);
        Cout : out STD_LOGIC);    
    end component;
    
    signal A,B,G : std_logic_vector (15 downto 0);
    signal S : std_logic_vector (2 downto 0);
    signal Cin,Cout : std_logic;
    
begin
    
    uut: Arithmethic_Logic_Unit_x16 port map(
        A=>A,
        B=>B,
        Cin=>Cin,
        S=>S,
        G=>G,
        Cout=>Cout);
        
    stim : process 
        begin
            A <= x"0001";
            B <= x"0003";
            
            
            S<="000";  
            --A    
            Cin <= '0';
            wait for 50 ns;
            --A+1
            Cin <= '1';
            wait for 50 ns;
            
            S<="001";
            --A+B
            Cin <= '0';
            wait for 50 ns;
            --A+B+1
            Cin <= '1';
            wait for 50 ns;
            
            S<="010";
            --A + NOT B
            Cin <= '0';
            wait for 50 ns;
            --A + NOT B + 1
            Cin <= '1';
            wait for 50 ns;
            
            S<="011";
            --A - 1
            Cin <= '0';
            wait for 50 ns;
            --A
            Cin <= '1';
            wait for 50 ns;
            
            S<="100";
            --A AND B
            Cin <= '0';
            wait for 50 ns;
            --A AND B
            Cin <= '1';
            wait for 50 ns;
            
            S<="101";
            --A OR B
            Cin <= '0';
            wait for 50 ns;
            --A OR B
            Cin <= '1';
            wait for 50 ns;
            
            S<="110";
            --A XOR B
            Cin <= '0';
            wait for 50 ns;
            --A XOR B
            Cin <= '1';
            wait for 50 ns;
            
            S<="111";
            --NOT A 
            Cin <= '0';
            wait for 50 ns;
            --NOT A 
            Cin <= '1';
            wait;
            
        end process;
   
end Behavioral;
