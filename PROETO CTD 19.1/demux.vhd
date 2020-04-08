library ieee;
use ieee.Std_logic_1164.all;

entity demux is 
port(	sel: in std_logic_vector(3 downto 0);
		x,y,z,w,k: out std_logic
		);
		
end entity;

architecture demo of demux is
begin


x <= 	'1' when sel = "0001" else
				'0';
		
y <= 	'1' when sel = "0010"else
				'0';	
		
z <= 	'1' when sel = "0011" else 
				'0';
		
w <= 	'1' when sel = "0100" else
				'0';
		
k <= 	'1' when sel = "0101" else
				'0';

end architecture;