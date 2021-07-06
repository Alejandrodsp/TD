LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY shifterL IS
	PORT(
			x :in std_logic_vector(3 downto 0);
			OutA :out std_logic_vector(3 downto 0)
			);
end shifterL;

architecture archShifterL of shifterL is

COMPONENT mux2x1
	PORT(
		x: in std_logic_vector(1 downto 0);
		selector: in std_logic;
		outX: out std_logic
	);
END COMPONENT;

begin
	mux1: mux2x1
		port map(x(0) => '0', x(1)=>x(0), selector=>'1', outX=>OutA(0));
	mux2: mux2x1
		port map(x(0) => x(0), x(1)=> x(1), selector=>'1', outX=>OutA(1));
	mux3: mux2x1
		port map(x(0) => x(1), x(1)=> x(2), selector=>'1', outX=>OutA(2));
	mux4: mux2x1
		port map(x(0) => x(2), x(1)=> x(3), selector=>'1', outX=>OutA(3));
		
		
end archShifterL;