----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 04:47:47 PM
-- Design Name: 
-- Module Name: mux_4_to_1_1bittb - Behavioral
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

entity mux_4_to_1_1bittb is
--  Port ( );
end mux_4_to_1_1bittb;

architecture Behavioral of mux_4_to_1_1bittb is
    COMPONENT mux_4_to_1_1bit
    PORT(
         In0 : IN  std_logic;
         In1 : IN  std_logic;
         In2 : IN  std_logic;
         In3 : IN  std_logic;
         S0 : IN  std_logic;
         S1 : IN  std_logic;
         Z : OUT  std_logic
        );
    END COMPONENT;
 
   --Inputs
   signal In0 : std_logic;
   signal In1 : std_logic;
   signal In2 : std_logic;
   signal In3 : std_logic;
   signal S0 : std_logic;
   signal S1 : std_logic;
 
    --Outputs
   signal Z : std_logic;
 
begin
     -- Instantiate the Unit Under Test (UUT)
  uut: mux_4_to_1_1bit PORT MAP (
         In0 => In0,
         In1 => In1,
         In2 => In2,
         In3 => In3,
         S0 => S0,
         S1 => S1,
         Z => Z
       );

  -- Stimulus process
  stim_proc: process
  begin
     -- hold reset state for 100 ns.
     wait for 100 ns;  

   In0 <= '1';
   In1 <= '0';
   In2 <= '1';
   In3 <= '0';        

    --select input0
   S0 <= '0'; S1 <= '0';

     wait for 100 ns;  

    --select input1
   S0 <= '1'; S1 <= '0';

     wait for 100 ns;  

    --select input2
   S0 <= '0'; S1 <= '1';

       wait for 100 ns;    

    --select input3
   S0 <= '1'; S1 <= '1';   

   end process;

end Behavioral;
