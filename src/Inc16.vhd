library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Inc16 is
    port ( input : in STD_LOGIC_VECTOR (15 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0));
end Inc16;

architecture behavioral of Inc16 is

    signal b : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000001";
    signal ignore : STD_LOGIC;

begin

    Inc16 : entity work.Add16(behavioral)
        port map (a => input, b => b, sum => output, cout => ignore);
        
end behavioral;