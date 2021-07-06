library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_a is
port(
  a :  in std_logic_vector(3 downto 0);  
  saida  : out std_logic_vector(3 downto 0)
);
end not_a;
 
architecture arq_not_a of not_a is
begin  

saida <= not a;
 
end arq_not_a;