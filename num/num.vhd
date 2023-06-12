library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity num is
port(    sw:in std_logic;
         seg0,seg1,seg2:out std_logic_vector(0 to 7));
end num ;

architecture a of num is
begin
	Process(sw)
	begin
		if(sw='1')then
			seg2<="00100101";
			seg1<="10011001";--4
			seg0<="00011001";--9
		else 
			seg2<="00000000";
			seg0<="11111111";
			seg1<="11111111";
		end if;
	end process;
end a;