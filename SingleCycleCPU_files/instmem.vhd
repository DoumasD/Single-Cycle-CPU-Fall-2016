Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instmem is
port(
  addr : in std_logic_vector(31 downto 0);
  --clk: in std_logic;
  OutInstruct : out std_logic_vector(31 downto 0)
);
end instmem;

architecture arch of instmem is


-- table 256 rows and 8 bit columns
type ram is array(0 to 127) of std_logic_vector(7 downto 0);
signal mem : ram;
begin

--process(clk)
--begin

	--		if(rising_edge(clk))then

			OutInstruct(7 downto 0)<= mem(to_integer(unsigned(addr)));
			OutInstruct(15 downto 8)<=mem(to_integer(unsigned(addr))+1);
			OutInstruct(23 downto 16)<= mem(to_integer(unsigned(addr))+2);
			OutInstruct(31 downto 24)<=mem(to_integer(unsigned(addr))+3);
		--	end if;
	
--end process;

			
			-- Every four is one instruction
			-- mem(0)="00000001"
			-- mem(1)="00000010"
			-- mem(2)="00000001"
			-- mem(3)="00000010"
			
			--One instruction  Ori $t1,1
			 mem(0)<="00000001";
			 mem(1)<="00000000";
			 mem(2)<="00100001";
			 mem(3)<="00001000";
			 
			 --instruction two  Ori $t2,1
			 mem(4)<="00000001";
			 mem(5)<="00000000";
			 mem(6)<="01000010";
			 mem(7)<="00001000";

			 
			 -- instruction three sw $t1,zero
			 mem(8)<="00000000";
			 mem(9)<="00000000";
			 mem(10)<="10100001";
			 mem(11)<="00010000";
			 
			 -- instruction four sw $t2, one
			 mem(12)<="00000001";
			 mem(13)<="00000000";
			 mem(14)<="10100010";
			 mem(15)<="00010000";
			 
			 --instruction five lw $t3,zero
			 mem(16)<="00000000";
			 mem(17)<="00000000";
			 mem(18)<="10100000";
			 mem(19)<="00001100";
			 
			 --instruction six lw $t1,one
			 mem(20)<="00000001";
			 mem(21)<="00000000";
			 mem(22)<="10100001";
			 mem(23)<="00001100";

			 --instruction seven sub $t2,$t2,$t2
			 mem(24)<="00000000";
			 mem(25)<="00010000";
			 mem(26)<="01000010";
			 mem(27)<="00000100";
			 
			 --instruction eight add $t2,$t3,$t1
			 mem(28)<="00000000";
			 mem(29)<="00010000";
			 mem(30)<="00000001";
			 mem(31)<="00000000";
          
			 -- instruction nine beq $t2,$t2, -28
			 mem(32)<="11111001";
			 mem(33)<="11111111";
			 mem(34)<="01000010";
			 mem(35)<="00010100";

			 
			 
			 
end arch;