----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2018 05:58:04 PM
-- Design Name: 
-- Module Name: Control_Address_Register - Behavioral
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

entity Control_Address_Register is
--  Port ( );
    port (
        CAR_in : in STD_LOGIC_VECTOR(7 downto 0);
        CAR_S, reset : in STD_LOGIC;
        Clk : in std_logic;
        CAR_out : out STD_LOGIC_VECTOR(7 downto 0)
        );
end Control_Address_Register;

architecture Behavioral of Control_Address_Register is

    component reg_4 port (
        D : in std_logic_vector(15 downto 0);
        load : in std_logic;
        Clk : in std_logic;
        Q : out std_logic_vector(15 downto 0));
    end component;
    
    component ripple_carry_adder_16bit port (
        A : in std_logic_vector(15 downto 0);
        B : in std_logic_vector(15 downto 0);
        Cin : in std_logic;
        Cout : out std_logic;
        Vout : out std_logic;
        G : out std_logic_vector(15 downto 0));  
    end component;
        
    signal increment, unused : std_logic_vector (7 downto 0);
    signal current_value,reg_in : std_logic_vector (15 downto 0);
    signal Cout,Vout : std_logic;
    
begin

    CAR_reg : reg_4 port map (
        D => reg_in,
        load => '1',
        Clk => Clk,
        Q => current_value 
        );
        
    CAR_rca : ripple_carry_adder_16bit port map (
        A(7 downto 0)=>current_value(7 downto 0),
        A(15 downto 8)=>x"00",
        B=>x"0001",
        Cin=>'0',
        Cout=>Cout,
        Vout=>Vout,
        G(7 downto 0)=>increment,
        G(15 downto 8)=>unused);   
        
    --reset CAR if reset = '1'
    --increment if CAR_S = '0' && reset = '0'
    --load if CAR_S = '1' && reset = '0'
    reg_in (7 downto 0) <= x"C0" when reset ='1' else CAR_in when CAR_S = '1' else increment;
    reg_in (15 downto 8) <= x"00";
    CAR_out <= current_value(7 downto 0);
end Behavioral;
