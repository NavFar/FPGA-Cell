----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2017 11:03:31 PM
-- Design Name: 
-- Module Name: Cell - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Cell is
    Port ( --CLK   : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (15 downto 0);
           controll: in STD_LOGIC_VECTOR (123 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0));
end Cell;

architecture Behavioral of Cell is
--CLB---
component CLB is
    Port ( CLK   : in STD_LOGIC;
           CLB_in : in STD_LOGIC_VECTOR (1 downto 0);
           controll : in STD_LOGIC_VECTOR (4 downto 0);
           output : out STD_LOGIC);
end component CLB;
--SB ---
component SB is
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           controll : in STD_LOGIC_VECTOR (15 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0));
end component SB;
--CB --
component CB is
        Port ( input : in STD_LOGIC_VECTOR (4 downto 0);
               controll : in STD_LOGIC_VECTOR (9 downto 0);
               output : out STD_LOGIC_VECTOR (6 downto 0));
end component CB;
---signals
signal CB0Input : STD_LOGIC_VECTOR(4 downto 0);
signal CB1Input : STD_LOGIC_VECTOR(4 downto 0);
signal CB2Input : STD_LOGIC_VECTOR(4 downto 0);
signal CB3Input : STD_LOGIC_VECTOR(4 downto 0);

signal CB0Output : STD_LOGIC_VECTOR(6 downto 0);
signal CB1Output : STD_LOGIC_VECTOR(6 downto 0);
signal CB2Output : STD_LOGIC_VECTOR(6 downto 0);
signal CB3Output : STD_LOGIC_VECTOR(6 downto 0);

signal SB0Input  : STD_LOGIC_VECTOR(7 downto 0);
signal SB1Input  : STD_LOGIC_VECTOR(7 downto 0);
signal SB2Input  : STD_LOGIC_VECTOR(7 downto 0);
signal SB3Input  : STD_LOGIC_VECTOR(7 downto 0);

signal SB0Output  : STD_LOGIC_VECTOR(7 downto 0);
signal SB1Output  : STD_LOGIC_VECTOR(7 downto 0);
signal SB2Output  : STD_LOGIC_VECTOR(7 downto 0);
signal SB3Output  : STD_LOGIC_VECTOR(7 downto 0);

begin

CLB0: CLB port map(CB0Output(2),CB0Output(1 downto 0),controll(4  downto 0),CB0Input(0));
CLB1: CLB port map(CB1Output(2),CB1Output(1 downto 0),controll(9  downto 5),CB1Input(0));
CLB2: CLB port map(CB2Output(2),CB2Output(1 downto 0),controll(66 downto 62),CB2Input(0));
CLB3: CLB port map(CB3Output(2),CB3Output(1 downto 0),controll(71 downto 67),CB3Input(0));


SB0:  SB  port map(SB0Input,controll(35  downto 20 ),SB0Output);
SB1:  SB  port map(SB1Input,controll(61  downto 46 ),SB1Output);
SB2:  SB  port map(SB2Input,controll(97  downto 82 ),SB2Output);
SB3:  SB  port map(SB3Input,controll(123 downto 108),SB3Output);


CB0: CB   port map(CB0Input,controll(19  downto 10),CB0Output);
CB1: CB   port map(CB1Input,controll(45  downto 36),CB1Output);
CB2: CB   port map(CB2Input,controll(81  downto 72),CB2Output);
CB3: CB   port map(CB3Input,controll(107 downto 98),CB3Output);



SB0Input (1 downto 0) <=input(1 downto 0);
output   (1 downto 0) <=SB0Output(1 downto 0);

SB1Input (1 downto 0) <=input(3 downto 2);
output   (3 downto 2) <=SB1Output(1 downto 0);


SB0Input (6)<=CB0Output(4);
SB0Input (7)<=CB0Output(3);

CB0Input (1)<=SB0output(7);
CB0Input (2)<=SB0output(6);


output(15 downto 14)  <=CB0output(6 downto 5);
CB0Input(4 downto 3)  <=input(15 downto 14);


SB0Input(5) <=SB3Output(0);
SB0Input(4) <=SB3Output(1);

SB3Input(1)<=SB0Output(4);
SB3Input(0)<=SB0Output(5);


CB1Input(4)  <=SB0Output(2);
CB1Input(3)  <=SB0Output(3);

SB0Input(3)  <=CB1Output(5);
SB0Input(2)  <=CB1Output(6);


SB1Input(7)  <=CB1Output(3);
SB1Input(6)  <=CB1Output(4);

CB1Input(2)  <=SB1Output(6);
CB1Input(1)  <=SB1Output(7);


SB1Input(3 downto 2)  <=input(5 downto 4);
output  (5 downto 4)  <=SB1Output(3 downto 2);


SB1Input(5)  <=SB2Output(0);
SB1Input(4)  <=SB2Output(1);

SB2Input(1)  <=SB1Output(4);
SB2Input(0)  <=SB1Output(5);


SB2Input(3 downto 2)  <=input(7 downto 6);
output  (7 downto 6)  <=SB2Output(3 downto 2);


SB2Input(5 downto 4)  <=input(9 downto 8);
output  (9 downto 8)  <=SB2Output(5 downto 4);


SB2Input(7)  <=CB2Output(3);
SB2Input(6)  <=CB2Output(4);

CB2Input(2)  <=SB2Output(6);
CB2Input(1)  <=SB2Output(7);


SB3Input(3)  <=CB2Output(5);
SB3Input(2)  <=CB2Output(6);

CB2Input(4)  <=SB3Output(2);
CB2Input(3)  <=SB3Output(3);


output(11 downto 10)  <=SB3Output(5 downto 4);
SB3Input(5 downto 4)  <=input(11 downto 10);


SB3Input(6)  <=CB3Output(3);
SB3Input(6)  <=CB3Output(4);

CB3Input(2)  <=SB3Output(6);
CB3Input(1)  <=SB3Output(7);


output(13 downto 12)  <=CB3Output(6 downto 5);
CB3Input(4 downto 3)  <=input(13 downto 12);

end Behavioral;
