Library ieee;
use ieee.std_logic_1164.all;


-- highlighte in green
entity OperationALU is
port( Abus, Bbus, extimm : in  std_logic_vector(31 downto 0);
    aluSource :in std_logic;
	 ALUOP :in std_logic_vector(2 downto 0);
	 ALUresult: out std_logic_vector(31 downto 0);
		Zero : out std_logic
	 );
end OperationALU;

architecture arch of OperationALU is

component mux is 
port(
	firstInput, SecondInput : in std_logic_vector(31 downto 0);
	pcsource : in std_logic;
	output  : out std_logic_vector(31 downto 0)
);
end component;

component ALU is
port(
Ainput, Binput : in std_logic_vector(31 downto 0);
result : buffer std_logic_vector(31 downto 0);
zero : out std_logic;
alu_control : in std_logic_vector(2 downto 0)
);
end component;


signal Outmux : std_logic_vector(31 downto 0);
begin

m2: mux port map(Bbus,extimm,aluSource,Outmux);
ALU1: ALU port map(Abus, Outmux,ALUresult,Zero,ALUOP);



end arch;