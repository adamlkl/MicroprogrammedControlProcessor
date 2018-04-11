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

entity mux_8_to_1tb is
--  Port ( );
end mux_8_to_1tb;

architecture tb of mux_8_to_1tb is

    component mux_8_to_1 
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
       Z : out std_logic_vector(15 downto 0)
       );
    end component;
    
           --signal enable : std_logic_vector(2 downto 0);
           signal s1: std_logic;
           signal s2: std_logic;
           signal s3: std_logic;
           signal in0 : std_logic_vector(15 downto 0);
           signal in1 : std_logic_vector(15 downto 0);
           signal in2 : std_logic_vector(15 downto 0);
           signal in3 : std_logic_vector(15 downto 0);
           signal in4 : std_logic_vector(15 downto 0);
           signal in5 : std_logic_vector(15 downto 0);
           signal in6 : std_logic_vector(15 downto 0);
           signal in7 : std_logic_vector(15 downto 0);                              
          --Outputs
           signal z : std_logic_vector(15 downto 0);
begin
     uut: mux_8_to_1 PORT MAP (
         In0 => in0,
         In1 => in1,
         In2 => in2,
         In3 => in3,
         In4 => in4,
         In5 => in5,
         In6 => in6,
         In7 => in7,   
         S1 => s1,
         S2 => s2,
         S3 => s3,
         Z => z
       );

    stim_proc: process
        begin        
 --loading random hex values into each of the 8 inputs 
            in0 <= X"0000";
            in1 <= X"0001";
            in2 <= X"0002";
            in3 <= X"0003";
            in4 <= X"0004";
            in5 <= X"0005";
            in6 <= X"0006";     
            in7 <= X"0007";

--change values in s from 0 to 7 in bits of 3.            
            wait for 10 ns;    
            --enable <= "000";
            s3 <= '0';
            s2 <= '0';
            s1 <= '0';
            
            wait for 10 ns;    
            --enable <= "001";    
            s3 <= '0';
            s2 <= '0';
            s1 <= '1';
            
            wait for 10 ns;    
            --enable <= "010";
            s3 <= '0';
            s2 <= '1';
            s1 <= '0';
            
            wait for 10 ns;    
            --enable <= "011"; 
            s3 <= '0';
            s2 <= '1';
            s1 <= '1';  
            
            wait for 10 ns;    
            --enable <= "100";
            s3 <= '1';
            s2 <= '0';
            s1 <= '0'; 
                     
            wait for 10 ns;    
            --enable <= "101";
            s3 <= '1';
            s2 <= '0';
            s1 <= '1';  
                          
            wait for 10 ns;    
            --enable <= "110";
            s3 <= '1';
            s2 <= '1';
            s1 <= '0';
                                             
            wait for 10 ns;    

            --enable <= "111";   
            s3 <= '1';
            s2 <= '1';
            s1 <= '1';
           
            --     wait;
  end process;

end tb;