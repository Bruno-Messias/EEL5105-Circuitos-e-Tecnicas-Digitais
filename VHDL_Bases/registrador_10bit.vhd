library ieee;
use ieee.std_logic_1164.all;

entity registrador_10bit is
	port( D: in std_logic_vector(9 downto 0);
			Q: out std_logic_vector(9 downto 0);
			clock,reset,en: in std_logic
			);
end entity;

architecture reg of registrador_10bit is

	begin
		P1: process(Clock, Reset, D, en)
			begin
				if reset = '1' then
					Q <= "0000000000";
				elsif clock'event and clock = '1'  and en = '1' then
					Q <= D;
				end if;
				
		end process;
		
end architecture;