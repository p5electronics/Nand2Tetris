library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux16 is
    port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR
          );
end Mux16;

architecture behavioral of Mux16 is
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