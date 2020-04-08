-- CRONOMETRO (1 ATÉ 10 NOS LEDS)

 library ieee;
use ieee.std_logic_1164.all; 

entity fsm_time is
port(E3,clk1,R1: in std_logic;
	  end_time: out std_logic;
	  led: out std_logic_vector(9 downto 0)
    );
end fsm_time;

architecture fsm of fsm_time is
	type states is (T1,T2,T3,T4,T5,T6,T7,T8,T9,T10);
	signal EAtual, PEstado: STATES;
	
	begin 
	
P0: process(E3,clk1,R1)
		begin
			if(R1 = '1') then
				EAtual <= T1;
			elsif(clk1'event and clk1 = '1' and E3 = '1') then
				EAtual <= PEstado;
			end if;
	end process;
	
P1: process(EAtual)
		begin
			case EAtual is
			
				when T1 =>
					end_time <= '0';
					led <= "1111111111";
					PEstado <= T2;
				
				when T2 =>
					end_time <= '0';
					led <= "1111111110";
					PEstado <= T3;
					
				when T3 =>
					end_time <= '0';
					led <= "1111111100";
					PEstado <= T4;
				
				when T4 =>
					end_time <= '0';
					led <= "1111111000";
					PEstado <= T5;
				
				when T5 =>
					end_time <= '0';
					led <= "1111110000";
					PEstado <= T6;
					
				when T6 =>
					end_time <= '0';
					led <= "1111100000";
					PEstado <= T7;
				
				when T7 =>
					end_time <= '0';
					led <= "1111000000";
					PEstado <= T8;
					
				when T8 =>
					end_time <= '0';
					led <= "1110000000";
					PEstado <= T9;
					
				when T9 =>
					end_time <= '0';
					led <= "1100000000";
					PEstado <= T10;
					
				when T10 =>
					end_time <= '1';
					led <= "1000000000";
					
				end case;
			end process;
			
end architecture;