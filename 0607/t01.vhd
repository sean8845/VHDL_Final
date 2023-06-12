library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity t01 is
port (	ck_50M,clr,sw				: in  std_logic;
		seg0,seg1,seg2,seg3	: out std_logic_vector(0 to 7)
	 );
end t01;

architecture a of t01 is
component seg7
port(	bcd : in  std_logic_vector(3 downto 0);
			dot : in  std_logic;
			RBI : in  std_logic;
			RBO : out std_logic;
			seg : out std_logic_vector(7 downto 0)
		);
end component;
type MMSS_array is array(3 downto 0) of std_logic_vector(3 downto 0);
signal MMSS :MMSS_array:=("0101","1001","0101","0110");
signal DF: std_logic_vector(25 downto 1):=(others =>'0');
signal x: std_logic;

begin
	process(ck_50M)
	begin
		if ck_50M'event and ck_50M ='1' then
			DF<=DF+1;
		end if;
	end process;
	
	process(DF(25),clr,sw)
	begin
	if sw='0'then x<='0';
	else x<='1';
	end if;
	if  clr='0' then
	MMSS(0)<="0000";
	MMSS(1)<="0000";
	MMSS(2)<="0000";
	MMSS(3)<="0000";
		elsif DF(25)'event and DF(25) = '1' and x='1' then
			if MMSS(0) ="1001" then
				MMSS(0)<="0000";
				if MMSS(1) = "0101" then
					MMSS(1)<="0000";
					if MMSS(2) = "1001" then
						MMSS(2) <= "0000" ;
						if MMSS(3) = "0101" then
							MMSS(3) <="0000";
						else
							MMSS(3) <= MMSS(3) +1;
						end if;
					else
						MMSS(2)<=MMSS(2)+1;
					end if;
				else
					MMSS(1) <= MMSS(1)+1;
				end if;
			else
				MMSS(0) <= MMSS(0) +1;
			end if;
		end if;
	end process;
	segA:seg7 port map( bcd=>MMSS(0),dot=>'1',RBI=>'1',seg=>seg0 );
	segB:seg7 port map( bcd=>MMSS(1),dot=>'1',RBI=>'1',seg=>seg1 );
	segC:seg7 port map( bcd=>MMSS(2),dot=>'0',RBI=>'1',seg=>seg2 );
	segD:seg7 port map( bcd=>MMSS(3),dot=>'1',RBI=>'1',seg=>seg3 );
end a;