-- Topo

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity topo is
port(SW: in std_logic_vector(9 downto 0);
     KEY:  in std_logic_vector(3 downto 0);
	  CLOCK_50: in std_logic;
	  LEDR: out std_logic_vector(9 downto 0);
	  HEX5,HEX4,HEX3,HEX2,HEX1,HEX0: out std_logic_vector(6 downto 0)
	   );
end entity;

architecture top of topo is
signal end_time, user, contamax_e, sw_error, R1, R2, E1, E2, E3, E4, E5, E6, rst_e, J1, J0: std_logic;
signal sel: std_logic_vector(1 downto 0);

-- Controle:

component fsm_controle is
port(reset, clock, enter, end_time, contmax_e, sw_error: in std_logic;
     R1, R2, E1, E2, E3, E4, E5,E6, rst_e: out std_logic;
	  sel: out std_logic_vector(1 downto 0)
     );
end component;


-- Datapath: 

component datapath is
port(R1,R2,E1,E2,E3,E4,E5,E6,switch8,switch9,clock,enter: in std_logic;
	  sel: std_logic_vector(1 downto 0);
	  end_time,contamax_e, sw_error: out std_logic;
	  Y1,Y2,Y3,Y4,Y5,Y6,Y8,Y9: out std_logic_vector(6 downto 0);
	  Y7: out std_logic_vector(7 downto 0)
	  );
end component;

-- ButtonSync:

component ButtonSync is
	port
	(
		KEY0, KEY1, KEY2, KEY3, CLK: in std_logic;
		BTN0, BTN1, BTN2, BTN3: out std_logic
	);
end component;

begin

DAT4PATH: datapath port map(R1,R2,E1,E2,E3,E4,E5,E6,SW(8),SW(9),CLOCK_50,J1,sel,end_time,contamax_e, sw_error,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0,HEX4,HEX0,LEDR(7 downto 0));

CONTROLE: fsm_controle port map (J0, CLOCK_50, J1, end_time, contamax_e, sw_error,R1, R2, E1, E2, E3, E4, E5,E6, rst_e,sel);

BUTTON_SYNC: buttonSync port map (KEY(0), KEY(1), KEY(2), KEY(3), CLoCK_50, J0, J1);

end architecture;
