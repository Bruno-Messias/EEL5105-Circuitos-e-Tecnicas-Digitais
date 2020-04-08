library ieee;
use ieee.std_logic_1164.all;

entity Datapath is
	port(
			Sw: in std_logic_vector(9 downto 0);
			end_time, sw_erro, wrong, end_game: out std_logic;			
			cont_time, cont_score, cont_round: in std_logic;		
			rst_time, rst_point, rst_round, rst_men: in std_logic;  
			reg_men, reg_nivel: in std_logic	
			);
	
end entity;

-----------------------Sinais do jogo--------------------------------------

--end_time 	= acabou o tempo o outro jogador ganha
--sw_erro 	= entrada invalida o outro jogador ganha
--wrong 		= o jogador errou a combinacao
--end_game 	= o jogador da rodada atual vence(bit menos sig das rodadas)

---------------------------------------------------------------------------

architecture blocos of Datapath is
																	--Divisor de Frequencia(2 niveis)
component div_freq is
	port (	clock: in std_logic;
				reset: in std_logic;
				C1Hz,C2Hz: out std_logic);
end component;
																	--Registrador nivel(1 bit)
component registrador_1bit is
	port( D: in std_logic;
			Q: out std_logic;
			clock,reset,en: in std_logic);
end component;
																	--Registrador memoria(3 bits)
component registrador_3bit is
	port( D: in std_logic_vector(2 downto 0);
			Q: out std_logic_vector(2 downto 0);
			clock,reset,en: in std_logic);
end component;
																	--Registrador sw(10 bits)
component registrador_10bit is
	port( D: in std_logic_vector(9 downto 0);
			Q: out std_logic_vector(9 downto 0);
			clock,reset,en: in std_logic);
end component;	
																	--Contador de tempo
component conta_time is
	port(	en,reset,clock: in std_logic;
			end_time: out std_logic;
			timer: out std_logic_vector(3 downto 0));
end component;			
																	--Contador de round
component conta_round is
	port(	en,reset,clock: in std_logic;
			round: out std_logic_vector(3 downto 0));
end component;
																	--Contador de pontos
component conta_ponto is
	port(	en,reset,clock: in std_logic;
			end_game: out std_logic;
			score: out std_logic_vector(3 downto 0));	
end component;
																	--Memoria
component ROM0 is
  port ( address : in std_logic_vector(2 downto 0);
         data : out std_logic_vector(9 downto 0) );
end component;
			
begin

end architecture;
