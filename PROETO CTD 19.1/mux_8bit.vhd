-- datapath 2 : 1 (8 bits)

library ieee;
use ieee.std_logic_1164.all;

entity mux_8bit is
port(A,B: std_logic_vector(7 downto 0);
     sel: in std_logic;
     Y: out std_logic_vector(7 downto 0)
     );
end mux_8bit;

architecture multiplexador8 of mux_8bit is
begin
	Y <= A when sel = '0' else
	     B;
end architecture;