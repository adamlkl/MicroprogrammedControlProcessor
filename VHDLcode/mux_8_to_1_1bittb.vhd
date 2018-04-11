----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 03:03:21 PM
-- Design Name: 
-- Module Name: mux_8_to_1_1bittb - Behavioral
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

entity mux_8_to_1_1bittb is
--  Port ( );
end mux_8_to_1_1bittb;

architecture Behavioral of mux_8_to_1_1bittb is
    component mux_8_to_1_1bit
        port ( 
            In0 : in std_logic;
            In1 : in std_logic;
            In2 : in std_logic;
            In3 : in std_logic;
            In4 : in std_logic;
            In5 : in std_logic;
            In6 : in std_logic;
            In7 : in std_logic;
            S : in std_logic_vector(2 downto 0);
            Z : out std_logic);
        end component;
        
        signal input : std_logic_vector(7 downto 0);
        signal S : std_logic_vector(2 downto 0);
        signal Z : std_logic;
        
begin
    uut: mux_8_to_1_1bit port map(
        In0=>input(0),
        In1=>input(1),
        In2=>input(2),
        In3=>input(3),
        In4=>input(4),
        In5=>input(5),
        In6=>input(6),
        In7=>input(7),
        S => S,
        Z => Z);
        
        stim : process 
            begin 
                input<="10101010";
                wait for 50ns;
                --enable <= "000";
                --selects bit 0
                S<="000";
                wait for 50ns;
                --enable <= "001";
                --selects bit 1
                S<="001";
                wait for 50ns;
                --enable <= "010";
                --selects bit 2
                S<="010";
                wait for 50ns;
                --enable <= "011";
                --selects bit 3
                S<="011";
                wait for 50ns;
                --enable <= "100";
                --selects bit 4
                S<="100";
                wait for 50ns;
                --enable <= "101";
                --selects bit 5
                S<="101";
                wait for 50ns;
                --enable <= "110";
                --selects bit 6
                S<="110";
                wait for 50ns;
                --enable <= "111";
                --selects bit 7
                S<="111";
                wait;
            end process;
        
end Behavioral;
