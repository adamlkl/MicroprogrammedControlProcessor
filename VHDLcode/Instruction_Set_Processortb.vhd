----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2018 03:07:07 AM
-- Design Name: 
-- Module Name: Instruction_Set_Processortb - Behavioral
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

entity Instruction_Set_Processortb is
--  Port ( );
end Instruction_Set_Processortb;

architecture Behavioral of Instruction_Set_Processortb is
    component Instruction_Set_Processor port (
        Clk, reset: in std_logic;
        --TEST signals
        Microprogrammed_Control_DR,Microprogrammed_Control_SB,Microprogrammed_Control_SA : out std_logic_vector(3 downto 0);
        datapath_data_out,memory_read_out : out std_logic_vector(15 downto 0);
        rgrw,z_flag,v_flag,c_flag,n_flag : out std_logic;
        reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8 : out std_logic_vector(15 downto 0);
        Microprogrammed_Control_pc_out : out std_logic_vector(15 downto 0));
    end component;
    
    signal Clk,reset : std_logic;
    --test outputs 
    signal rgrw,z_flag,v_flag,c_flag,n_flag : std_logic;
    signal Microprogrammed_Control_DR,Microprogrammed_Control_SB,Microprogrammed_Control_SA : std_logic_vector(3 downto 0);
    signal datapath_data_out,memory_read_out : std_logic_vector(15 downto 0);
    signal Microprogrammed_Control_pc_out : std_logic_vector(15 downto 0); 
    signal reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8 : std_logic_vector(15 downto 0);
    constant delay : time := 10ns;
    
begin
    
    uut : Instruction_Set_Processor port map (
        Clk=>Clk,
        reset=>reset,
        rgrw => rgrw,
        z_flag => z_flag,
        v_flag => v_flag,
        c_flag => c_flag,
        n_flag => n_flag,
        Microprogrammed_Control_DR => Microprogrammed_Control_DR,
        Microprogrammed_Control_SB => Microprogrammed_Control_SB,
        Microprogrammed_Control_SA => Microprogrammed_Control_SA,
        datapath_data_out => datapath_data_out,
        memory_read_out =>memory_read_out,
        reg0 => reg0,
        reg1 => reg1,
        reg2 => reg2,
        reg3 => reg3,
        reg4 => reg4,
        reg5 => reg5,
        reg6 => reg6,
        reg7 => reg7,
        reg8 => reg8,
        Microprogrammed_Control_pc_out => Microprogrammed_Control_pc_out);
    
    stim:process
        begin         
        --reset PC and CAR to set in default values for the first loop 
            reset <='1';
            wait for 100ns;
        --start PC and processor 
        --execute all instructions stored in memory 
            reset <='0';
            wait;
    end process;
    
    clock : process
        begin
           Clk <= '0';
           wait for delay/2;
           Clk <= '1';
           wait for delay/2;
        end process;
end Behavioral;
