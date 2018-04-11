----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2018 10:44:29 PM
-- Design Name: 
-- Module Name: Microprogrammed_Control - Behavioral
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

entity Microprogrammed_Control is
--  Port ( );
    port (
        IR : in std_logic_vector (15 downto 0);
        Clk,reset : in std_logic;
        V,C,N,Z : in std_logic;
        PC_Out : out std_logic_vector (15 downto 0);
        DR,SA,SB : out std_logic_vector (2 downto 0);
        TD,TA,TB : out std_logic;
        RW,MB,MD,MM,MW : out std_logic;
        test_pi,test_pl : out std_logic;
        FS : out std_logic_vector (4 downto 0));
        
end Microprogrammed_Control;

architecture Behavioral of Microprogrammed_Control is
    
    component Control_Address_Register port (
        CAR_in : in STD_LOGIC_VECTOR(7 downto 0);
        CAR_S, reset,Clk : in STD_LOGIC;
        CAR_out : out STD_LOGIC_VECTOR(7 downto 0));
    end component;
    
    component PC port (
        PC_extend : in std_logic_vector(15 downto 0);
        PL, PI : in std_logic;
        Clk,reset : in std_logic;
        PC_out : out std_logic_vector(15 downto 0));
    end component;
    
    component Control_Memory_256x28 port (
        IN_CAR : in std_logic_vector(7 downto 0);
        MW : out std_logic;
        MM : out std_logic;
        RW : out std_logic;
        MD : out std_logic;
        FS : out std_logic_vector(4 downto 0);
        MB : out std_logic;
        TB : out std_logic;
        TA : out std_logic;
        TD : out std_logic;
        PL : out std_logic;
        PI : out std_logic;
        IL : out std_logic;
        MC : out std_logic;
        MS : out std_logic_vector(2 downto 0);
        NA : out std_logic_vector(7 downto 0));   
    end component;
    
    component Instruction_Format port (
        IR : in std_logic_vector(15 downto 0);
        IL : in std_logic;
        Clk : in std_logic;
        DR : out std_logic_vector(2 downto 0);
        SA : out std_logic_vector(2 downto 0);
        SB : out std_logic_vector(2 downto 0);
        Opcode : out std_logic_vector(6 downto 0));     
    end component;
    
    component Extend_PC port (
        DR_in, SB_in : in std_logic_vector (2 downto 0);
        Extend_PC_out : out std_logic_vector (15 downto 0));
    end component;
    
    component mux_2_to_1_8bit port (
        In0 : in std_logic_vector(7 downto 0);
        In1 : in std_logic_vector(7 downto 0);
        s : in std_logic;
        Z : out std_logic_vector(7 downto 0));    
    end component;
    
    component mux_8_to_1_1bit port (
        In0 : in std_logic;
        In1 : in std_logic;
        In2 : in std_logic;
        In3 : in std_logic;
        In4 : in std_logic;
        In5 : in std_logic;
        In6 : in std_logic;
        In7 : in std_logic;
        S : in std_logic_vector(2 downto 0);
        Z : out std_logic);
    end component;     
    
    signal data_src_muxS_out,MC_out,PL_out,PI_out,IL_out,notC,notZ : std_logic;
    signal data_src_muxC_out,CAR_out,NA_out : std_logic_vector (7 downto 0); 
    signal MS_out,DR_out,SA_out,SB_out : std_logic_vector (2 downto 0);
    signal IF_Opcode : std_logic_vector (7 downto 0);
    signal extend_out : std_logic_vector (15 downto 0);
begin

    control_memory : Control_Memory_256x28 port map (
        IN_CAR => CAR_out,
        MW => MW,
        MM => MM,
        RW => RW,
        MD => MD,
        FS => FS,
        MB => MB,
        TB => TB,
        TA => TA,
        TD => TD,
        PL => PL_out,
        PI => PI_out,
        IL => IL_out,
        MC => MC_out,
        MS => MS_out,
        NA => NA_out); 
        
    CAR : Control_Address_Register port map (
        CAR_in => data_src_muxC_out,
        CAR_S => data_src_muxS_out,
        Clk => Clk,
        reset => reset,
        CAR_out =>CAR_out);
        
    InstructionFormat : Instruction_Format port map (
        IR => IR,
        IL => IL_out,
        Clk => Clk,
        DR => DR_out,
        SA => SA_out,
        SB => SB_out,
        Opcode => IF_Opcode(6 downto 0)); 
        
    Program_Counter : PC port map (
        PC_extend => extend_out,
        PL => PL_out,
        PI => PI_out,
        Clk => Clk,
        reset => reset,
        PC_out => PC_Out);
    
    Extend : Extend_PC port map (
        DR_in => DR_out, 
        SB_in => SB_out,
        Extend_PC_out => extend_out);
            
    MUX_C : mux_2_to_1_8bit port map (
        In0 => NA_out,
        In1 => IF_Opcode,
        s => MC_out,
        Z => data_src_muxC_out);
        
    MUX_S : mux_8_to_1_1bit port map (
        In0 => '0',
        In1 => '1',
        In2 => C,
        In3 => V,
        In4 => Z,
        In5 => N,
        In6 => notC,
        In7 => notZ,
        S => MS_out, 
        Z => data_src_muxS_out);
        
    IF_Opcode(7) <= '0';
    notC <= not C;
    notZ <= not Z;
    SA <= SA_out;
    SB <= SB_out;
    DR <= DR_out;
    test_pi <=PI_out;
    test_pl <= PL_out;
end Behavioral;
