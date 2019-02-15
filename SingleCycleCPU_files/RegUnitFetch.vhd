library ieee;
use ieee.std_logic_1164.all;


--highlighted in blue on diagram
entity RegUnitFetch is
port(
  rs,rt,rd: in std_logic_vector(4 downto 0);
  write_Data : in std_logic_vector(31 downto 0);
  busA, busB : out std_logic_vector(31 downto 0);
  
  ext_op,M4_clk,regWrite, regDst: in std_logic;
  
  in_unExt : in std_logic_vector(15 downto 0);
  ext_imm : out std_logic_vector(31 downto 0);
  ou1,ou2,ou3: out std_logic_vector(31 downto 0)
);
end RegUnitFetch;

architecture arch of RegUnitFetch is

component Port3Ram is
port(
--regone is rs, regtwo isrt
 regOne, regtwo : in std_logic_vector(4 downto 0);
 dataOne, dataTwo : out std_logic_vector(31 downto 0);
 R_clk,RegWrite : in std_logic;
 writeReg: in std_logic_vector(4 downto 0);
 writeData: in std_logic_vector(31 downto 0);
 out1,out2,out3: out std_logic_vector(31 downto 0)
);
end component;

component FiveBitmux is
port(
	firstInput, SecondInput : in std_logic_vector(4 downto 0);
	pcsource : in std_logic;
	output  : out std_logic_vector(4 downto 0)
);
end component;

 component SignExt is
 port(
 input : in std_logic_vector(15 downto 0);
 extop : in std_logic;
 output : out std_logic_vector(31 downto 0)
);
 end component;

signal write_reg_addr : std_logic_vector(4 downto 0);

begin

M1: FiveBitmux port map(rt, rd,regDst,write_reg_addr );
PR1: Port3Ram port map(rs,rt,busA,busB,M4_clk,regWrite,write_reg_addr,write_Data,ou1,ou2,ou3);
signExt1: SignExt port map(in_unExt,ext_op,ext_imm);

end arch;