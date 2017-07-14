----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2017 06:56:32 PM
-- Design Name: 
-- Module Name: CLB - Behavioral
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

entity CLB is
    Port ( CLK   : in STD_LOGIC;
           CLB_in : in STD_LOGIC_VECTOR (1 downto 0);
           controll : in STD_LOGIC_VECTOR (4 downto 0);
           output : out STD_LOGIC);
end CLB;

architecture Behavioral of CLB is

--- D Flip Flop --- 
component DFlipFlop is
    Port ( CLK : in STD_LOGIC;
           Enable : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qnot : out STD_LOGIC);
end component DFlipFlop;
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

--DFF signals
signal Enable : STD_LOGIC:='1';
signal Q : STD_LOGIC;
--Mux2to1 signals
signal Mux2to1_input : STD_LOGIC_VECTOR (1 downto 0);
--Mux4to1 signals
signal Mux4to1_output : STD_LOGIC;

begin
DFF: DFlipFlop port map(CLK,Enable,Mux4to1_output,Q,open);
Mux2to1:Mux2_1 port map(Mux2to1_input,controll(0),output);
Mux4to1:Mux4_1 port map(controll(4 downto 1),clb_in,Mux4to1_output);
Mux2to1_input(0)<=Mux4to1_output;
Mux2to1_input(1)<=Q;
end Behavioral;
