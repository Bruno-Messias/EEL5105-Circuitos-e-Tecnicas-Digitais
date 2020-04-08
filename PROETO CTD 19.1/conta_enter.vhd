library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity conta_enter is
	port(	en,reset,clock,enter: in std_logic;
			contmax_e: out std_logic;
			cont_e: out std_logic_vector(3 downto 0)
			);
			
end entity;

architecture contador of conta_enter is

	signal conta: std_logic_vector(3 downto 0);
	
	begin

		P1:process(en, reset, clock,enter)
			begin
			
				if reset = '0' then
					conta <= "0000";
				elsif clock'event and clock = '1' and en = '1' then
					if enter = '0' then 
						conta <= conta + '1';
					end if;
					if conta = "0110" then				--Contagem maxima 6
						contmax_e <= '1';
					else
						contmax_e <= '0';
					end if;
				end if;
		end process;
		
		cont_e <= conta;
		
end architecture;