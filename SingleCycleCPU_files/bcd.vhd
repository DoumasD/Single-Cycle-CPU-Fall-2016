Library ieee;
use ieee.std_logic_1164.all;

entity bcd is 
	port(
		binary : in std_logic_vector(7 downto 0);
		bcd1 : out std_logic_vector(6 downto 0);
		bcd2 : out std_logic_vector(6 downto 0) );
end bcd;

architecture arch_bb of bcd is
begin
	process(binary)
	begin
		case binary(3 downto 0) is
			when "0000" =>
				bcd1 <= "1000000";
			when "0001" =>
				bcd1 <= "1111001";
			when "0010" =>
				bcd1 <= "0100100";
			when "0011" =>
				bcd1 <= "0110000";
			when "0100" =>
				bcd1 <= "0011001";	
			when "0101" =>
				bcd1 <= "0010010";				
			when "0110" =>
				bcd1 <= "0000010";				
			when "0111" =>
				bcd1 <= "1111000";				
			when "1000" =>
				bcd1 <= "0000000";				
			when "1001" =>
				bcd1 <= "0011000";				
			when "1010" =>
				bcd1 <= "0001000";				
			when "1011" =>
				bcd1 <= "0000011";				
			when "1100" =>
				bcd1 <= "1000110";				
			when "1101" =>
				bcd1 <= "0100001";				
			when "1110" =>
				bcd1 <= "0000110";				
			when "1111" =>
				bcd1 <= "0001110";	
		end case;
		case binary(7 downto 4) is
			when "0000" =>
				bcd2 <= "1000000";
			when "0001" =>
				bcd2 <= "1111001";
			when "0010" =>
				bcd2 <= "0100100";
			when "0011" =>
				bcd2 <= "0110000";
			when "0100" =>
				bcd2 <= "0011001";	
			when "0101" =>
				bcd2 <= "0010010";				
			when "0110" =>
				bcd2 <= "0000010";				
			when "0111" =>
				bcd2 <= "1111000";				
			when "1000" =>
				bcd2 <= "0000000";				
			when "1001" =>
				bcd2 <= "0011000";				
			when "1010" =>
				bcd2 <= "0001000";				
			when "1011" =>
				bcd2 <= "0000011";				
			when "1100" =>
				bcd2 <= "1000110";				
			when "1101" =>
				bcd2 <= "0100001";				
			when "1110" =>
				bcd2 <= "0000110";				
			when "1111" =>
				bcd2 <= "0001110";	
		end case;
	end process;
end arch_bb;
		