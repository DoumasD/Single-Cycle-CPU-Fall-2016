library ieee;
use ieee.std_logic_1164.all;

-- high lighted in black on diagram
entity Datafetch is 
port(
AlU_result, write_Data : in std_logic_vector(31 downto 0);
M2_clk,memWrite, memRead, MemtoReg : in std_logic;
Data_Write : out std_logic_vector(31 downto 0);
addr_One, addr_Two : out std_logic_vector(31 downto 0)
);
end Datafetch;

architecture arch of Datafetch is

component dataMemory is
port(
InAddr : in std_logic_vector(31 downto 0);
WrData : in std_logic_vector(31 downto 0);
M_clk,memWrite, memRead : in std_logic;
ReadData : out std_logic_vector(31 downto 0);
addrOne, addrTwo : out std_logic_vector(31 downto 0)
);
end component;

component mux is
port(
	firstInput, SecondInput : in std_logic_vector(31 downto 0);
	pcsource : in std_logic;
	output  : out std_logic_vector(31 downto 0)
);
end component;



signal Read_data : std_logic_vector(31 downto 0);
begin

DM1: datamemory port map(AlU_result,write_Data,M2_clk,memWrite, memRead,Read_data,addr_One, addr_Two);	
M4: mux port map(AlU_result, Read_data,MemtoReg, Data_Write);

end arch;