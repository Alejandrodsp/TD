LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;

ENTITY ULA IS
  PORT(
  a,b: in std_logic_vector(3 downto 0);
  controle: in std_logic_vector(2 downto 0);
  saida: out std_logic_vector(13 downto 0);
  v,n,z: out std_logic
  );
end ULA;

architecture arq_ULA of ULA is
signal fio1,fio2,fio3,fio4,fio5,fio6,fio7,fio8,saida_mux,saida_mult1,saida_mult2,saida_div1,saida_div2: std_logic_vector(3 downto 0);
signal overf: std_logic_vector(1 downto 0);
  COMPONENT somador
	PORT(
  a : in std_logic_vector(3 downto 0);  
  b :  in std_logic_vector(3 downto 0);  
  saida  : out std_logic_vector(3 downto 0);   
  overflow:  out std_logic   
	);
END COMPONENT;    
  COMPONENT subtrator
	PORT(
  a : in std_logic_vector(3 downto 0);  
  b :  in std_logic_vector(3 downto 0);  
  saida  : out std_logic_vector(3 downto 0);   
  overflow:  out std_logic   
	);
END COMPONENT;  
  COMPONENT multiplicador
	PORT(
 	a :in std_logic_vector(3 downto 0);
	saida:out std_logic_vector(3 downto 0) 
	);
END COMPONENT;      
 COMPONENT divisor
	PORT(
 	a :in std_logic_vector(3 downto 0);
	saida:out std_logic_vector(3 downto 0) 
	);
END COMPONENT;  
 COMPONENT not_b
	PORT(
   b :  in std_logic_vector(3 downto 0);  
  saida  : out std_logic_vector(3 downto 0)
	);
END COMPONENT;   
 COMPONENT not_a
	PORT(
   a :  in std_logic_vector(3 downto 0);  
  saida  : out std_logic_vector(3 downto 0)
	);
END COMPONENT;   
 COMPONENT a_and_b
	PORT(
  a : in std_logic_vector(3 downto 0);  
  b :  in std_logic_vector(3 downto 0);  
  saida  : out std_logic_vector(3 downto 0) 
	);
END COMPONENT;  
 COMPONENT a_or_b
	PORT(
  a : in std_logic_vector(3 downto 0);  
  b :  in std_logic_vector(3 downto 0);  
  saida  : out std_logic_vector(3 downto 0) 
	);
END COMPONENT;  
 COMPONENT seg14
	PORT(
  entrada: in std_logic_vector(3 downto 0);
  saida: out std_logic_vector(13 downto 0)
	);
END COMPONENT;  
begin
 soma: somador
    port map ( a => a, b => b, saida => fio1, overflow => overf(0));
 subtracao: subtrator
    port map ( a => a, b => b, saida => fio2, overflow => overf(1));	
 multiplicacao1: multiplicador
    port map ( a => a, saida => saida_mult1); 
 multiplicacao2: multiplicador
    port map ( a => saida_mult1, saida => saida_mult2); 
	 
	 WITH b SELECT
 fio3 <=
 saida_mult1 WHEN "0010",
 saida_mult2 WHEN "0100",
  "0000" WHEN OTHERS;
divisao1: divisor
    port map ( a => a, saida => saida_div1); 	
divisao2: divisor
    port map ( a => saida_div1, saida => saida_div2); 	
	 	 WITH b SELECT
 fio4 <=
 saida_div1 WHEN "0010",
 saida_div2 WHEN "0100",
  "0000" WHEN OTHERS;
notB: not_b
    port map ( b => b, saida => fio5); 
notA: not_a
    port map ( a => a, saida => fio6); 	
AandB: a_and_b
    port map ( a => a, b => b, saida => fio7);  
AorB: a_or_b
    port map ( a => a, b => b, saida => fio8);  
	 
	 WITH controle SELECT
 saida_mux <=
 fio1 WHEN "000",
 fio2 WHEN "001",
 fio3 WHEN "010",
 fio4 WHEN "011",
 fio5 WHEN "100",
 fio6 WHEN "101",
 fio7 WHEN "110",
 fio8 WHEN "111",
 "0000" WHEN OTHERS;
 
 selecao: seg14
    port map ( entrada => saida_mux, saida => saida);
	 v <= ((not(controle(0))) and (not(controle(1))) and (not(controle(2))) and overf(0)) or ((not(controle(0))) and (not(controle(1))) and ((controle(2))) and overf(1));
	 n <= saida_mux(3);
	 z <= not(saida_mux(0) or saida_mux(1)or saida_mux(2) or saida_mux(3));
end arq_ULA;