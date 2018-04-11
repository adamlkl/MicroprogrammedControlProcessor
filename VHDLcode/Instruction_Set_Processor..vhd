----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2018 02:10:22 AM
-- Design Name: 
-- Module Name: Instruction_Set_Processor - Behavioral
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

entity Instruction_Set_Processor is
--  Port ( );
    port (
        Clk, reset: in std_logic;
        --TEST signals
        Microprogrammed_Control_DR,Microprogrammed_Control_SB,Microprogrammed_Control_SA : out std_logic_vector(3 downto 0);
        testadd,datapath_data_out,memory_read_out : out std_logic_vector(15 downto 0);
        rgrw,z_flag,v_flag,c_flag,n_flag : out std_logic;
        reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8 : out std_logic_vector(15 downto 0);
        Microprogrammed_Control_pc_out : out std_logic_vector(15 downto 0)        
        );
        
end Instruction_Set_Processor;

architecture Behavioral of Instruction_Set_Processor is

    component datapath port (
        dataIn,PC : in std_logic_vector (15 downto 0);
        zeroFill_in : in std_logic_vector (2 downto 0);
        control_word : in std_logic_vector ( 16 downto 0);
        TA,TB,TD,MM : in std_logic;
        Clk : in std_logic;
        V,C,N,Z : out std_logic;
        reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8 : out std_logic_vector(15 downto 0);
        addOut,dataOut : out std_logic_vector (15 downto 0));
    end component;
    
    component memory port (
        address : in std_logic_vector(15 downto 0);
        write_data : in std_logic_vector(15 downto 0);
        MemWrite,Clk : in std_logic;
        read_data : out std_logic_vector(15 downto 0));
    end component;
    
    component Microprogrammed_Control port (
        IR : in std_logic_vector (15 downto 0);
        Clk,reset : in std_logic;
        V,C,N,Z : in std_logic;
        PC_Out : out std_logic_vector (15 downto 0);
        DR,SA,SB : out std_logic_vector (2 downto 0);
        TD,TA,TB : out std_logic;
        RW,MB,MD,MM,MW : out std_logic;
        FS : out std_logic_vector (4 downto 0));
    end component;
    
    signal V_out,C_out,N_out,Z_out : std_logic;
    signal SB_out : std_logic_vector(2 downto 0);
    signal TD_out,TA_out,TB_out : std_logic;
    signal MM_out,MW_out : std_logic;
    signal PC_out : std_logic_vector (15 downto 0);
    signal data_out : std_logic_vector (15 downto 0);
    signal control_word : std_logic_vector (16 downto 0);
    signal addOut, dataOut : std_logic_vector (15 downto 0);
    
begin
    Datapath_unit : datapath port map (
        PC=>PC_out,
        dataIn=>data_out,
        zeroFill_in=>SB_out,
        control_word=>control_word,
        Clk=>Clk,
        TA=>TA_out,
        TB=>TB_out,
        TD=>TD_out,
        MM=>MM_out,
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
        V=>V_out,
        C=>C_out,
        N=>N_out,
        Z=>Z_out);
        
    Memory_unit : memory port map (
        address=>addOut,
        write_data=>dataOut,
        MemWrite=>MW_out,
        Clk=>Clk,
        read_data=>data_out);
        
    Microprogrammed_Control_unit : Microprogrammed_Control port map(
        IR => data_out,
        Clk => Clk,
        reset => reset,
        V=>V_out,
        C=>C_out,
        N=>N_out,
        Z=>Z_out, 
        PC_Out=>PC_out,
        DR=>control_word(16 downto 14),
        SA=>control_word(13 downto 11),
        SB=>SB_out, 
        TD=>TD_out,
        TA=>TA_out,
        TB=>TB_out, 
        RW=>control_word(0),
        MB=>control_word(7),
        MD=>control_word(1),
        MM=>MM_out,
        MW=>MW_out,
        FS=>control_word(6 downto 2));
        
        control_word(10 downto 8)<=SB_out;
        --put in values for test outputs 
        datapath_data_out <= dataOut;
        memory_read_out <= data_out;
        Microprogrammed_Control_pc_out <= PC_out;
        Microprogrammed_Control_DR(2 downto 0)<= control_word(16 downto 14);
        Microprogrammed_Control_DR(3)<= TD_out;
        Microprogrammed_Control_SB(2 downto 0)<= SB_out;
        Microprogrammed_Control_SB(3)<= TB_out;
        Microprogrammed_Control_SA(2 downto 0)<= control_word(13 downto 11);
        Microprogrammed_Control_SA(3)<= TA_out;
        rgrw <= control_word(0);
        z_flag <= Z_out;
        v_flag <= V_out;
        c_flag <= C_out;
        n_flag <= N_out;
end Behavioral;
