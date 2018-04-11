----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2018 04:24:26 PM
-- Design Name: 
-- Module Name: shiftertb - Behavioral
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

entity shiftertb is
--  Port ( );
end shiftertb;

architecture Behavioral of shiftertb is

    component shifter
        port(
            b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15 : in std_logic;
            il,ir : in std_logic;
            --h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,h15 : out std_logic;
            h : out std_logic_vector(15 downto 0);
            S : in std_logic_vector ( 1 downto 0));
        end component;
    
    signal b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15 : std_logic;
    signal il,ir : std_logic; 
    --signal h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,h15 : std_logic;
    signal h : std_logic_vector (15 downto 0);
    signal S : std_logic_vector (1 downto 0);
    
begin
    
    uut: shifter port map (
        b0=>b0,
        b1=>b1,
        b2=>b2,
        b3=>b3,
        b4=>b4,
        b5=>b5,
        b6=>b6,
        b7=>b7,
        b8=>b8,
        b9=>b9,
        b10=>b10,
        b11=>b11,
        b12=>b12,
        b13=>b13,
        b14=>b14,
        b15=>b15,
        il=>il,
        ir=>ir,
        h=>h,
        S=>S);

    stim : process 
    begin 
    --load values in b 
        b0<='1';
        b1<='0';
        b2<='1';
        b3<='0';
        b4<='1';
        b5<='0';
        b6<='1';
        b7<='0';
        b8<='1';
        b9<='0';
        b10<='1';
        b11<='0';
        b12<='1';
        b13<='0';
        b14<='1';
        b15<='0';
        ir<='0';
        il<='0';
        
        --select In0, itself
        S<="00";
        wait for 100ns;
        
        --select In1, after  
        S<="01";
        wait for 100ns;
        
        --select In2, previous      
        S<="10";
        wait for 100ns;
                     
        --testing value for 3 just to make sure my mux3to1 is working perfectly 
        --expect h to be 0 at any levels   
        S<="11";
        wait for 100ns;        
    end process;
end Behavioral;
