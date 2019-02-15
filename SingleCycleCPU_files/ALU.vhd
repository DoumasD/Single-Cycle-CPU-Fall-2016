Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ALU is
port(
Ainput, Binput : in std_logic_vector(31 downto 0);
result : buffer std_logic_vector(31 downto 0);
zero : out std_logic;
alu_control : in std_logic_vector(2 downto 0)
);
end ALU;

architecture arch of ALU is
begin

process(alu_control)
begin
  if(alu_control="000")then --add unsigned
   result<= Ainput + Binput;
  elsif(alu_control="001") then -- subtract unsigned
   result<= Ainput - Binput;
				if(result ="00000000000000000000000000000000") then
				 zero<= '1';
				 else
				 zero<='0';
				 end if;
   else
	result<=Ainput or Binput;
  end if;
end process;



end arch;