-- REGISTRADOR 10

library ieee;
use ieee.std_logic_1164.all;

entity reg10 is
port(D10: in std_logic_vector(3 downto 0);
     k,RST10,clock: in std_logic;
	  Q10: out std_logic_vector(3 downto 0)
	 );
end reg10;

architecture registrador10 of reg10 is
	begin process(RST10,clock)
		begin
			if(RST10 = '1') then
				Q10 <= "0000"; -- zera o registrador 
			elsif(clock' event and clock = '1') then
				if(k = '1') then
					Q10 <= D10; 
				end if;
			end if;
		end process;
	end architecture;
				
		