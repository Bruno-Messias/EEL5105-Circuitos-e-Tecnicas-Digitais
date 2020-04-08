library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity deslocador is
port(E3,clk1,R1: in std_logic;
	  end_time: out std_logic;
	  led: out std_logic_vector(9 downto 0)
    );
end entity;

architecture desloca of deslocador is
signal ledr: std_logic_vector(9 downto 0);
begin

process(E3,clk1)
		begin
			if(R1 = '1') then
				ledr <= "1111111111";
			elsif(clk1'event and clk1 = '1' and E3 = '1') then
			
				ledr <= ledr(9 downto 1) & '0';
				
				if ledr = "0000000000" then
					end_time <= '1';
				end if;
				
			end if;
	end process;
	
	led <= ledr;
	
end architecture;