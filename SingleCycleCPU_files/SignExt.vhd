library ieee;
use ieee.std_logic_1164.all;

entity SignExt is
port(
 input : in std_logic_vector(15 downto 0);
 extop: in std_logic;
 output : out std_logic_vector(31 downto 0)
);
end SignExt;

architecture arch of SignExt is 
begin
		process(input)
		begin
		if((input(15)='1') and extop='1') then
		output(15 downto 0)<=input;
		output(31 downto 16)<=(others=>'1');
		else
		output(15 downto 0)<=input;
		output(31 downto 16)<=(others=>'0');
		end if;
		end process;

end arch;