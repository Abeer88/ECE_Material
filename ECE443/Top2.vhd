----------------------------------------------------------------------------------
-- Company: 			SinclarSolutions
-- Engineer: 			Steven Sepp�l�
-- 
-- Create Date:    22:55:29 09/17/2013 
-- Design Name: 
-- Module Name:    Top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top is
    Port ( 	A : in  STD_LOGIC;
          --B : in  STD_LOGIC;
	  Button0  : in STD_LOGIC;--Button is for reset
			clk  : in STD_LOGIC;
			LED0 : out  STD_LOGIC;
			LED1 : out  STD_LOGIC;
			LED2 : out  STD_LOGIC;
			LED3 : out  STD_LOGIC;
			LED4 : out  STD_LOGIC;
			LED5 : out  STD_LOGIC;
			LED6 : out  STD_LOGIC;
			LED7 : out  STD_LOGIC);
--			  SegNum0 : out  STD_LOGIC;
--			  SEGMENT0 : out  STD_LOGIC;
--			  SEGMENT1 : out  STD_LOGIC;
--			  SEGMENT2 : out  STD_LOGIC;
--			  SEGMENT3 : out  STD_LOGIC;
--			  SEGMENT4 : out  STD_LOGIC;
--			  SEGMENT5 : out  STD_LOGIC;
--			  SEGMENT6 : out  STD_LOGIC;
--			  SEGMENT7 : out  STD_LOGIC);
end Top;

architecture Behavioral of Top is

signal counter : STD_LOGIC_VECTOR ( 7 downto 0)  :="00000000";
signal divider : STD_LOGIC_VECTOR ( 25 downto 0) := (others => '0');
signal slow_clk : std_logic;
signal  ROT : STD_LOGIC_VECTOR (7 downto 0);
signal ZCNT : STD_LOGIC_VECTOR (7 downto 0);

--type states is (COUNTINGUP, CASCADE);
--signal mode : states;

begin
--COUNTINGUP <= '1' when A = '1' else '0';
--
--CASCADE <= '1' when A = '0' else '0';

clk_division :
  process (clk)
  begin
	if RISING_EDGE ( clk ) then
		divider <= divider + 1;
	end if;
end process;

selector_mode: process ( DIVIDER ( 25 )) is

begin

  if RISING_EDGE ( DIVIDER ( 25 ) ) then
    if ROT = B"1000_0000" or ROT = B"0000_0000" then
	   ROT <= B"0000_0001";
    else
	   ROT <= ROT + ROT ;
	 end if;
  end if;
end process;

  LED7 <= ZCNT(7) when A = '0' else ROT(7);
  LED6 <= ZCNT(6) when A = '0' else ROT(6);
  LED5 <= ZCNT(5) when A = '0' else ROT(5);
  LED4 <= ZCNT(4) when A = '0' else ROT(4);
  LED3 <= ZCNT(3) when A = '0' else ROT(3);
  LED2 <= ZCNT(2) when A = '0' else ROT(2);
  LED1 <= ZCNT(1) when A = '0' else ROT(1);
  LED0 <= ZCNT(0) when A = '0' else ROT(0);


--
----LED0 <= counter(0);
----LED1 <= counter(1);
----LED2 <= counter(2);
----LED3 <= counter(3);
---LED4 <= counter(4);
--LED5 <= counter(5);
--LED6 <= counter(6);
--LED7 <= counter(7);
--
--SEGMENT0 <= counter(0);
--SEGMENT1 <= counter(1);
--SEGMENT2 <= counter(2);
--SEGMENT3 <= counter(3);
--SEGMENT4 <= counter(4);
--SEGMENT5 <= counter(5);
--SEGMENT6 <= counter(6);
--SEGMENT7 <= counter(7);		

--SegNum0 <= counter(7);

end Behavioral;

