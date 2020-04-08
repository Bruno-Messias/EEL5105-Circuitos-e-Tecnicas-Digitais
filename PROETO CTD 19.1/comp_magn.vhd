-- Comparador de magnitude de 8 bits

library ieee;
use IEEE.std_logic_1164.all;
 
entity comp_magn is
port(A,B: in std_logic_vector(7 downto 0); -- B deve ser igual a 29 no topo ("00011101")
     maior, menor, igual: out std_logic --declaração de variaveis de saida
	  );  
 
end entity;
 
architecture comparador of comp_magn is 
 
begin
maior <= '1' when (A>B) else  -- A > B (SW_ERROR) 
			'0';
menor <= '1' when (A<B) else -- A < B 
			'0'; 
igual <= '1' when (A=B) else -- A = B 
			'0'; 
 
end architecture;