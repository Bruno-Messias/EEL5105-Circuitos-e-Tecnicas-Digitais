-- MUX 2:1 de 7 bits

library ieee;
use ieee.std_logic_1164.all;

entity mux_7bit is
port(A,B: std_logic_vector(6 downto 0);
     sel: in std_logic;
     Y: out std_logic_vector(6 downto 0)
     );
end mux_7bit;

architecture multiplexador7 of mux_7bit is
begin
	Y <= A when sel = '0' else
	     B;
end architecture;