library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FullAdder is
    port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry : out STD_LOGIC);
end FullAdder;

architecture behavioral of FullAdder is

    -- Input wires
    signal to_2a : std_logic;
    signal to_ORa : std_logic;
    signal to_ORb : std_logic;
    
    begin    
        HalfAdder1 : entity work.HalfAdder(behavioral)
            port map(
                a,
                b,
                sum => to_2a,
                carry => to_ORa
            );
            
        HalfAdder2 : entity work.HalfAdder(behavioral)
            port map(
                a => to_2a,
                b => cin,
                sum => sum,
                carry => to_ORb
            );
            
        carry <= to_ORa or to_ORb;

end behavioral;