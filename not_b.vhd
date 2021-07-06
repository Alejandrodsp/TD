library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_b is
port(
  b :  in std_logic_vector(3 downto 0);  
  saida  : out std_logic_vector(3 downto 0)  
);
end not_b;
 
architecture arq_not_b of not_b is
begin  

saida <= not b;
 
end arq_not_b;