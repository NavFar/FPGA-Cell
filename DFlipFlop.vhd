----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2017 06:36:43 PM
-- Design Name: 
-- Module Name: DFlipFlop - Behavioral
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

entity DFlipFlop is
    Port ( CLK : in STD_LOGIC;
           Enable : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qnot : out STD_LOGIC);
end DFlipFlop;

architecture Behavioral of DFlipFlop is

begin
process(CLK)
begin
    if(rising_edge(CLK)) then
        if(Enable='1') then
            Q<=D;
            Qnot<=not D;
        end if;
    end if;    
end process;

end Behavioral;
