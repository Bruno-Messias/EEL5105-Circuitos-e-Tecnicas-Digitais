-- MUX 4:1 (7 bits)

library ieee;
use ieee.std_logic_1164.all;

entity mux4_1 is
port(A1,B1,C1,D1: std_logic_vector(6 downto 0);
     sel1: in std_logic_vector(1 downto 0);
     Y1: out std_logic_vector(6 downto 0)
     );
end mux4_1;

architecture multiplexador1 of mux4_1 is
begin
	Y1 <= A1 when sel1 = "00" else
	     B1 when sel1 = "01" else
		  C1 when sel1 = "10" else
		  D1;
end architecture;