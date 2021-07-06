library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity a_and_b is
port(
  a : in std_logic_vector(3 downto 0);  
  b :  in std_logic_vector(3 downto 0);  
  saida  : out std_logic_vector(3 downto 0) 
);
end a_and_b;
 
architecture arq_a_and_b of a_and_b is
begin  
saida <= a and b;
 
 
end arq_a_and_b; 