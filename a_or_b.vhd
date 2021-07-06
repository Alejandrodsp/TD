library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity a_or_b is
port(
  a : in std_logic_vector(3 downto 0);  
  b :  in std_logic_vector(3 downto 0);  
  saida  : out std_logic_vector(3 downto 0) 
);
end a_or_b;
 
architecture arq_a_or_b of a_or_b is
begin  
saida <= a or b;
 
 
end arq_a_or_b; 