library IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all;
USE IEEE.std_logic_unsigned.all;

entity Contador4Bits is
    PORT (
        clock, clear, load, sentido, hold: in  std_logic;
        partida  : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
        saida: out STD_LOGIC_VECTOR(13 DOWNTO 0)
    );
end Contador4Bits;
 
architecture arq_contador_seg of Contador4Bits is
signal fio: std_logic_vector(3 downto 0);

COMPONENT contador IS
  PORT(
		  clock, clear, load, sentido, hold: in  std_logic;
        partida  : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
        cont_out: out STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END COMPONENT;

COMPONENT seg14 IS
  PORT(
  entrada: in std_logic_vector(3 downto 0);
  saida: out std_logic_vector(13 downto 0)
  );
END COMPONENT;

begin 

  Contador_4BITS: contador
    port map ( clock => clock, clear => clear, load => load, sentido => sentido, hold => hold, partida => partida, cont_out => fio);
    
  Display: seg14
    port map (entrada => fio, saida => saida);
           
end arq_contador_seg;


