-- SOMADOR

library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity somador is
port(A,B,C,D,E: in std_logic_vector(7 downto 0);
	  S: out std_logic_vector(7 downto 0)
	  );
end somador;

architecture sum of somador is
begin

	S <= ((((A + B) + C) + D) + E);
	
end architecture;
	  