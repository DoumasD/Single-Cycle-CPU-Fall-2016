Library ieee;
use ieee.std_logic_1164.all;

entity InstructRegister is
port(
  inputInst : in std_logic_vector(31 downto 0); -- input instruction
  clk: in std_logic;
  outputInst : out std_logic_vector(31 downto 0)
);
end InstructRegister;

architecture arch of InstructRegister is
begin 
 process(clk)
 begin
	if(rising_edge(clk)) then
	 outputInst<= inputInst;
	end if;
 end process;
end arch;