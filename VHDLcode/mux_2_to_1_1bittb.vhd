----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Leong Kai Ler 
-- 
-- Create Date: 02/15/2018 06:16:03 PM
-- Design Name: multiplexer 2 to 1
-- Module Name: mux_2_to_1_1bittb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: design a multiplexer 2 to 1 of 1 bit
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

entity mux_2_to_1_1bittb is

end mux_2_to_1_1bittb;

architecture Behavioral of mux_2_to_1_1bittb is

    component mux_2_to_1_1bit
        port ( 
        In0 : in std_logic;
        In1 : in std_logic;
        s : in std_logic;
        Z : out std_logic);    
    end component;
    
        signal s : std_logic;
        signal in0 : std_logic;
        signal in1 : std_logic;
       --Outputs
        signal z : std_logic;

--  Port ( );
begin
     uut: mux_2_to_1_1bit PORT MAP (
         s => s,
         In0 => in0,
         In1 => in1,
         Z => z
       );

  stim_proc: process
  begin        
 --load random values into both inputs 
       in0 <= '0';
       in1 <= '1';
 --transition between 0 and 1 in s 
        --Z=In0
       wait for 100 ns;    
       s <= '0';
        --Z=In1
       wait for 100 ns;    
       s <= '1';    
--     wait;
  end process;
  
end Behavioral;
