library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity div_freq is
	port (	clock: in std_logic;
				reset: in std_logic;--Prescisa de reset?
				C1Hz,C2Hz: out std_logic
			);
			
end entity;

architecture divisor of div_freq is
	signal contador1, contador2: std_logic_vector(27 downto 0); -- Registra valor da contagem cont1 = C1Hz; cont2 = C2Hz
	
	begin
		P1: process(clock, reset, contador1,contador2)
		
			begin
			
			 if reset= '0' then
				contador1 <= x"0000000";
				contador2 <= x"0000000";
			 elsif clock'event and clock= '1' then
			 
				contador1 <= contador1 + 1;
				contador2 <= contador2 + 1;
				
				if contador1 = x"2FAF07F" then
					contador1 <= x"0000000";
					C1Hz <= '1';
				else
					C1Hz <= '0';
				end if;
				
				if contador2 = x"17D783f" then
					contador2 <= x"0000000";
					C2Hz <= '1';
				else
					C2Hz <= '0';
				end if;
				
			 end if;
			 
		end process;
			
end architecture;