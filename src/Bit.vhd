library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BitReg is
    port ( input : in STD_LOGIC;
           clk : in STD_LOGIC;
           load : in STD_LOGIC;
           output : out STD_LOGIC);
end BitReg;

architecture rtl of BitReg is

    signal feedback : STD_LOGIC;
    signal wire : STD_LOGIC;
    
begin

    Mux : entity work.Mux(behavioral)
            port map (a => feedback, b => input, sel => load, output => wire);
            
    DFF : entity work.DFF(rtl)
        port map (d => wire, clk => clk, q => feedback);
    
    output <= feedback;

end rtl;
