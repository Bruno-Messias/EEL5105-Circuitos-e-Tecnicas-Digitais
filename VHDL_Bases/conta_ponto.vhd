library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity conta_ponto is
	port(	en,reset,clock: in std_logic;
			end_game: out std_logic;
			score: out std_logic_vector(3 downto 0)
			);
			
end entity;

architecture contador of conta_ponto is

	signal conta: std_logic_vector(3 downto 0);
	
	begin

		P1:process(en, reset, clock)
			begin
			
				if reset = '1' then
					conta <= "0000";
				elsif clock'event and clock = '1' and en = '1' then
					conta <= conta + '1';
					if conta = "0101" then				--Contagem maxima 5
						end_game <= '1';
					end if;
				end if;
		end process;
		
		score <= conta;
		
end architecture;