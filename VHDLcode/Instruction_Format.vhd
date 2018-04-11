----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2018 10:21:44 AM
-- Design Name: 
-- Module Name: Instruction_Format - Behavioral
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

entity Instruction_Format is
--  Port ( );
    port (
        IR : in std_logic_vector(15 downto 0);
        IL : in std_logic;
        Clk : in std_logic;
        DR : out std_logic_vector(2 downto 0);
        SA : out std_logic_vector(2 downto 0);
        SB : out std_logic_vector(2 downto 0);
        Opcode : out std_logic_vector(6 downto 0));        
end Instruction_Format;

architecture Behavioral of Instruction_Format is

    component reg_4 port (
        D : in std_logic_vector(15 downto 0);
        load : in std_logic;
        Clk : in std_logic;
        Q : out std_logic_vector(15 downto 0));
    end component;
    
    signal Q : std_logic_vector(15 downto 0);
begin

    instruction_register : reg_4 port map (
        D => IR,
        load=>IL,
        Clk=>Clk,
        Q => Q);
        
       SB <= Q(2 downto 0);
       SA <= Q(5 downto 3);
       DR <= Q(8 downto 6);
       Opcode <= Q (15 downto 9);
       
end Behavioral;
