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

entity mux_8_to_1 is
--  Port ( );
    port ( 
    In0 : in std_logic_vector(15 downto 0);
    In1 : in std_logic_vector(15 downto 0);
    In2 : in std_logic_vector(15 downto 0);
    In3 : in std_logic_vector(15 downto 0);
    In4 : in std_logic_vector(15 downto 0);
    In5 : in std_logic_vector(15 downto 0);
    In6 : in std_logic_vector(15 downto 0);
    In7 : in std_logic_vector(15 downto 0);
    S1 : in std_logic;
    S2 : in std_logic;
    S3 : in std_logic;
    Z : out std_logic_vector(15 downto 0));
end mux_8_to_1;

architecture Behavioral of mux_8_to_1 is

begin
    Z <= In0 after 5 ns when S3='0' and S2='0' and S1='0' else
         In1 after 5 ns when S3='0' and S2='0' and S1='1' else
         In2 after 5 ns when S3='0' and S2='1' and S1='0' else
         In3 after 5 ns when S3='0' and S2='1' and S1='1' else
         In4 after 5 ns when S3='1' and S2='0' and S1='0' else
         In5 after 5 ns when S3='1' and S2='0' and S1='1' else
         In6 after 5 ns when S3='1' and S2='1' and S1='0' else
         In7 after 5 ns when S3='1' and S2='1' and S1='1' else         
         "0000000000000000" after 5 ns;
end Behavioral;