library ieee;
use ieee.std_logic_1164.all;

entity FiveBitmux is
port(
	firstInput, SecondInput : in std_logic_vector(4 downto 0);
	pcsource : in std_logic;
	output  : out std_logic_vector(4 downto 0)
);
end FiveBitmux;

architecture arch of FiveBitmux is
begin

process(pcsource)
		begin
		if (pcsource='0') then
		 output<=firstInput;
		else
		output<=secondInput;
		end if;
		end process;

end arch;