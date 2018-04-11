----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2018 10:25:30 PM
-- Design Name: 
-- Module Name: Instruction_Formattb - Behavioral
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

entity Instruction_Formattb is
--  Port ( );
end Instruction_Formattb;

architecture Behavioral of Instruction_Formattb is
    component Instruction_Format port (
        IR : in std_logic_vector(15 downto 0);
        IL : in std_logic;
        Clk : in std_logic;
        DR : out std_logic_vector(2 downto 0);
        SA : out std_logic_vector(2 downto 0);
        SB : out std_logic_vector(2 downto 0);
        Opcode : out std_logic_vector(6 downto 0)); 
    end component;
    
    signal IR : std_logic_vector (15 downto 0);
    signal IL, Clk : std_logic;
    signal DR,SA,SB : std_logic_vector (2 downto 0);
    signal Opcode : std_logic_vector(6 downto 0);
    
    constant delay : Time := 50ns;
    
begin
    uut : Instruction_Format port map (
        IR => IR,
        IL => IL,
        Clk => Clk,
        DR => DR,
        SA => SA,
        SB => SB,
        Opcode => Opcode);
        
    stim : process
        begin 
            --cannot load instruction 
            IR <= x"ABCD";
            IL <= '0';
            wait for delay;
            
            --load instruction
            IL <='1';
            wait;
        end process;
    
    clock : process
        begin
            Clk <= '0';
            wait for 25ns;
            Clk <= '1';
            wait for 25ns;
        end process;
end Behavioral;
