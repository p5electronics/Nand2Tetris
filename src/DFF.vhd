library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF is
    Port ( d : in STD_LOGIC;
           clk : in STD_LOGIC;
           q : out STD_LOGIC);
end DFF;

architecture rtl of DFF is

begin

    process(clk)
    begin
        if rising_edge(clk) then
            q <= d;
        end if;
    end process;
    
end rtl;