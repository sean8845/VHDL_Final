library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity t01 is
port(    sw:in std_logic_vector(5 downto 0);
         led:out std_logic_vector(5 downto 0);
         seg0,seg1:out std_logic_vector(0 to 7));
end t01 ;

architecture a of t01 is
 type S is array(0 to 7) of std_logic_vector(7 downto 0);
    constant S_code : S :=("00000011","10011111","00100101","00001101",
                           "10011001","01001001","01000001","00011111");
begin
	Process(sw)
	begin
		led<=sw;
		case sw(2 downto 0) is
			when "000"=>seg0<=S_code(0);                                            
            when "001"=>seg0<=S_code(1);    
            when "010"=>seg0<=S_code(2);
            when "011"=>seg0<=S_code(3);
            when "100"=>seg0<=S_code(4);
            when "101"=>seg0<=S_code(5);
            when "110"=>seg0<=S_code(6);
            when "111"=>seg0<=S_code(7);    
        end case;
        case sw(5 downto 3) is
			when "000"=>seg1<=S_code(0);                                            
            when "001"=>seg1<=S_code(1);    
            when "010"=>seg1<=S_code(2);
            when "011"=>seg1<=S_code(3);
            when "100"=>seg1<=S_code(4);
            when "101"=>seg1<=S_code(5);
            when "110"=>seg1<=S_code(6);
            when "111"=>seg1<=S_code(7);    
        end case;
	end process;
end a;