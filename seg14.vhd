LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;

ENTITY seg14 IS
  PORT(
  entrada: in std_logic_vector(3 downto 0);
  saida: out std_logic_vector(13 downto 0)
  );
end seg14;

architecture arq_seg14 of seg14 is
begin 
  with entrada select
  
  saida <= "10000001000000" when "0000",
       "10000001111001" when "0001",
       "10000000100100" when "0010",
       "10000000110000" when "0011",
       "10000000011001" when "0100",
       "10000000010010" when "0101",
       "10000000000010" when "0110",
       "10000001111000" when "0111",
       "01111110000000" when "1000",
       "01111111111000" when "1001", 
       "01111110000010" when "1010", 
		 "01111110010010" when "1011", 
		 "01111110011001" when "1100", 
       "01111110110000" when "1101", 
       "01111110100100" when "1110", 	
		 "01111111111001" when "1111", 
       "01100000001000" when others;       
end arq_seg14;

-- 