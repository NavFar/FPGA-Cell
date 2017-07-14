----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2017 06:42:56 PM
-- Design Name: 
-- Module Name: Mux2_1 - Behavioral
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

entity Mux2_1 is
    Port ( input : in STD_LOGIC_VECTOR (1 downto 0);
           sel : in STD_LOGIC;
           output : out STD_LOGIC);
end Mux2_1;

architecture Behavioral of Mux2_1 is

begin

    output<=
            input(0) when sel='0' else
            input(1) when sel='1' ; 
end Behavioral;
