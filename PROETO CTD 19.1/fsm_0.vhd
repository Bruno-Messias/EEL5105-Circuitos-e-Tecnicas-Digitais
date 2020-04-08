-- FSM_0: NUMEROS GERADOS "ALEATORIAMENTE" EM HEXADECIMAL

library ieee;
use ieee.std_logic_1164.all;

entity fsm_0 is 
port(E3, clock: in std_logic;
	  Q: out std_logic_vector(3 downto 0)	  
     );
end fsm_0;

architecture fsm0 of fsm_0 is
	type STATES is (M1, M3, MA, M5, M9, ME, MC, M6, M2, MB);
	signal EAtual, PEstado: STATES;

	begin process(E3,clock)
		begin
			if(E3 = '1') then
				EAtual <= M1;
			elsif(clock' event and clock = '1') then
				EAtual <= PEstado;
			end if;
	end process;
	
	process(EAtual,E3)
		begin
			case EAtual is
			
				when M1 =>
				
				Q <= "0001"; -- 1
					
				when M3 =>
				
				Q <= "0011"; -- 3
				
				when MA =>
				
				Q <= "1010"; -- A
				
				when M5 =>
				
				Q <= "0101"; -- 5
				
				when M9 =>
				
				Q <= "1001"; -- 9
				
				when ME => 
				
				Q <= "1110"; -- E
				
				when MC =>
				
				Q <= "1100"; -- C
				
				when M6 =>
				
				Q <= "0110"; -- 6
				
				when M2 =>
				
				Q <= "0010"; -- 2
				
				when MB =>
				
				Q <= "1011"; -- B
				
			end case;
		end process;
end architecture;
				
		
				
	
	