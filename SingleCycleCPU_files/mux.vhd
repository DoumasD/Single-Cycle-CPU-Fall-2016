library ieee;
use ieee.std_logic_1164.all;

entity mux is
port(
	firstInput, SecondInput : in std_logic_vector(31 downto 0);
	pcsource : in std_logic;
	output  : out std_logic_vector(31 downto 0)
);
end mux;

architecture arch of mux is
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