----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2018 04:20:50 PM
-- Design Name: 
-- Module Name: PCtb - Behavioral
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

entity PCtb is
--  Port ( );
end PCtb;

architecture Behavioral of PCtb is
    component PC port (
        PC_extend : in std_logic_vector(15 downto 0);
        reset : in std_logic;
        PL, PI : in std_logic;
        Clk : in std_logic;
        PC_out : out std_logic_vector(15 downto 0)
        );
    end component;
    
    signal PC_extend, PC_out : std_logic_vector (15 downto 0);
    signal PL,PI,Clk,reset : std_logic;
    
    constant delay: Time := 50ns;
    
begin
        uut : PC port map (
            PC_extend => PC_extend,
            PL=>PL,
            PI=>PI,
            reset=>reset,
            Clk=>Clk,
            PC_out=>PC_out);
            
        stim : process 
            begin 
                --reset PC 
                --PC_out should be 0 
                reset <= '1';
                PC_extend <= x"FFFE";
                PL <= '0';
                PI <= '0';
                wait for delay;
            
                --change reset to '0'
                --still dont do anything since PI & PL are both '0' s
                --PC_out should be 0 
                reset<='0';
                wait for delay;
                   
                --increments
                --PC_out should be 1
                PL <= '0';
                PI <= '1';                
                wait for delay;
                                
                --loads
                --PC_out should be x"fffe"
                PC_extend <= x"FFFE";
                PL <= '1';
                PI <= '0';
                wait for delay;
                
                --resets again 
                reset<='1';
                PL <= '0';
                PI <= '0';
                wait;
end process;
--clock transition between 1 and 0                
        clock : process
        begin
            Clk <= '0';
            wait for 25ns;
            Clk <= '1';
            wait for 25ns;
        end process;
end Behavioral;
