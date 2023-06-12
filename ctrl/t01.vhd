library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity t01 is 
    port(sw:in std_logic_vector(7 downto 0);
        seg0,seg1:out std_logic_vector(0 to 7));
end t01;

architecture a of t01 is
begin 
 seg0<="00000011" when sw(3 downto 0)="0000" else
      "10011111" when sw(3 downto 0)="0001" else
      "00100101" when sw(3 downto 0)="0010" else
      "00001101" when sw(3 downto 0)="0011" else
      "10011001" when sw(3 downto 0)="0100" else
      "01001001" when sw(3 downto 0)="0101" else
      "01000001" when sw(3 downto 0)="0110" else
      "00011111" when sw(3 downto 0)="0111" else
      "00000001" when sw(3 downto 0)="1000" else
      "00001001" when sw(3 downto 0)="1001" else
      "01100001" ;
 seg1<="00000011" when sw(7 downto 4)="0000" else
      "10011111" when sw(7 downto 4)="0001" else
      "00100101" when sw(7 downto 4)="0010" else
      "00001101" when sw(7 downto 4)="0011" else
      "10011001" when sw(7 downto 4)="0100" else
      "01001001" when sw(7 downto 4)="0101" else
      "01000001" when sw(7 downto 4)="0110" else
      "00011111" when sw(7 downto 4)="0111" else
      "00000001" when sw(7 downto 4)="1000" else
      "00001001" when sw(7 downto 4)="1001" else
      "01100001" ;
end a;