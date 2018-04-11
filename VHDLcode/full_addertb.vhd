----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2018 06:49:41 PM
-- Design Name: 
-- Module Name: full_addertb - Behavioral
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

entity full_addertb is
--  Port ( );
end full_addertb;

architecture Behavioral of full_addertb is
    component full_adder 
         Port ( 
           A    : in STD_LOGIC;
           B    : in STD_LOGIC;
           Cin  : in STD_LOGIC;
           G    : out STD_LOGIC;
           Cout : out STD_LOGIC);
         end component;
         
   --inputs 
        signal A : std_logic;
        signal B : std_logic;
        signal Cin : std_logic;
   --outputs
        signal G : std_logic;
        signal Cout : std_logic;
        constant gate_delay: Time := 100ns;
        
begin
    -- Instantiate the Unit Under Test (UUT)
     uut: full_adder PORT MAP (
     A => A,
     B => B,
     Cin => Cin,
     G => G,
     Cout => Cout
     );
     
     stim_proc: process
     begin
        -- hold reset state for 100 ns.
        wait for 100 ns; 
        
        -- insert stimulus here
        --G=0
        --Cout=0
        A <= '0';
        B <= '0';
        Cin <= '0';
        wait for gate_delay;
        --G=1
        --Cout=0
        A <= '1';
        B <= '0';
        Cin <= '0';
        wait for gate_delay;
        --G=1
        --Cout=0
        A <= '0';
        B <= '1';
        Cin <= '0';
        wait for gate_delay;
        --G=0
        --Cout=1
        A <= '1';
        B <= '1';
        Cin <= '0';
        wait for gate_delay;
        --G=1
        --Cout=0
        A <= '0';
        B <= '0';
        Cin <= '1';
        wait for gate_delay;
        --G=0
        --Cout=1
        A <= '1';
        B <= '0';
        Cin <= '1';
        wait for gate_delay;
        --G=0
        --Cout=1
        A <= '0';
        B <= '1';
        Cin <= '1';
        wait for gate_delay;
        --G=1
        --Cout=1
        A <= '1';
        B <= '1';
        Cin <= '1';
        wait;
        
    end process;

end Behavioral;
