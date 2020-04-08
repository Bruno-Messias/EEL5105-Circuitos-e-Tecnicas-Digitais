library ieee;
use ieee.std_logic_1164.all;

entity BasesNum is
	port(
			Key: in std_logic_vector(3 downto 0);
			Sw: in std_logic_vector(9 downto 0);
			Clock_50: in std_logic;
			Ledr: out std_logic_vector(9 downto 0);
			Hex0, Hex1, Hex2, Hex3, Hex4, Hex5: out std_logic_vector(6 downto 0)
		);
end entity;

architecture topo of BasesNum is

	signal enter, reset:std_logic;
	signal end_time, sw_erro, wrong, end_game: std_logic;
	signal cont_time, cont_score, cont_round: std_logic;
	signal rst_time, rst_point, rst_round, rst_men: std_logic;
	signal reg_men, reg_nivel:std_logic;
	
	signal BTN2, BTN3: std_logic;

component controle is
	port(	enter, reset, clock: in std_logic;
			end_time, sw_erro, wrong, end_game: in std_logic;			
			cont_time, cont_score, cont_round: out std_logic;		
			rst_time, rst_point, rst_round, rst_men: out std_logic;  
			reg_men, reg_nivel: out std_logic);		
end component;

component ButtonSync is
	port(	KEY0, KEY1, KEY2, KEY3, CLK: in std_logic;
			BTN0, BTN1, BTN2, BTN3: out std_logic);
end component;

component Datapath is
	port(	Sw: in std_logic_vector(9 downto 0);
			end_time, sw_erro, wrong, end_game: out std_logic;			
			cont_time, cont_score, cont_round: in std_logic;		
			rst_time, rst_point, rst_round, rst_men: in std_logic;  
			reg_men, reg_nivel: in std_logic);
end component;

begin

ControL: controle port map		(	enter, reset, clock_50,
											end_time, sw_erro, wrong, end_game,			
											cont_time, cont_score, cont_round,		
											rst_time, rst_point, rst_round, rst_men,  
											reg_men, reg_nivel);
										
Button: ButtonSync port map 	(	sw(0), sw(1),'0','0',clock_50,
											reset, enter, BTN2, BTN3);
										
Data: Datapath port map 		(	Sw,
											end_time, sw_erro, wrong, end_game,			
											cont_time, cont_score, cont_round,		
											rst_time, rst_point, rst_round, rst_men,  
											reg_men, reg_nivel);

end architecture;

--end_game
--sw_erro
--wrong
--ganhador
--logica de troca de bases
--hexs e decods

------------------------ Mapa do Sw --------------------------------
--enter => sw(1)
--resize => sw(0)