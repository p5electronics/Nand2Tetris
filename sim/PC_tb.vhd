library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

entity PC_tb is
end PC_tb;

architecture test of PC_tb is
    
    signal test_input : std_logic_vector(15 downto 0);
    signal test_output : std_logic_vector(15 downto 0);
    signal control : std_logic_vector(2 downto 0);
    
    signal test_time : string(3 downto 1);
    signal clk : std_logic := '0';
   
begin

    clk <= not clk after 1 ns;
    
    PC_UUT : entity work.PC(rtl)
        port map( d => test_input,
                  reset => control(2),
                  load => control(1),
                  inc => control(0),
                  clk => clk,
                  q => test_output
                 );

    PC_TEST : process
    
        file output_file : text;
        variable output_line : line;
        
        constant col : character := '|';

        procedure printline is
        begin
        
            write(output_line, col, left, 2);
            write(output_line, test_time, left, 5);
            write(output_line, col);
            write(output_line, to_integer(signed(test_input)), right, 7);
            write(output_line, col, right, 2);
            write(output_line, control(2), right, 3);
            write(output_line, col, right, 3);
            write(output_line, control(1), right, 3);
            write(output_line, col, right, 3);
            write(output_line, control(0), right, 3);
            write(output_line, col, right, 3);
            write(output_line, to_integer(signed(test_output)), right, 7);
            write(output_line, col, right, 2);
            writeline(output_file, output_line);
            
        end procedure;
          
    begin
    
        -- Establish comparison file
        file_open(output_file, "PC.out", write_mode);
        write(output_line, string'("| time |   in   |reset|load | inc |  out   |"));
        writeline(output_file,output_line);
 
        wait for 5 ns;
        
        -- Begin test
        test_input <= std_logic_vector(to_unsigned(0, 16));
        control <= "000";
        test_time <= "0+ ";
        wait for 1 ns;
        printline;  
        
        test_time <= "1  ";
        wait for 1 ns;
        printline; 
        
        test_time <= "1+ ";
        control <= "001";
        wait for 1 ns;
        printline; 
        
        test_time <= "2  ";
        wait for 1 ns;
        printline; 
        
        test_time <= "2+ ";
        test_input <= std_logic_vector(to_signed(-32123, 16));
        wait for 1 ns;
        printline; 
        
        test_time <= "3  ";
        wait for 1 ns;
        printline; 
        
        test_time <= "3+ ";
        control <= "011";
        wait for 1 ns;
        printline; 
        
        test_time <= "4  ";
        wait for 1 ns;
        printline; 
        
        test_time <= "4+ ";
        control <= "001";
        wait for 1 ns;
        printline; 
        
        test_time <= "5  ";
        wait for 1 ns;
        printline; 
        
        test_time <= "5+ ";
        wait for 1 ns;
        printline; 
        
        test_time <= "6  ";
        wait for 1 ns;
        printline; 
        
        test_time <= "6+ ";
        control <= "010";
        test_input <= std_logic_vector(to_unsigned(12345, 16));
        wait for 1 ns;
        printline; 
        
        test_time <= "7  ";
        wait for 1 ns;
        printline; 
        
        test_time <= "7+ ";
        control <= "110";
        wait for 1 ns;
        printline; 
        
        test_time <= "8  ";
        wait for 1 ns;
        printline; 
        
        test_time <= "8+ ";
        control <= "011";
        wait for 1 ns;
        printline; 
        
        test_time <= "9  ";
        wait for 1 ns;
        printline; 
        
        test_time <= "9+ ";
        control <= "111";
        wait for 1 ns;
        printline; 
        
        test_time <= "10 ";
        wait for 1 ns;
        printline; 
        
        test_time <= "10+";
        control <= "001";
        wait for 1 ns;
        printline; 
        
        test_time <= "11 ";
        wait for 1 ns;
        printline; 
        
        test_time <= "11+";
        control <= "101";
        wait for 1 ns;
        printline; 
        
        test_time <= "12 ";
        wait for 1 ns;
        printline; 
        
        test_time <= "12+";
        test_input <= std_logic_vector(to_unsigned(0, 16));
        control <= "011";
        wait for 1 ns;
        printline; 
        
        test_time <= "13 ";
        wait for 1 ns;
        printline; 
        
        test_time <= "13+";
        control <= "001";
        wait for 1 ns;
        printline; 
        
        test_time <= "14 ";
        wait for 1 ns;
        printline; 
        
        test_time <= "14+";
        test_input <= std_logic_vector(to_unsigned(22222, 16));
        control <= "100";
        wait for 1 ns;
        printline; 
        
        test_time <= "15 ";
        wait for 1 ns;
        printline; 
        
        file_close(output_file);   
        wait;
    
    end process PC_TEST;
    
end test;
