Library ieee;
use ieee.std_logic_1164.all;

entity PCregister is
port(
  pcOld : in std_logic_vector(31 downto 0);
  clk: in std_logic;
  pcNew : out std_logic_vector(31 downto 0) :="00000000000000000000000000000000"
);
end PCregister;

architecture arch of PCregister is
begin 
 process(clk)
 begin
	if(rising_edge(clk)) then
	 pcNew<= pcOld;
	end if;
 end process;
end arch;