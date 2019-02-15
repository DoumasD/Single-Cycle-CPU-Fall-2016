Library ieee;
use ieee.std_logic_1164.all;

entity CPU is
port(
Clk_1 : in std_logic;

PC_1 : buffer std_logic_vector(31 downto 0);
r_1,r_2,r_3,dataOut_1, dataOut_2 : buffer std_logic_vector(31 downto 0);


--ext_opTwo: buffer std_logic;
--RegDst_1,Branch_1,MemRead_1,MemtoReg_1,Memwrite_1,ALUSrc_1, Regwrite_1, zero_1 : buffer std_logic;
--ALUOP_1 : buffer std_logic_vector(2 downto 0);
-- ExtImmd_1 : buffer std_logic_vector(31 downto 0);
-- opcode_1 : buffer std_logic_vector(5 downto 0);
-- rs_1, rt_1, rd_1 : buffer std_logic_vector(4 downto 0);
-- immd_1 : buffer std_logic_vector(15 downto 0);
-- writeData_1, busA_1, busB_1,ALU_result_1 : buffer std_logic_vector(31 downto 0);

s1,s2,s3,s4,s5,s6,s7,s8 : buffer std_logic_vector(6 downto 0)
 
 
);
end CPU;

architecture arch of CPU is

component bcd is
	port(
		binary : in std_logic_vector(7 downto 0);
		bcd1 : out std_logic_vector(6 downto 0);
		bcd2 : out std_logic_vector(6 downto 0) );
end component;

component fetchUnit is
port(
clk, PC_source : in std_logic;
branchoffset : in std_logic_vector(31 downto 0);
opcode: out std_logic_vector(5 downto 0);
rs,rt,rd : out std_logic_vector(4 downto 0);
immd : out std_logic_vector(15 downto 0);
PC_out : out std_logic_vector(31 downto 0)
);
end component;


component RegUnitFetch is
port(
  rs,rt,rd: in std_logic_vector(4 downto 0);
  write_Data : in std_logic_vector(31 downto 0);
  busA, busB : out std_logic_vector(31 downto 0);
  
  ext_op,M4_clk,regWrite, regDst: in std_logic;
  
  in_unExt : in std_logic_vector(15 downto 0);
  ext_imm : out std_logic_vector(31 downto 0);
  ou1,ou2,ou3: out std_logic_vector(31 downto 0)
);
end component;


component OperationALU is
port( Abus, Bbus, extimm : in  std_logic_vector(31 downto 0);
    aluSource :in std_logic;
	 ALUOP :in std_logic_vector(2 downto 0);
	 ALUresult: out std_logic_vector(31 downto 0);
		Zero : out std_logic
	 );
end component;


component Datafetch is 
port(
AlU_result, write_Data : in std_logic_vector(31 downto 0);
M2_clk,memWrite, memRead, MemtoReg : in std_logic;
Data_Write : out std_logic_vector(31 downto 0);
addr_One, addr_Two : out std_logic_vector(31 downto 0)
);
end component;


component CPUController is
port(
OpCode : in std_logic_vector(5 downto 0);
RegDst, branch, MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,extop: out std_logic;
ALUOP : out std_logic_vector(2 downto 0));
end component;

signal ext_opTwo: std_logic;
signal RegDst_1,Branch_1,MemRead_1,MemtoReg_1,Memwrite_1,ALUSrc_1, Regwrite_1, zero_1 : std_logic;
signal ALUOP_1 : std_logic_vector(2 downto 0);
signal ExtImmd_1 : std_logic_vector(31 downto 0);
signal opcode_1 : std_logic_vector(5 downto 0);
signal rs_1, rt_1, rd_1 : std_logic_vector(4 downto 0);
signal immd_1 : std_logic_vector(15 downto 0);
signal writeData_1, busA_1, busB_1,ALU_result_1 : std_logic_vector(31 downto 0);



begin

InstFetchUnit: fetchUnit port map(Clk_1,(Branch_1 and zero_1),(to_stdlogicvector(to_bitvector(ExtImmd_1) sll 2)),
												opcode_1,rs_1,rt_1,rd_1,immd_1,PC_1);

RegFetchUnit:  RegUnitFetch port map(rs_1,rt_1,rd_1,writeData_1, busA_1,busB_1,ext_opTwo,Clk_1,Regwrite_1,RegDst_1,immd_1,ExtImmd_1,r_1,r_2,r_3);
																									

ALUOPUNIT: OperationALU port map(busA_1,busB_1,ExtImmd_1,ALUSrc_1,ALUOP_1,ALU_result_1,zero_1); 

DATAFETCHUNIT: Datafetch port map(ALU_result_1,busB_1,CLK_1,Memwrite_1,MemRead_1,MemtoReg_1,writeData_1,dataOut_1, dataOut_2);

CONTROLLER: CPUController port map(opcode_1,RegDst_1,Branch_1,MemRead_1,MemtoReg_1,Memwrite_1,ALUSrc_1, Regwrite_1,ext_opTwo,ALUOP_1);


-- least signifcant first, most significant  left to right
H1: bcd port map(PC_1(7 downto 0),s1,s2);
H2: bcd port map(r_1(7 downto 0),s3,s4);
H3: bcd port map(r_2(7 downto 0),s5,s6);
H4: bcd port map(r_3(7 downto 0),s7,s8);

end arch; 