library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somador is
port(
  a : in std_logic_vector(3 downto 0);  
  b :  in std_logic_vector(3 downto 0);  
  saida  : out std_logic_vector(3 downto 0);   
  overflow:  out std_logic   
);
end somador;
 
architecture arq_somador of somador is
  signal c0,c1,c2,c3 : std_logic := '0';
begin  
 
 saida(0) <= a(0) xor b(0);  
  c0 <= a(0) and b(0);          
 
  saida(1) <= a(1) xor b(1) xor c0;
  c1 <= (a(1) and b(1)) or (a(1) and c0) or (b(1) and c0);
 
  saida(2) <= a(2) xor b(2) xor c1;
  c2 <= (a(2) and b(2)) or (a(2) and c1) or (b(2) and c1);
 
  saida(3) <= a(3) xor b(3) xor c2;
  c3 <= (a(3) and b(3)) or (a(3) and c2) or (b(3) and c2);
 
  overflow <= c2 xor c3;
 
end arq_somador;