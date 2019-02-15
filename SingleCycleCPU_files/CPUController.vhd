Library ieee;
use ieee.std_logic_1164.all;

entity CPUController is
port(
OpCode : in std_logic_vector(5 downto 0);
RegDst, branch, MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,extop: out std_logic;
ALUOP : out std_logic_vector(2 downto 0));
end CPUController;

architecture arch of CPUController is
begin
process(OpCode)
begin

case OpCode is 
 when "000000"=>   -- add
  RegDst <='1';
  branch <='0';
  MemRead<='0';
  MemtoReg<='0';
  ALUOP<="000";
  MemWrite<='0';
  ALUSrc<='0';
  RegWrite<='1';
  extop<='1';
 when "000001"=>   --sub
 RegDst <='1';
  branch <='0';
  MemRead<='0';
  MemtoReg<='0';
  ALUOP<="001";
  MemWrite<='0';
  ALUSrc<='0';
  RegWrite<='1';
  extop<='1';
 when "000010"=>   --Ori
 RegDst <='0';
  branch <='0';
  MemRead<='0';
  MemtoReg<='0';
  ALUOP<="010";
  MemWrite<='0';
  ALUSrc<='1';
  RegWrite<='1';
  extop<='0';
 when "000011"=>   --Load
 RegDst <='0';
  branch <='0';
  MemRead<='1';
  MemtoReg<='1';
  ALUOP<="000";
  MemWrite<='0';
  ALUSrc<='1';
  RegWrite<='1';
  extop<='1';
 when "000100"=>   --store
 RegDst <='0';
  branch <='0';
  MemRead<='0';
  MemtoReg<='0';
  ALUOP<="000";
  MemWrite<='1';
  ALUSrc<='1';
  RegWrite<='0';
  extop<='1';
 when others =>   --Branch  -- change if we want to add more inst
  RegDst <='0';
  branch <='1';
  MemRead<='0';
  MemtoReg<='0';
  ALUOP<="001";
  MemWrite<='0';
  ALUSrc<='0';
  RegWrite<='0';
  extop<='1';
end case;



end process;

end arch;