library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add16_tb is
end add16_tb;

architecture sim of add16_tb is

    signal clock  : std_logic := '0';

    signal a_input : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal b_input : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal sum_output : STD_LOGIC_VECTOR (15 downto 0);
    signal carry : STD_LOGIC;

begin
    
    clock <= not clock after 1 ns;

    i_Add16 : entity work.Add16(behavioral)
        port map (
            a => a_input,
            b => b_input,
            sum => sum_output,
            cout => carry
        );

    test : process
    begin
    
        -- Addition '1 + 2'
        wait for 2 ns;
        a_input <= x"1";
        b_input <= x"2";
        
        -- Maximum Value
        wait for 2 ns;
        a_input <= x"FFFE";
        b_input <= x"1";
        
        -- Overflow
        wait for 2 ns;
        a_input <= x"FFFE";
        b_input <= x"2";
        
    end process test;
    
end sim;
