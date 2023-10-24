
library IEEE;
use ieee.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.ALL;

entity PC is
    port ( d  : in  std_logic_vector(15 downto 0); -- in
           q  : out std_logic_vector(15 downto 0); -- out
           reset   : in  std_logic;                -- reset
           load  : in  std_logic;                  -- load
           inc : in  std_logic;                    -- inc
           clk   : in  std_logic
        );
end PC;

architecture rtl of PC is

    signal count : integer := 0;

begin

    q <= std_logic_vector(to_signed(count, 16));

    process (clk)
    begin
        if falling_edge(clk) then
            if (reset = '1') then
                count <= 0;
            elsif (load = '1') then
                count <=  to_integer(signed(d));
            elsif (inc = '1') then
                count <= count + 1;
            else
                count <= count;
            end if;
        end if;
    end process;

end rtl;