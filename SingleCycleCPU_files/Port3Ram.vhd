library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Port3Ram  is
port(
--regone is rs, regtwo is rt
 regOne, regtwo : in std_logic_vector(4 downto 0);
 dataOne, dataTwo : out std_logic_vector(31 downto 0);
 R_clk,RegWrite : in std_logic;
 writeReg: in std_logic_vector(4 downto 0);
 writeData: in std_logic_vector(31 downto 0);
 out1,out2,out3: out std_logic_vector(31 downto 0)
);
end Port3Ram;

architecture arch of Port3Ram is
type Sram is array(0 to 31) of std_logic_vector(31 downto 0);
signal reg : Sram;

begin
dataOne<=reg(to_integer(unsigned(regOne)));  --rs
dataTwo<=reg(to_integer(unsigned(regTwo))); --rt

process(writeData,R_clk)
begin
		if(R_clk'Event and R_clk='1') then
			if(RegWrite='1')then
			reg(to_integer(unsigned (writeReg)))<=writeData;
			end if;
		end if;
end process;


out1<=reg(0);
out2<=reg(1);
out3<=reg(2);



end arch;