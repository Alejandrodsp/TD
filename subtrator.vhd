library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subtrator is
port(
  a : in std_logic_vector(3 downto 0);  
  b :  in std_logic_vector(3 downto 0);  
  saida  : out std_logic_vector(3 downto 0);   
  overflow:  out std_logic   
);
end subtrator;
 
architecture arq_subtrator of subtrator is
  signal c0,c1,c2,c3: std_logic := '0';
  signal b_not,fio: std_logic_vector(3 downto 0);
    COMPONENT somador
	PORT(
  a : in std_logic_vector(3 downto 0);  
  b :  in std_logic_vector(3 downto 0);  
  saida  : out std_logic_vector(3 downto 0);   
  overflow:  out std_logic   
	);
	END COMPONENT; 
begin  
  b_not <= not b;
  soma1: somador
    port map ( a => b_not, b => "0001", saida => fio);
 somaab: somador
    port map ( a => a, b => fio, saida => saida, overflow=>overflow);
 
 
end arq_subtrator;