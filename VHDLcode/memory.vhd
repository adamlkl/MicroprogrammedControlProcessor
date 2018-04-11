----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2018 09:17:46 AM
-- Design Name: 
-- Module Name: memory - Behavioral
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

entity memory is
--  Port ( );
Port ( 
    address : in std_logic_vector(15 downto 0);
    write_data : in std_logic_vector(15 downto 0);
    MemWrite,Clk : in std_logic;
    read_data : out std_logic_vector(15 downto 0));
end memory;

architecture Behavioral of memory is
    type mem_array is array(0 to 511) of std_logic_vector(15 downto 0);
    signal snl : unsigned (15 downto 0);
-- define type, for memory arrays
begin
    
    mem_process: process (write_data,address,Clk)
    -- initialize data memory, X denotes hexadecimal number
    variable data_mem : mem_array := (
    
    --				PC 					Instructions					Pseudocode 								Codewords				   Hex
    --                                                                                                          Opcode  DR  SA  SB
    
    X"0000", --0x00                    ADI R0,R0,#0                      R0 = R0 + 0                            0000000 000 000 000
    X"0200", --0x01                    LDR R0,=0                         R0 = 0                                 0000001 000 000 000 
    X"0241", --0x02                    LDR R1,=0                         R1 = 0                                 0000001 001 000 001
    X"0282", --0x03                    LDR R2,=0                         R2 = 0                                 0000001 010 000 010 
    X"02C3", --0x04                    LDR R3,=0                         R3 = 0                                 0000001 011 000 011 
    X"0304", --0x05                    LDR R4,=0                         R4 = 0                                 0000001 100 000 100    
    X"0345", --0x06                    LDR R5,=0                         R5 = 0                                 0000001 101 000 101
    X"0386", --0x07                    LDR R6,=0                         R6 = 0                                 0000001 110 000 110 
    X"03C7", --0x08                    LDR R7,=0                         R7 = 0                                 0000001 111 000 111
    X"1C00", --0x09                    LDR R8,=0                         R8 = 0                                 0000011 000 000 000
    X"00DB", --0x0A                    ADI R3, R3, #3                    R3 = (0 + 3)  = 3                      0000000 011 011 011        00DB
    X"0ADB", --0x0B                    ADD R3, R3, R3                    R3 = (3 + 3)  = 6                      0000101 011 011 011        0ADB                                       State now = [R3==0 R4==0x8000 R7==0xFF]
    X"0121", --0x0C                    ADI R4, R4, #1                    R4 = (0 + 1)  = 1                      0000000 100 100 001        0121
    X"0F24", --0x0D                    SR  R4, R4, R4                    R4 = (1 >> 1) = 0x0                    0000111 100 100 100        0F24
    X"0ADB", --0x0E                    ADD R3, R3, R3                    R3 = (6 + 6)  = 12                     0000101 011 011 011        0ADB
    X"03D8", --0x0F                    LD  R7, Memory[R3]                R7 = Memory[12] = 0x0121               0000001 111 011 000        03D8
    
    X"08D8", --0x10                    NOT R3, R3                        R3 = (~12)      = 0xFFF3               0000100 011 011 000        08D8   
    X"06D8", --0x11        while       INC R3, R3                        4x(R3 = R3 + 1)  = 0                   0000011 011 011 000        06D8                                    
    X"1746", --0x12                    BNZ while                                                                0001011 111 000 110        17C6    
    X"3A00", --0x13        stop         B stop                                                                  0011101 000 000 000        3A00
    X"0000", --0x14
    X"0000", --0x15
    X"00FF", --0x16                                        State now = [R3==0 R4==0x0 R7==0x121]
    X"0000", --0x17
    X"0000", --(Memory[12])
    X"004D", --0x19                    ADI R1, R1, #5                    R1 = (0 + 5)  = 5                      0000000 001 001 101        004D
    X"0096", --0x1A                    ADI R2, R2, #5                    R2 = (0 + 5)  = 5                      0000000 010 010 110        0096 
    X"0890", --0x1B                    NOT R2, R2                        R2 = (~6)      = 0xFFFA                0000100 010 010 000        0890  
    X"0A4A", --0x1C                    ADD R1, R1, R2                    R1 = (5 - 6)  = -1                     0000101 001 001 010        0A4A
    X"6103", --0x1D                    Branch unconditionally                                                   0110000 100 000 011        6003
    X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000",
    X"0000", X"0000", X"0000",X"0000");
    
    variable addr:integer;
    
    begin -- the following type conversion function is in std_logic_arith
    snl <= unsigned (address);
    
        if (falling_edge(Clk)) then
            addr:=conv_integer(snl(6 downto 0));
            if MemWrite ='1' then
            data_mem(addr):= write_data;
            else read_data <= data_mem(addr)after 2ns;
            end if;
        end if;
    end process;

end Behavioral;
