library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Add16 is
    port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           sum : out STD_LOGIC_VECTOR (15 downto 0);
           cout : out STD_LOGIC
        );
end Add16;

architecture behavioral of Add16 is

    -- carry bits
    signal c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15 : std_logic;

begin

    HalfAdder1 : entity work.HalfAdder(behavioral)
        port map(a(0), b(0), sum => sum(0), carry => c1);
    FullAdder1 : entity work.FullAdder(behavioral)
        port map(a(1), b(1), c1, sum => sum(1), carry => c2);
    FullAdder2 : entity work.FullAdder(behavioral)
        port map(a(2), b(2), c2, sum => sum(2), carry => c3);
    FullAdder3 : entity work.FullAdder(behavioral)
        port map(a(3), b(3), c3, sum => sum(3), carry => c4);
    FullAdder4 : entity work.FullAdder(behavioral)
        port map(a(4), b(4), c4, sum => sum(4), carry => c5);
    FullAdder5 : entity work.FullAdder(behavioral)
        port map(a(5), b(5), c5, sum => sum(5), carry => c6);
    FullAdder6 : entity work.FullAdder(behavioral)
        port map(a(6), b(6), c6, sum => sum(6), carry => c7);
    FullAdder7 : entity work.FullAdder(behavioral)
        port map(a(7), b(7), c7, sum => sum(7), carry => c8);
    FullAdder8 : entity work.FullAdder(behavioral)
        port map(a(8), b(8), c8, sum => sum(8), carry => c9);
    FullAdder9 : entity work.FullAdder(behavioral)
        port map(a(9), b(9), c9, sum => sum(9), carry => c10);
    FullAdder10 : entity work.FullAdder(behavioral)
        port map(a(10), b(10), c10, sum => sum(10), carry => c11);
    FullAdder11 : entity work.FullAdder(behavioral)
        port map(a(11), b(11), c11, sum => sum(11), carry => c12);
    FullAdder12 : entity work.FullAdder(behavioral)
        port map(a(12), b(12), c12, sum => sum(12), carry => c13);
    FullAdder13 : entity work.FullAdder(behavioral)
        port map(a(13), b(13), c13, sum => sum(13), carry => c14);
    FullAdder14 : entity work.FullAdder(behavioral)
        port map(a(14), b(14), c14, sum => sum(14), carry => c15);
    FullAdder15 : entity work.FullAdder(behavioral)
        port map(a(15), b(15), c15, sum => sum(15), carry => cout);

end behavioral;