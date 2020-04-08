-- BLOCO DE CONTROLE 2019/1

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity fsm_controle is
port(reset, clock, enter, end_time, contmax_e, sw_error: in std_logic;
     R1, R2, E1, E2, E3, E4, E5,E6, rst_e: out std_logic;
	  sel: out std_logic_vector(1 downto 0)
     );
end fsm_controle; 

architecture controle of fsm_controle is
	type STATES is (start, setup, play, check, next_player, result);
	signal EAtual, PEstado: STATES;
	
	begin process(reset, clock) -- REGISTRADORES
		begin
			if(reset = '0') then
				EAtual <= start;
			elsif(clock' event and clock = '1') then
				EAtual <= PEstado;
			end if;
	end process;
	
process(EAtual, enter, end_time, contmax_e, sw_error) -- LÓGICA COMBINACIONAL
begin
	case EAtual is
	when start =>
		R1 <= '1';
		R2 <= '0';
		E1 <= '0';
		E2 <= '0';
		E3 <= '0';
		E4 <= '0';
		E5 <= '0';
		E6 <= '0';
		rst_e <= '0';
		sel <= "00";
		if(enter = '0') then
			PEstado <= setup;
		else
			PEstado <= start;
		end if;
		
	when setup =>
		R1 <= '0';
		R2 <= '0';
		E1 <= '1';
		E2 <= '0';
		E3 <= '0';
		E4 <= '1';
		E5 <= '0';
		E6 <= '0';
		rst_e <= '0';
		sel <= "01";
		if(enter = '0')  then
			PEstado <= play;
		else
			PEstado <= setup;
		end if;
		
	when play =>
		R1 <= '0';
		R2 <= '0';
		E1 <= '0';
		E2 <= '0';
		E3 <= '1';
		E4 <= '1';
		E5 <= '0';
		E6 <= '0';
		rst_e <= '0';
		sel <= "10";
		if((enter = '0') and (end_time = '0')) then
			PEstado <= check;
		elsif(end_time = '1') and (contmax_e = '1') then
			PEstado <= result;
		else
			PEstado <= play;
		end if;
	
	when check =>
		R1 <= '0';
		R2 <= '0';
		E1 <= '0';
		E2 <= '1';
		E3 <= '0';
		E4 <= '1';
		E5 <= '0';
		E6 <= '0';
		rst_e <= '1';
		sel <= "11";
		rst_e <= '1';
		if((contmax_e = '1') or (sw_error = '1')) then
			PEstado <= result;
		elsif((contmax_e = '0') and (sw_error = '0')) then
			PEstado <= next_player;
		else
			PEstado <= check;
		end if;
	
	when next_player =>
		R1 <= '0';
		R2 <= '1';
		E1 <= '0';
		E2 <= '0';
		E3 <= '1';
		E4 <= '1';
		E5 <= '0';
		E6 <= '0';
		rst_e <= '0';
		sel <= "11";
		if(enter = '0') then
			PEstado <= play;
		else
			PEstado <= next_player;
		end if;
	
	when result =>
		R1 <= '0';
		R2 <= '1';
		E1 <= '0';
		E2 <= '0';
		E3 <= '0';
		E4 <= '1';
		E5 <= '0';
		E6 <= '1';
		rst_e <= '0';
		sel <= "11";
		if(enter = '0') then
			PEstado <= start;
		else
			PEstado <= result;
		end if;
	end case;
end process;
end architecture;

		
		
		
		
		
		
		
		
		
		
		
			