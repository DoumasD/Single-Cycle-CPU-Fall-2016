-- Moduler Code ACCUMULATER for PC register
Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;


entity Accadder is
port(
input, incrementor: in std_logic_vector(31 downto 0);
output: out std_logic_vector(31 downto 0)
);
end Accadder;

architecture arch of Accadder is
begin
output<= input + incrementor ;


end arch;