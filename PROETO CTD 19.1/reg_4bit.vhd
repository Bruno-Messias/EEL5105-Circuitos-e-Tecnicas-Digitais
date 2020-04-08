-- REGISTRADOR 7

library ieee;
use ieee.std_logic_1164.all;

entity reg_4bit is
port(D4: in std_logic_vector(3 downto 0);
     y,RST4,clock: in std_logic;
	  Q4: out std_logic_vector(3 downto 0)
	 );
end entity;

architecture registrador4 of reg_4bit is
	begin process(RST4,clock)
		begin
			if(RST4 = '1') then
				Q4 <= "0000"; -- zera o registrador 
			elsif(clock' event and clock = '1') then
				if(y = '1') then
					Q4 <= D4; 
				end if;
			end if;
		end process;
	end architecture;
				
		