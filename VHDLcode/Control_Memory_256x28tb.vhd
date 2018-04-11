----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2018 08:07:44 PM
-- Design Name: 
-- Module Name: Control_Memory_512x28tb - Behavioral
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

entity Control_Memory_256x28tb is
--  Port ( );
end Control_Memory_256x28tb;

architecture Behavioral of Control_Memory_256x28tb is

    component Control_Memory_256x28 port(
        IN_CAR : in std_logic_vector(7 downto 0);
        MW : out std_logic;
        MM : out std_logic;
        RW : out std_logic;
        MD : out std_logic;
        FS : out std_logic_vector(4 downto 0);
        MB : out std_logic;
        TB : out std_logic;
        TA : out std_logic;
        TD : out std_logic;
        PL : out std_logic;
        PI : out std_logic;
        IL : out std_logic;
        MC : out std_logic;
        MS : out std_logic_vector(2 downto 0);
        NA : out std_logic_vector(7 downto 0));     
    end component;
    
    signal IN_CAR, NA : std_logic_vector(7 downto 0);
    signal MW,MM,RW,MD,MB,TB,TA,TD,PL,PI,IL,MC : std_logic;
    signal FS: std_logic_vector (4 downto 0);
    signal MS : std_logic_vector (2 downto 0);
    constant delay: Time := 50ns;
    
begin

    uut : Control_Memory_256x28 port map (
        IN_CAR => IN_CAR,
        MW => MW,
        MM => MM,
        RW => RW,
        MD => MD,
        FS => FS,
        MB => MB,
        TB => TB,
        TA => TA,
        TD => TD,
        PL => PL,
        PI => PI,
        IL => IL,
        MC => MC,
        MS => MS,
        NA => NA);  
     
     stim:process
        begin 
            --fetch 1st memory 
            --output: C020224
            wait for delay;
            IN_CAR <= "00000001";
            wait for delay;
            --fetch 2nd memory 
            --output:C02000C
            IN_CAR <= "00000010";
            wait;
        end process;
end Behavioral;
