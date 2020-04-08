-- FSM ROUNDS (5 ROUNDS)

library ieee;
use ieee.std_logic_1164.all;

entity rounds is 
port(E3,E4, clock: in std_logic; -- E3 HABILITA A FSM NO ESTADO "PLAY". E4 and E3 HABILITA A FSM NO ESTADO "NEXT_ROUND"
	  F: out std_logic_vector(3 downto 0);
	  end_rounds: out std_logic
	  
     );
end rounds;

architecture fsm_rounds of rounds is
	type STATES is (R1,R2,R3,R4,R5);
	signal EAtual, PEstado: STATES;

	begin process(E3,clock)
		begin
			if(E3 = '1') then
				EAtual <= R1;
			elsif(clock' event and clock = '1') then
				EAtual <= PEstado;
			end if;
	end process;
	
	process(EAtual,E3,E4)
		begin
			case EAtual is
				when R1 =>
				
				F <= "0001"; -- 1
				end_rounds <= '0';
				if(E3 = '1' and E4 = '1') then
					PEstado <= R2;
				else 
					PEstado <= R1;
				end if;
					

				when R2 =>
				
				F <= "0010"; -- 2
				end_rounds <= '0';
				if(E3 = '1' and E4 = '1') then
					PEstado <= R3;
				else 
					PEstado <= R2;
				end if;
				
				when R3 =>
				
				F <= "0011"; -- 3 
				end_rounds <= '0';
				if(E3 = '1' and E4 = '1') then
					PEstado <= R4;
				else 
					PEstado <= R3;
				end if;
				
				when R4 =>
				
				F <= "0100"; -- 4
				end_rounds <= '0';
				if(E3 = '1' and E4 = '1') then
					PEstado <= R5;
				else 
					PEstado <= R4;
				end if;
				
				when R5 =>
				
				F <= "0101"; -- 5
				end_rounds <= '1';
				if(E3 = '1' and E4 = '1') then
					PEstado <= R1;
				else 
					PEstado <= R5;		
				end if;
			end case;
		end process;
end architecture;
				
		
				
	
	