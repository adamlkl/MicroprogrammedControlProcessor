----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2018 11:01:34 PM
-- Design Name: 
-- Module Name: datapathtb - Behavioral
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

entity datapathtb is
--  Port ( );
end datapathtb;

architecture Behavioral of datapathtb is
    component datapath
        port (
            dataIn,PC : in std_logic_vector (15 downto 0);
            zeroFill_in : in std_logic_vector (2 downto 0);
            control_word : in std_logic_vector ( 16 downto 0);
            TA,TB,TD,MM : in std_logic;
            Clk : in std_logic;
            V,C,N,Z : out std_logic;            
            addOut,dataOut: out std_logic_vector (15 downto 0);
            --test outputs
            reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8 : out std_logic_vector(15 downto 0));
        end component;
        
        signal dataIn,PC, addOut,dataOut : std_logic_vector (15 downto 0);
        signal zeroFill_in : std_logic_vector(2 downto 0);
        signal control_word : std_logic_vector (16 downto 0);
        signal Clk,V,C,N,Z : std_logic;
        signal TA,TB,TD,MM : std_logic;    
        --test outputs  
        signal reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8 : std_logic_vector(15 downto 0);
        constant delay : time:= 30ns;
begin
    
    uut: datapath port map (
        PC=>PC,
        dataIn=>dataIn,
        zeroFill_in=>zeroFill_in,
        control_word => control_word,
        Clk=>Clk,
        TA=>TA,
        TB=>TB,
        TD=>TD,
        MM=>MM,
        addOut=>addOut,
        dataOut=>dataOut,
        reg0 => reg0,
        reg1 => reg1,
        reg2 => reg2,
        reg3 => reg3,
        reg4 => reg4,
        reg5 => reg5,
        reg6 => reg6,
        reg7 => reg7,
        reg8 => reg8,
        V=>V,
        C=>C,
        N=>N,
        Z=>Z);
        
    stim : process
        begin 
            --test PC ON MUX M WITH MM         
            PC <= x"FAFA";
            MM <= '1';
            wait for delay;
            --partA load values 
            --enable write and MD 
            MM <= '0';            
            dataIn <= x"0000";
            zeroFill_in<= "000";
            TA<='0';
            TB<='0';
            TD<='0';
            control_word <= "00000000000000011";          
            wait for delay;
           
           --TA,TB,TD  remain 0 since we are not loading to or looking at the 9th register 
           --select the previous register to view its contents due to delay in loading values in to register 
            dataIn <= x"1111";
            control_word <= "00100000000000011";          
            wait for delay;

            dataIn <= x"2222";
            control_word <= "01000100100000011";          
            wait for delay;
            
            dataIn <= x"3333";
            control_word <= "01101001000000011";          
            wait for delay;
            
            dataIn <= x"4444";
            control_word <= "10001101100000011";          
            wait for delay;
            
            dataIn <= x"5555";
            control_word <= "10110010000000011";          
            wait for delay;
                        
            dataIn <= x"6666";
            control_word <= "11010110100000011";          
            wait for delay;
            
            dataIn <= x"AAAA";
            control_word <= "11111011000000011";          
            wait for delay;
            
            --load to and look at 9th register
            dataIn <= x"8888";
            TA<='1';
            TB<='1';
            TD<='1';
            control_word <= "00011111100000011";          
            wait for delay;
            control_word <= "00000000000000011"; 
            wait for delay;
            --partB perform operations
            --disable RW
            --still enable MD
            --try load ffff into r0, will fail 
            --view data in r7 and r0
            dataIn<=x"FFFF";
            TA<='0';
            TB<='0';
            TD<='0';
            control_word <= "00011100000000010";  
            wait for delay;                     
                      
            --enable MB
            --load data into reg1
            --A+constIn 
            control_word <= "01001001010001001";              
            wait for delay;  
      
            --disable MB
            --load new data into reg4
            --select reg 0 and 1
            control_word <= "10000000101000001";
            wait for delay;
            
            --transfer A
            control_word <= "10010010000000001";
            wait for delay;
            --increment
            control_word <= "00100100100000101";
            wait for delay;
            --subtract 
            control_word <= "01101101100010101";
            wait for delay;
            --AND 
            control_word <= "01001001000100001";
            wait for delay;
            --OR
            control_word <= "10010010000101001";
            wait for delay;
            --XOR
            control_word <= "10110110100110001";
            wait for delay;
            --NOT
            control_word <= "11011011000111001";
            wait for delay;
            --SHIFT RIGHT
            control_word <= "11011011001010001";
            wait for delay;
            --SHIFT LEFT
            control_word <= "10110110101100001";
            wait for delay;
            --CHECK MUX M WITH PC AGAIN 
            --EXPECTED RESULT = x"FAFA"         
            MM <='1';
            wait;
          end process;
    --clock transition between 1 and 0                
    clock : process
        begin
           Clk <= '0';
           wait for 15ns;
           Clk <= '1';
           wait for 15ns;
        end process;
        
end Behavioral;
