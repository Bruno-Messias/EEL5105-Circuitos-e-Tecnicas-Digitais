-- registrador de 8 bits

library ieee;
use ieee.std_logic_1164.all;

entity reg_8bit is
port(D8: in std_logic_vector(7 downto 0);
     En,RST8,clock: in std_logic;
	  Q8: out std_logic_vector(7 downto 0)
	 );
end reg_8bit;

architecture registrador8 of reg_8bit is
	begin process(RST8,clock,En)
		begin
			if(RST8 = '1') then
				Q8 <= "0000"; -- zera o registrador 
			elsif(clock' event and clock = '1') then
				if(En = '1') then
					Q8 <= D8; 
				end if;
			end if;
		end process;
	end architecture;