LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY mux2x1 IS
	PORT (
		x: in std_logic_vector(1 downto 0);
		selector: in std_logic;
		outX: out std_logic
	);
END mux2x1;

architecture archMux2x1 of mux2x1 is
begin

outX <= (
	( x(0) and selector) or ( x(1) and not selector )
	);

end archMux2x1;