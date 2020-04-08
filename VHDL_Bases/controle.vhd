library ieee;
use ieee.std_logic_1164.all;

entity Controle is
	port(
			enter, reset, clock: in std_logic;
			end_time, sw_erro, wrong, end_game: in std_logic;											--Finalizaçcoa de jogo 
			cont_time, cont_score, cont_round: out std_logic;											--Enables contaddores
			rst_time, rst_point, rst_round, rst_men, rst_nivel, rst_code: out std_logic;  	--Resets contadores
			reg_men, reg_nivel, reg_code: out std_logic													--Sinais aux
		);

---------------------------- Contadores e Registradores ------------------------------------

--Rst_men 		= reseta a escolha da memeoria(registrador 2 bits)
--Rst_nivel 	= reseta a escolha do nivel(registrador 1 bit)
--Rst_code 		= reset do registrador dos sw (registrador 10 bits)
--Rst_round 	= reseta a contagem de rounds
--Rst_time  	= reseta a contagem de tempo
--Rst_point 	= reseta a pontuacao
--Reg_men		= enable do registrador da memoria(registrador 2 bits)
--Reg_nivel 	= enable do registrador do nivel
--Reg_code		= enable do registrador dos sw(registrador 10 bits)
--cont_score	= enable da contagem de pontos
--cont_time 	= enable do contador de tempo
--cont_round 	= enable contador de rounds

---------------------------------------------------------------------------------------------



end entity;

architecture fsm of controle is
	type STATES is (Init, Setup, Game, Check, Cont_Point, Next_round, Result, Espera);
	signal EA, PE : STATES;
	
begin
	
	P1:process(clock,reset) 	--Logica prox estado
				begin	
					if reset = '1' then
						EA <= Init;
					elsif clock'event and clock = '1' then	-- rising_edge(clock);
						EA <= PE;
					end if;
	end process;

	P2:process(EA, enter, end_time, sw_erro, wrong)  -- Maquina de Estados
				begin 
					case EA is
					
						when Init =>
						
							rst_time    <= '1';
							rst_point   <= '1';
							rst_round <= '1';
							rst_men	   <= '1';
							rst_nivel   <= '1';
							rst_code		<= '1';
							cont_time   <= '0';
							cont_score  <= '0';
							cont_round  <= '0';
							reg_men 	   <= '0';
							reg_nivel 	<= '0';
							reg_code		<= '0';
							
							if enter = '0' then
								PE <= Setup;
							else
								PE <= Init;
							end if;
							
						when Setup =>
							
							rst_time    <= '0';
							rst_point   <= '0';
							rst_round 	<= '0';
							rst_men	   <= '0';
							rst_nivel   <= '0';
							rst_code		<= '0';
							cont_time   <= '0';
							cont_score  <= '0';
							cont_round  <= '0';
							reg_men 	   <= '1';
							reg_nivel 	<= '1';
							reg_code		<= '0';
							
							if enter = '0' then
								PE <= Game;
							else
								PE <= Setup;
							end if;
							
						when Game =>
							
							rst_time   	<= '0';
							rst_point  	<= '0';
							rst_round	<= '0';
							rst_nivel   <= '0';
							rst_code		<= '0';
							cont_time  	<= '1';
							cont_score 	<= '0';
							cont_round 	<= '0';
							reg_men    	<= '0';
							reg_nivel 	<= '0';
							reg_code		<= '1';
							
							if enter = '0' and sw_erro = '0' and end_time = '0' then
								PE <= Check;
							elsif sw_erro = '1' or end_time = '1' then
								PE <= Result;
							else 
								PE <= Game;
							end if;
							
						when Check =>
							
							rst_time    <= '0';
							rst_point   <= '0';
							rst_round 	<= '0';
							rst_men	   <= '0';
							rst_nivel   <= '0';
							rst_code		<= '0';
							cont_time   <= '0';
							cont_score  <= '0';
							cont_round  <= '0';
							reg_men 	   <= '0';
							reg_nivel 	<= '0';
							reg_code		<= '0';
							
							if wrong = '0' then
								PE <= Cont_Point;
							else	
								PE <= Next_round;
							end if;
							
						when Cont_Point =>
							
							rst_time    <= '0';
							rst_point   <= '0';
							rst_round	<= '0';
							rst_men	   <= '0';
							rst_nivel   <= '0';
							rst_code		<= '0';
							cont_time   <= '0';
							cont_score  <= '1';
							cont_round  <= '0';
							reg_men 	   <= '0';
							reg_nivel 	<= '0';
							reg_code		<= '0';
							
							if end_game = '1' then 
								PE <= Result;
							else
								PE <= Next_round;
							end if;
							
						when Next_round =>
							
							rst_time    <= '0';
							rst_point   <= '0';
							rst_round 	<= '0';
							rst_men	   <= '0';
							rst_nivel   <= '0';
							rst_code		<= '0';
							cont_time   <= '0';
							cont_score  <= '0';
							cont_round  <= '1';
							reg_men 	   <= '0';
							reg_nivel 	<= '0';
							reg_code		<= '0';
							 
							PE <= Espera;
						
						when Espera =>
							
							rst_time    <= '0';
							rst_point   <= '0';
							rst_round 	<= '0';
							rst_men	   <= '0';
							rst_nivel   <= '0';
							rst_code		<= '0';
							cont_time   <= '0';
							cont_score  <= '0';
							cont_round  <= '0';
							reg_men 	   <= '0';
							reg_nivel 	<= '0';
							reg_code		<= '0';
							
							if enter = '0' then
								PE <= Game;
							else 
								PE <= Espera;
							end if;
							
						when Result =>
							
							rst_time    <= '0';
							rst_point   <= '0';
							rst_round 	<= '0';
							rst_men	   <= '0';
							rst_nivel   <= '0';
							cont_time   <= '0';
							cont_score  <= '0';
							cont_round  <= '0';
							reg_men 	   <= '0';
							reg_nivel 	<= '0';
							reg_code		<= '0';
							
							if enter = '0' then
								PE <= Init;
							else 
								PE <= Result;
							end if;
							
					end case;
		end process;
end architecture;
						