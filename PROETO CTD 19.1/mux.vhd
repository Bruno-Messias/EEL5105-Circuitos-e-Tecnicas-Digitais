-- MUX 2:1

library ieee;
use ieee.std_logic_1164.all;

entity mux is
port(A,B: std_logic;
     sel: in std_logic;
     Y: out std_logic
     );
end mux;

architecture multiplexador of mux is
begin
	Y <= A when sel = '0' else
	     B;
end architecture;