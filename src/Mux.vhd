library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux is
    Port ( a : in STD_LOGIC;
         b : in STD_LOGIC;
         sel : in STD_LOGIC;
         output : out STD_LOGIC);
end Mux;

architecture behavioral of Mux is

begin

    process(a,b,sel)
    begin
        if sel <= '0' then
            output <= a;
        else
            output <= b;
        end if;
    end process;

end behavioral;
