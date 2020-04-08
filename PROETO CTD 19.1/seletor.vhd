-- SELETOR DE NIVEL

library ieee;
use ieee.std_logic_1164.all;

entity seletor is
port(switch9 : in std_logic;
     E1,R1: 	in std_logic;
	  clock50:  in std_logic;
	  clock: 	out std_logic;
	  clock1hz: out std_logic
	  );
end seletor;

architecture seletor_de_nivel of seletor is
signal clk1,clk2: std_logic;

component div_freq is
	port (	clock: in std_logic;
				reset: in std_logic;
				C1Hz,C2Hz: out std_logic
			);
			
end component;

component mux is
port(A,B: std_logic;
     sel: in std_logic;
     Y: out std_logic
     );
end component;

begin
	
	DIVISOR_FREQ: div_freq port map (clock50, R1, clk1, clk2);
	MULTIPLEXADOR: mux port map(clk1, clk2, switch9, clock);
	clock1hz <= clk1;
	
end architecture;
	
	
	
	
	
	