----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2018 02:47:07 PM
-- Design Name: 
-- Module Name: ripple_carry_adder_16bittb - Behavioral
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

entity ripple_carry_adder_16bittb is
--  Port ( );
end ripple_carry_adder_16bittb;

architecture Behavioral of ripple_carry_adder_16bittb is
    component ripple_carry_adder_16bit port (
        A : in std_logic_vector(15 downto 0);
        B : in std_logic_vector(15 downto 0);
        Cin : in std_logic;
        Cout : out std_logic;
        Vout : out std_logic;
        G : out std_logic_vector(15 downto 0));
     end component;
     
     --input 
     signal A,B : std_logic_vector (15 downto 0);
     signal Cin : std_logic;
     
     --output 
     signal G : std_logic_vector (15 downto 0);
     signal Cout,Vout : std_logic;
     
     constant delay : time:= 50ns;
     
begin
    uut: ripple_carry_adder_16bit port map(
        A=>A,
        B=>B,
        Cin=>Cin,
        Cout=>Cout,
        Vout=>Vout,
        G=>G);
        
    stim : process 
        begin 
            
            -- 0 + 0 = 0
            A <= x"0000";
            B <= x"0000";
            Cin <= '0';
            wait for delay;

            -- 3 + 3 = 0
            A <= x"0003";
            B <= x"0003";
            Cin <= '0';
            wait for delay;
            
            -- 0 + 0 + 1 = 1
            A <= x"0000";
            B <= x"0000";
            Cin <= '1';
            wait for delay;
                        
            -- 32768 + 32768 = 0001
            --Cout = 1
            --Vout = 1
            A <= x"8001";
            B <= x"8000";
            Cin <= '0';
            wait for delay;
                       
            -- 65535 + 65535 = 0 
            --Cout = 1
            A <= x"FFFF";
            B <= x"FFFF";
            Cin <= '0';
            wait;
        end process;
end Behavioral;
