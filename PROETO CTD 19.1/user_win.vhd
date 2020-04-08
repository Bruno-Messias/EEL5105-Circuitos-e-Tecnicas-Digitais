-- Comparador de magnitude 2 de 8 bits

library ieee;
 
use IEEE.std_logic_1164.all;
 
entity user_win is
port(Q11,Q12: in std_logic_vector(7 downto 0);
     Y: out std_logic 
	  );  
 
end user_win;
 
architecture winner of user_win is 
 
begin

Y <= '0' when (Q11 > Q12) else -- 0
	  '1';                      -- 1
 
end architecture;