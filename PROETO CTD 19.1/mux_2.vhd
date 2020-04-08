-- MUX 4:1

library ieee;
use ieee.std_logic_1164.all;

entity  is
port(A2,B2,C2,D2: std_logic_vector(6 downto 0);
     sel2: in std_logic_vector(1 downto 0);
     Y2: out std_logic_vector(6 downto 0)
     );
end mux_2;

architecture multiplexador2 of mux_2 is
begin
	Y2 <= A2 when sel2 = "00" else
	      B2 when sel2 = "01" else
		   C2 when sel2 = "10" else
		   D2;
end architecture;