library ieee;
use ieee.std_logic_1164.all;

entity fetchUnit is
port(
clk, PC_source : in std_logic;
branchoffset : in std_logic_vector(31 downto 0);
opcode: out std_logic_vector(5 downto 0);
rs,rt,rd : out std_logic_vector(4 downto 0);
immd : out std_logic_vector(15 downto 0);
PC_out : out std_logic_vector(31 downto 0)
);
end fetchUnit;


architecture arch of fetchUnit is

component instmem is
port(
  addr : in std_logic_vector(31 downto 0);
  --clk: in std_logic;
  OutInstruct : out std_logic_vector(31 downto 0)
);
end component;

component mux is
port(
	firstInput, SecondInput : in std_logic_vector(31 downto 0);
	pcsource : in std_logic;
	output  : out std_logic_vector(31 downto 0)
);
end component;

component PCregister is
port(
  pcOld : in std_logic_vector(31 downto 0);
  clk: in std_logic;
  pcNew : out std_logic_vector(31 downto 0)
);
end component;

component Accadder is
port(
input, incrementor: in std_logic_vector(31 downto 0);
output: out std_logic_vector(31 downto 0)
);
end component;

component InstructRegister is
port(
  inputInst : in std_logic_vector(31 downto 0); -- input instruction
  clk: in std_logic;
  outputInst : out std_logic_vector(31 downto 0)
);
end component;





--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
signal inputPC, outputPC, regAdder, branchAdderResult : std_logic_vector(31 downto 0);
signal instructions, regInst : std_logic_vector(31 downto 0);

begin

PCReg : PCregister port map(inputPC, clk, outputPC);
instmemory : instmem port map(outputPC, instructions);
--IR: InstructRegister port map(instructions, clk, regInst);
regInst<=instructions;
PCAdder : Accadder port map(outputPC,"00000000000000000000000000000100",regAdder );
BranchAdder : Accadder port map(regAdder,branchoffset,branchAdderResult);
M1 : mux port map(regAdder,branchAdderResult,PC_source,inputPC);

opcode<=regInst(31 downto 26);
rs<=regInst(25 downto 21);
rt<=regInst(20 downto 16);
rd<=regInst(15 downto 11);
immd<=regInst(15 downto 0);
PC_out<=outputPC;

end arch;
