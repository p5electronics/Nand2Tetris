library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Add4 is
    port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           sum : inout STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC;
           seg_out : out std_logic_vector (6 downto 0));
end Add4;

architecture behavioral of Add4 is

    -- carry bits
    signal c1,c2,c3 : std_logic;
    
    begin
    
        HalfAdder1 : entity work.HalfAdder(behavioral)
            port map(a(0), b(0), sum => sum(0), carry => c1);    
        FullAdder1 : entity work.FullAdder(behavioral)
            port map(a(1), b(1), c1, sum => sum(1), carry => c2);
        FullAdder2 : entity work.FullAdder(behavioral)
            port map(a(2), b(2), c2, sum => sum(2), carry => c3);    
        FullAdder3 : entity work.FullAdder(behavioral)
            port map(a(3), b(3), c3, sum => sum(3), carry => cout);                          
        
end behavioral;