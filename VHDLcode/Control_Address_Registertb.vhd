----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2018 06:03:02 PM
-- Design Name: 
-- Module Name: Control_Address_Registertb - Behavioral
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

entity Control_Address_Registertb is
--  Port ( );
end Control_Address_Registertb;

architecture Behavioral of Control_Address_Registertb is

    component Control_Address_Register port (
        CAR_in : in STD_LOGIC_VECTOR(7 downto 0);
        CAR_S, reset, Clk : in STD_LOGIC;
        CAR_out : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
    
    signal CAR_in, CAR_out : std_logic_vector (7 downto 0);
    signal CAR_S, reset, Clk : std_logic;
    constant delay : time := 50ns;
    
begin
    
    uut: Control_Address_Register port map (
        CAR_in => CAR_in,
        CAR_S => CAR_S,
        reset =>reset,
        Clk => Clk,
        CAR_out => CAR_out
        );
        
    stim : process
        begin 
            --reset 
            reset <= '1';
            wait for delay;
            --start CAR          
            reset <= '0';
            wait for delay;
            
            --load in opcode 
            CAR_in <= "10101010";
            CAR_S <= '1';
            wait for delay;
            
            --load in new opcode
            --should not change current value since CAR_S = '0'
            --increment current value
            CAR_in <= x"BB";
            CAR_S <= '0';
            wait for delay;
            
            --reset values in CAR 
            --expect CAR_OUT = x"C0"
            reset <= '1';
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
