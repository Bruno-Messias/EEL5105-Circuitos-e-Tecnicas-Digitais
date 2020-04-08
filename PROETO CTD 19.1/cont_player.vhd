-- IDENTIFICADOR DE PLAYER: SAIDA = "0000" (PLAYER 0); SAIDA = "0001" (PLAYER 1)

library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity cont_player is
	port(	en,clock,rst: in std_logic;
			user: out std_logic
			);
			
end entity;

architecture cont of cont_player is

	signal conta: std_logic;
	
	begin

		P1:process(en, rst, clock)
			begin
			
				if rst = '0' then
					
					conta <= '0';
					
				elsif clock'event and clock = '1' and en = '1' then
						
						conta <= '1';

				end if;
		end process;
		
		user <= conta;
		
end architecture;