----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2018 01:04:54 AM
-- Design Name: 
-- Module Name: Microprogrammed_Controltb - Behavioral
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

entity Microprogrammed_Controltb is
--  Port ( );
end Microprogrammed_Controltb;

architecture Behavioral of Microprogrammed_Controltb is
    component Microprogrammed_Control port (
        IR : in std_logic_vector (15 downto 0);
        Clk,reset : in std_logic;
        V,C,N,Z : in std_logic;
        PC_Out : out std_logic_vector (15 downto 0);
        DR,SA,SB : out std_logic_vector (2 downto 0);
        TD,TA,TB : out std_logic;
        RW,MB,MD,MM,MW : out std_logic;
        test_pi,test_pl : out std_logic;
        FS : out std_logic_vector (4 downto 0));
    end component;
    
    --input 
    signal IR : std_logic_vector(15 downto 0);
    signal Clk,reset,V,C,N,Z : std_logic;
    
    --output 
    signal PC_Out : std_logic_vector(15 downto 0);
    signal DR,SA,SB : std_logic_vector(2 downto 0);
    signal TD,TA,TB,RW,MB,MD,MM,MW : std_logic;
    signal FS : std_logic_vector(4 downto 0);
    signal PL_out,PI_out : std_logic;
    constant delay : time:=90ns;
    
begin
    uut : Microprogrammed_Control port map (
        IR => IR,
        Clk => Clk,
        reset => reset,
        V=>V,
        C=>C,
        N=>N,
        Z=>Z, 
        PC_Out => PC_Out,
        DR=>DR,
        SA=>SA,
        SB=>SB, 
        TD=>TD,
        TA=>TA,
        TB=>TB, 
        RW=>RW,
        MB=>MB,
        MD=>MD,
        MM=>MM,
        MW=>MW,
        test_pl=>PL_out,
        test_pi=>PI_out,
        FS=>FS);
        
    stim : process 
        begin 
            reset <='1';
            wait for delay;
            --do instruction 0:0xC020224
            --SB,SA,DR = "000"
            IR<=x"0000";
            reset <='0';
            V<='0';
            C<='0';
            N<='0';
            Z<='0';
            wait for delay;
            --do instruction 1:0xC02000C
            --SB,SA,DR = x"000"
            IR<=x"0200";
            wait for delay;
            --do instruction 2:0xC020001
            --SA,DR = "000"
            --SB = "001"
            IR<=x"0401";
            wait for delay;
            --do instruction 3:0xC020014
            --SA,DR = "000"
            --SB = "011"
            IR<=x"0603";
            wait for delay;
            --do instruction 4:0xC0200E4
            --SA,DR = "000"
            --SB = "110"
            IR<=x"0806";
            wait for delay;
            --reset 
            reset<='1';
            wait for delay;
            reset<='0';
            wait;
        end process;
            
    clock : process
        begin
           Clk <= '0';
           wait for 15ns;
           Clk <= '1';
           wait for 15ns;
        end process;
        

end Behavioral;
