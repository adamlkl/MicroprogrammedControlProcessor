----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2018 03:59:26 PM
-- Design Name: 
-- Module Name: PC - Behavioral
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

entity PC is
--  Port ( );
    port (
        PC_extend : in std_logic_vector(15 downto 0);
        PL, PI : in std_logic;
        reset : in std_logic;
        Clk : in std_logic;
        PC_out : out std_logic_vector(15 downto 0)
        );
end PC;

architecture Behavioral of PC is
    component reg_4 port (
        D : in std_logic_vector(15 downto 0);
        load : in std_logic;
        Clk : in std_logic;
        Q : out std_logic_vector(15 downto 0));
    end component;
    
    component ripple_carry_adder_16bit port(
        A : in std_logic_vector(15 downto 0);
        B : in std_logic_vector(15 downto 0);
        Cin : in std_logic;
        Cout : out std_logic;
        Vout : out std_logic;
        G : out std_logic_vector(15 downto 0));
     end component;
     
     signal reg_load : std_logic;
     signal current_value, next_value : std_logic_vector(15 downto 0);
     signal load_val, increment_val : std_logic_vector(15 downto 0);
     signal Cout,Vout : std_logic;
     signal Cout2,Vout2 : std_logic;
     
    begin
    
    PC_reg : reg_4 port map (
        D => next_value,
        load => reg_load,
        Clk => Clk,
        Q => current_value 
        );
        
    PC_load_rca : ripple_carry_adder_16bit port map (
        A=>current_value,
        B=>PC_extend,
        Cin=>'0',
        Cout=>Cout,
        Vout=>Vout,
        G=>load_val);
        
    PC_increment_rca : ripple_carry_adder_16bit port map (
        A=>current_value,
        B=>x"0001",
        Cin=>'0',
        Cout=>Cout2,
        Vout=>Vout2,
        G=>increment_val);
        --resets when reset = '1'
        --increments when PI = '1'
        --load when PL = '1'
        --PL & PI cannot be '1' at the same time 
        next_value<=x"0000" when reset ='1' else increment_val when PI = '1' else load_val when PL ='1';
        PC_out <= current_value;
        reg_load <= PL or PI or reset;

end Behavioral;
