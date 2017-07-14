----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2017 09:29:53 PM
-- Design Name: 
-- Module Name: CB - Behavioral
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

entity CB is
    Port ( input : in STD_LOGIC_VECTOR (4 downto 0);
           controll : in STD_LOGIC_VECTOR (9 downto 0);
           output : out STD_LOGIC_VECTOR (6 downto 0));
end CB;

architecture Behavioral of CB is

--- Mux 2*1 --- 
component Mux2_1 is
    Port ( input : in STD_LOGIC_VECTOR (1 downto 0);
           sel : in STD_LOGIC;
           output : out STD_LOGIC);
end component Mux2_1;
--- Mux 4*1 --- 
component Mux4_1 is
    Port ( input : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           output : out STD_LOGIC);
end component Mux4_1;

signal muxInput_0 : STD_LOGIC_VECTOR(3 downto 0);
signal muxInput_1 : STD_LOGIC_VECTOR(3 downto 0);
signal muxInput_2 : STD_LOGIC_VECTOR(3 downto 0);
signal muxInput_3 : STD_LOGIC_VECTOR(1 downto 0);
signal muxInput_4 : STD_LOGIC_VECTOR(1 downto 0);
signal muxInput_5 : STD_LOGIC_VECTOR(1 downto 0);
signal muxInput_6 : STD_LOGIC_VECTOR(1 downto 0);

begin
mux0:Mux4_1 port map(muxInput_0,controll(1 downto 0),output(0));
mux1:Mux4_1 port map(muxInput_1,controll(3 downto 2),output(1));
mux2:Mux4_1 port map(muxInput_2,controll(5 downto 4),output(2));

mux3:Mux2_1 port map(muxInput_3,controll(6),output(3));
mux4:Mux2_1 port map(muxInput_4,controll(7),output(4));
mux5:Mux2_1 port map(muxInput_5,controll(8),output(5));
mux6:Mux2_1 port map(muxInput_6,controll(9),output(6));

muxInput_0<=input(4 downto 1);
muxInput_1<=input(4 downto 1);
muxInput_2<=input(4 downto 1);

muxInput_3<=(input(0),input(4));
muxInput_4<=(input(0),input(3));
muxInput_5<=(input(0),input(2));
muxInput_6<=(input(0),input(1));

end Behavioral;
