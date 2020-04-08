-- DECODIFICADOR 6

 library ieee;
use ieee.std_logic_1164.all;

entity dec6 is
port(A: in std_logic_vector(3 downto 0);
	  B: out std_logic_vector(6 downto 0)
    );
end dec6;

architecture decodificador6 of dec6 is
begin

	B <= "0000110" when A = "0001" else -- 1
		  "0100100" when A = "0010" else -- 2 
		  "0110000" when A = "0011" else -- 3
		  "0011001" when A = "0100" else -- 4
		  "0010010";                     -- 5
		  
end architecture;