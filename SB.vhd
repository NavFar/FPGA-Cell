----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2017 07:52:06 PM
-- Design Name: 
-- Module Name: SB - Behavioral
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

entity SB is
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           controll : in STD_LOGIC_VECTOR (15 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0));
end SB;

architecture Behavioral of SB is
-- Mux 4 to  1
component Mux4_1 is
    Port ( input : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           output : out STD_LOGIC);
end component Mux4_1;

signal muxInput_0 : STD_LOGIC_VECTOR(3 downto 0);
signal muxInput_1 : STD_LOGIC_VECTOR(3 downto 0);
signal muxInput_2 : STD_LOGIC_VECTOR(3 downto 0);
signal muxInput_3 : STD_LOGIC_VECTOR(3 downto 0);
signal muxInput_4 : STD_LOGIC_VECTOR(3 downto 0);
signal muxInput_5 : STD_LOGIC_VECTOR(3 downto 0);
signal muxInput_6 : STD_LOGIC_VECTOR(3 downto 0);
signal muxInput_7 : STD_LOGIC_VECTOR(3 downto 0);
 
begin
mux0 : Mux4_1 port map(muxInput_0,controll(1  downto 0 ),output(0));
mux1 : Mux4_1 port map(muxInput_1,controll(3  downto 2 ),output(1));
mux2 : Mux4_1 port map(muxInput_2,controll(5  downto 4 ),output(2));
mux3 : Mux4_1 port map(muxInput_3,controll(7  downto 6 ),output(3));
mux4 : Mux4_1 port map(muxInput_4,controll(9  downto 8 ),output(4));
mux5 : Mux4_1 port map(muxInput_5,controll(11 downto 10),output(5));
mux6 : Mux4_1 port map(muxInput_6,controll(13 downto 12),output(6));
mux7 : Mux4_1 port map(muxInput_7,controll(15 downto 14),output(7));

muxInput_0<=(input(2),input(5),input(7),'0');
muxInput_1<=(input(3),input(4),input(6),'0');
muxInput_2<=(input(1),input(5),input(7),'0');
muxInput_3<=(input(0),input(4),input(6),'0');
muxInput_4<=(input(1),input(2),input(6),'0');
muxInput_5<=(input(0),input(3),input(7),'0');
muxInput_6<=(input(0),input(3),input(5),'0');
muxInput_7<=(input(1),input(2),input(4),'0');


end Behavioral;
