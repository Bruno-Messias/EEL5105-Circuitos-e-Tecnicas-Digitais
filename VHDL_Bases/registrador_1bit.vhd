library ieee;
use ieee.std_logic_1164.all;

entity registrador_1bit is
	port( D: in std_logic;
			Q: out std_logic;
			clock,reset,en: in std_logic
			);
end entity;

architecture reg1 of registrador_1bit is

	begin
		P1: process(Clock, Reset, D, en)
			begin
				if reset = '1' then
					Q <= '0';
				elsif clock'event and clock = '1' and en = '1' then
					Q <= D;
				end if;
				
		end process;
		
end architecture;