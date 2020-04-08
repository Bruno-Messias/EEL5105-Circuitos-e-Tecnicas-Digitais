-- DATAPATH

library ieee;
use ieee.std_logic_1164.all;

entity datapath is
port(R1,R2,E1,E2,E3,E4,E5,E6,switch8,switch9,clock,enter: in std_logic;
	  sel: std_logic_vector(1 downto 0);
	  end_time,contamax_e, sw_error: out std_logic;
	  Y1,Y2,Y3,Y4,Y5,Y6,Y8,Y9: out std_logic_vector(6 downto 0);
	  Y7: out std_logic_vector(7 downto 0)
	  );
end entity;

architecture data of datapath is
signal S2,S3,S4,S5,S6,S7,S12,S19: std_logic_vector(3 downto 0);
signal s1,S11,S24,clk1Hz,x,y,z,w,k,S0: std_logic;
signal S8,S9,S10: std_logic_vector(7 downto 0);
signal S16,S18,S23,S14,S20,S22: std_logic_vector(6 downto 0);
signal Y0: std_logic_vector(9 downto 0);

-- seletor de nivel

component seletor is
port(switch9 : in std_logic;
     E1,R1: 	in std_logic;
	  clock50:  in std_logic;
	  clock: 	out std_logic
	  );
end component;

-- seletor de jogador

component cont_player is
	port(	en,clock,rst: in std_logic;
			user: out std_logic
			);
			
end component;

-- decodificador 6

component dec6 is
port(A: in std_logic_vector(3 downto 0);
	  B: out std_logic_vector(6 downto 0)
    );
end component;

-- contador de enter

component conta_enter is
	port(	en,reset,clock,enter: in std_logic;
			contmax_e: out std_logic;
			cont_e: out std_logic_vector(3 downto 0)
			);
			
end component;

-- demux

component demux is 
port(	sel: in std_logic_vector(3 downto 0);
		x,y,z,w,k: out std_logic
		);
		
end component;

-- fsm time

component fsm_time is
port(E3,clk1,R1: in std_logic;
	  end_time: out std_logic;
	  led: out std_logic_vector(9 downto 0)
    );
end component;

-- fsm hexadecimal aleatorio

component fsm_0 is 
port(E3, clock: in std_logic;
	  Q: out std_logic_vector(3 downto 0)	  
     );
end component;

-- decoficador hexadecimal aleatorio

component decod7seg is
port (X: in std_logic_vector(3 downto 0);
      Y: out std_logic_vector(6 downto 0)
     );
end component;

-- registrador

component reg10 is
port(D10: in std_logic_vector(3 downto 0);
     k,RST10,clock: in std_logic;
	  Q10: out std_logic_vector(3 downto 0)
	 );
end component;

-- somador

component somador is
port(A,B,C,D,E: in std_logic_vector(7 downto 0);
	  S: out std_logic_vector(7 downto 0)
	  );
end component;

-- comparador de magnitude

component comp_magn is
port(A,B: in std_logic_vector(7 downto 0); -- B deve ser igual a 29 no top ("00011101")
     maior, menor, igual: out std_logic --declaração de variaveis de saida
	  );  
 
end component;

-- mux 2:1 (8 bits)

component mux_8bit is
port(A,B: std_logic_vector(7 downto 0);
     sel: in std_logic;
     Y: out std_logic_vector(7 downto 0)
     );
end component;

-- user win

component user_win is
port(Q11,Q12: in std_logic_vector(7 downto 0);
     Y: out std_logic -- declaração de variaveis de saida
	  );  
 
end component;

-- mux 4:1 de 7 bits 

component mux4_1 is
port(A1,B1,C1,D1: std_logic_vector(6 downto 0);
     sel1: in std_logic_vector(1 downto 0);
     Y1: out std_logic_vector(6 downto 0)
     );
end component;

-- mux 2:1 de 7 bits

component mux_7bit is
port(A,B: std_logic_vector(6 downto 0);
     sel: in std_logic;
     Y: out std_logic_vector(6 downto 0)
     );
end component;

component reg_8bit is
port(D8: in std_logic_vector(7 downto 0);
     En,RST8,clock: in std_logic;
	  Q8: out std_logic_vector(7 downto 0)
	 );
end component;

begin

Seletor_de_nivel: seletor port map(switch9,E1,R1,clock,S1);
Contador_player: cont_player port map (R2,clock,R1,S24);
Decodificador6: dec6 port map (("000" & S24),Y8);
Tempo: fsm_time port map(E3,clk1Hz,R1,end_time,Y0);
Contador_enter: conta_enter port map (E3,R1,clock,enter,contamax_e,S12);
Demultiplexador: demux port map (S12,x,y,z,w,k);
Randon_hexa: fsm_0 port map (E3,S1,S2);
Decodificador7: decod7seg port map (S2,Y9);
Registrador6: reg10 port map (S2,x,R1,clock,S3);
Registrador7: reg10 port map (S2,y,R1,clock,S4);
Registrador8: reg10 port map (S2,z,R1,clock,S5);
Registrador9: reg10 port map (S2,w,R1,clock,S6);
Registrador10: reg10 port map (S2,k,R1,clock,S7);
Somador_8bit: somador port map ("0000" & S3,"0000" & S4,"0000" & S5,"0000" & S6,"0000" & S7,S8);
Registrador11: reg_8bit port map (S8,R2,R1,clock,S9);
Registrador12: reg_8bit port map (S8,E6,R1,clock,S10);
Multiplexador0: mux_8bit port map (S9,S10,switch8,Y7);
Comp_magnitude: comp_magn port map (S8, "00011101",sw_error);
Multiplexador1: mux4_1 port map ("0010010","1000111","0001100","1000001",sel,Y1); 
Decodificador0: decod7seg port map ("000" & S24,S14);
Multiplexador2: mux4_1 port map ("0000111","0000110",S14,"0010010",sel,Y2);
Multiplexador3: mux4_1 port map ("0100000","1100011","1111111","0000110",sel,Y3);
Multiplexador4: mux4_1 port map ("0101111","0000110","1111111","0101111",sel,Y4);
Multiplexador5: mux4_1 port map ("0000111","1000111","1111111","1111111",sel,Y5);
Decodificador1: decod7seg port map ("000" & switch9,S16);
Decodificador2: decod7seg port map (S2,S18);
Decodificador3: decod7seg port map ("0000",S20);
Decodificador4: decod7seg port map ("0001",S22);
Multiplexador7: mux_7bit port map (S20,S22,S0,S23);
Winner_user: user_win port map (S9,S10,S0);
Multiplexador6: mux4_1 port map ("1111111",S16,S18,S23,sel,Y6);

end architecture;


















