library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dataMemory is
port(
InAddr : in std_logic_vector(31 downto 0);
WrData : in std_logic_vector(31 downto 0);
M_clk, memWrite, memRead : in std_logic;
ReadData : out std_logic_vector(31 downto 0);
addrOne, addrTwo : out std_logic_vector(31 downto 0)
);
end dataMemory;

architecture arch of dataMemory is
type datamem is array(0 to 31) of std_logic_vector(31 downto 0);
signal MData : datamem;

begin

			process(memWrite, memRead, M_clk)
			begin
			if (M_clk'Event and M_clk ='0') then
					if (memWrite='1') then
					MData(to_integer(unsigned(Inaddr)))<=WrData;
					end if;
					if (memRead='1') then
					ReadData<=MData(to_integer(unsigned(Inaddr)));
					end if;
			end if;		
			end process;

			addrOne<=Mdata(0);
			addrTwo<=Mdata(1);

end arch;