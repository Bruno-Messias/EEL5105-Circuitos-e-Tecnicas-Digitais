library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity conta_time is
	port(	en,reset,clock: in std_logic;
			end_time: out std_logic;
			timer: out std_logic_vector(3 downto 0)
			);
			
end entity;

architecture contador of conta_time is

	signal conta: std_logic_vector(3 downto 0);
	
	begin

		P1:process(en, reset, clock)
			begin
			
				if reset = '1' then
					conta <= "0000";
				elsif clock'event and clock = '1' and en = '1' then
					conta <= conta + '1';
					if conta = "1010" then				--Contagem maxima 10
						end_time <= '1';
					end if;
				end if;
		end process;
		
		timer <= conta;
		
end architecture;