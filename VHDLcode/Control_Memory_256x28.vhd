----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2018 10:00:12 AM
-- Design Name: 
-- Module Name: Control_Memory_512x28 - Behavioral
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

entity Control_Memory_256x28 is
--  Port ( );
    Port ( 
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
    end Control_Memory_256x28;

architecture Behavioral of Control_Memory_256x28 is
    type mem_array is array(0 to 255) of std_logic_vector(27 downto 0);
    ----------------------------------------------------------------------------------------------------
    
    --     Instruction    Address      Next Address .     MS     MC.  IL   PI   PL   TD.  TA   TB   MB   .FS     .MD   RW   MM   MW        Code
    
    --        ADI            00          IF  -> C0        001    0    0    0    0    0    0    0    1    00010    0    1    0    0    =    0xC020224
    --        LD             01          IF  -> C0        001    0    0    0    0    0    0    0    0    00000    1    1    0    0    =    0xC02000C
    --        ST             02          IF  -> C0        001    0    0    0    0    0    0    0    0    00000    0    0    0    1    =    0xC020001
    --        INC            03          IF  -> C0        001    0    0    0    0    0    0    0    0    00001    0    1    0    0    =    0xC020014
    --        NOT            04          IF  -> C0        001    0    0    0    0    0    0    0    0    01110    0    1    0    0    =    0xC0200E4
    --        ADD            05          IF  -> C0        001    0    0    0    0    0    0    0    0    00010    0    1    0    0    =    0xC020024
    
    --        LRI            06          LRI2-> 86        001    0    0    0    0    0    0    0    0    00000    1    1    0    0    =    0x862000C
    --        SR             07          SR2 -> 87        111    0    0    0    0    1    0    0    0    00000    0    1    0    0    =    0x87E1004
    
    --        BEQ            09          B   -> 30        100    0    0    0    1    1    1    1    0    10000    0    1    0    0    =    0x0081D04
    --        Catch          0A          IF  -> C0        001    0    0    0    0    0    0    0    0    00000    0    0    0    0    =    0xC020000
    
    --        BNZ            0B          B   -> 30        111    0    0    0    0    0    0    0    0    00000    0    0    0    0    =    0x30E0000
    --        Catch          0C          IF  -> C0        001    0    0    0    0    0    0    0    0    00000    0    0    0    0    =    0xC020000
    
    --        CMP            0D          IF  -> C0        001    0    0    0    0    1    0    0    0    00101    0    1    0    0    =    0xC021054
    --        LR             29          IF  -> C0        001    0    0    0    0    0    0    0    0    00000    1    1    0    0    =    0xC02000C
    --        B              30          IF  -> C0        001    0    0    0    1    0    0    0    0    00000    0    0    0    0    =    0xC022000
    
    --        LRI2           86          IF  -> C0        001    0    0    0    0    0    1    0    0    00000    1    1    0    0    =    0xC02080C
    --        SR2            87          SR3 -> 89        001    0    0    0    0    0    0    0    0    10100    0    1    0    0    =    0x8820144
    --        SR3            88          SR2 -> 87        100    0    0    0    0    1    1    0    0    00110    0    1    0    0    =    0x8781864
    --        Catch          89          IF  -> C0        001    0    0    0    0    0    0    0    0    00000    0    0    0    0    =    0xC020000
    
    --        IF             C0          EXO -> C1        000    0    1    1    0    0    0    0    0    00000    0    0    1    0    =    0xC10C002
    --        EXO            C1          --  -> 00        001    1    0    0    0    0    0    0    0    00000    0    0    0    0    =    0x0030000
    
    ----------------------------------------------------------------------------------------------------

    begin
        memory_m: process(IN_CAR)
        variable control_mem : mem_array:=(
            -- 0
            X"C020224", -- 0x00	   ADI:	Add immediate constant
            X"C02000C", -- 0x01    LDR:    Load
            X"C020001", -- 0x02    STR:    Store
            X"C020014", -- 0x03    INC:    Increment
            X"C0200E4", -- 0x04    NOT:    Not
            X"C020024", -- 0x05    ADD:    Add
            X"862000C", -- 0x06    LRI:    Load into immediate register    Micro operation 1
            X"87E1004", -- 0x07    SR:    Shift Right                         Micro-operation 1
            X"C020000", -- 0x08    Catch (to fall through to if shifted right by zero)
            X"3080000", -- 0x09    BEQ:  Branch if equal
            X"C020000", -- 0x0A    Catch (to fall through to if branch not taken)
            X"30E0000", -- 0x0B    BNZ:    Branch if not zero
            X"C020000", -- 0x0C    Catch (to fall through to if branch not taken)
            X"C021054", -- 0x0D    CMP:  Compare
            X"C021C0C", -- 0x0E    LDR for r8
            X"0000000", -- 0x0F
            --1
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            --2
            -- 0x29	LR: Load
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"C02000C", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            --3
            -- 0x30	B: Unconditional Branch
            X"C022000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            --4
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            --5
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            --6
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            --7
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            --8
            -- 0x86	   LRI2:	Load Immediate    Register Micro-operation 2
            -- 0x87    SRM2:    Shift Register    Micro-operation 2
            -- 0x88    SRM3:    Shift Register    Micro-operation 3
            -- 0x89    Catch (to fall through to if finished shifting right)
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"C02080C",X"8820144",
            X"8781864", X"C020000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
                    
            --9
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            --A
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            --B
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            --C
            -- 0xC0	Instruction fetch
            -- 0xC1	EXO
            X"C10C002", X"0030000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            --D
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            --E
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            --F
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000",
            X"0000000", X"0000000", X"0000000",X"0000000");
            
    variable addr : integer;
    variable control_out : std_logic_vector(27 downto 0);
    
    begin
        addr := conv_integer(IN_CAR);
        control_out := control_mem(addr);
        MW <= control_out(0);
        MM <= control_out(1);
        RW <= control_out(2);
        MD <= control_out(3);
        FS <= control_out(8 downto 4);
        MB <= control_out(9);
        TB <= control_out(10);
        TA <= control_out(11);
        TD <= control_out(12);
        PL <= control_out(13);
        PI <= control_out(14);
        IL <= control_out(15);
        MC <= control_out(16);
        MS <= control_out(19 downto 17);
        NA <= control_out(27 downto 20);
    end process; 
end Behavioral;
