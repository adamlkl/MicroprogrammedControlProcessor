----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2018 09:44:30 AM
-- Design Name: 
-- Module Name: memorytb - Behavioral
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

entity memorytb is
--  Port ( );
end memorytb;

architecture Behavioral of memorytb is
    component memory port (
        address : in std_logic_vector(15 downto 0);
        write_data : in std_logic_vector(15 downto 0);
        MemWrite,Clk : in std_logic;
        read_data : out std_logic_vector(15 downto 0)
    );
    end component;
    
    signal DataIn, DataOut : std_logic_vector(15 downto 0);
    signal MW,Clk : std_logic;
    signal address : std_logic_vector(15 downto 0);
    constant delay: Time := 50ns;
    
begin
    uut : memory port map (
        address=>address,
        write_data=>DataIn,
        MemWrite=>MW,
        Clk=>Clk,
        read_data=>DataOut);
        
    stim : process 
        begin
            --write new memory 
            MW <= '1';
            address <= x"00FF";
            DataIn <= x"FAFA";
            wait for delay;
            address <= x"00A1";
            DataIn <= x"FDDD";
            wait for delay;
            --disable writing memory 
            --read memory instead
            MW <='0';
            address <= x"0001";
            wait for delay;
            address <= x"00FF";
            wait for delay;
            address <= x"00A1";
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
