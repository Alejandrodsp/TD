LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY multiplicador IS
	PORT(
			a :in std_logic_vector(3 downto 0);
			saida:out std_logic_vector(3 downto 0)
			);
end multiplicador;

architecture arq_multiplicador of multiplicador is

COMPONENT mux2x1
	PORT(
		a: in std_logic_vector(1 downto 0);
		seletor: in std_logic;
		outx: out std_logic
	);
END COMPONENT;

begin
	mux1: mux2x1
		port map(a(0) => '0', a(1)=>a(0), seletor=>'1', outx=>saida(0));
	mux2: mux2x1
		port map(a(0) => a(0), a(1)=> a(1), seletor=>'1', outx=>saida(1));
	mux3: mux2x1
		port map(a(0) => a(1), a(1)=> a(2), seletor=>'1', outx=>saida(2));
	mux4: mux2x1
		port map(a(0) => a(2), a(1)=> a(3), seletor=>'1', outx=>saida(3));	

	
end arq_multiplicador;