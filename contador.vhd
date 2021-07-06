library IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all;
USE IEEE.std_logic_unsigned.all;

entity contador is
    PORT (
        clock, clear, load, sentido, hold    : in  std_logic;
        partida  : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
        cont_out: out STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
end contador;
 
architecture arq_contador of contador is
    signal cont: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
begin
    proceso_contador: process (load, clear, clock, partida, hold, sentido) begin
        if clear = '1' then
            cont <= "0000";
        elsif load = '1' then
            cont <= partida;
		  elsif 	hold = '1' then
		  cont <= cont;
        elsif clock'event and clock = '1' then
			if sentido = '0' then
            cont <= cont + 1;
			elsif sentido = '1' then
				cont <= cont - 1;
				end if;
        end if;
    end process;
 
    cont_out <= cont;
end arq_contador;