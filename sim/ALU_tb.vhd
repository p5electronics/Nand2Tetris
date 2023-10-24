library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.textio.all;
use IEEE.STD_LOGIC_TEXTIO.ALL;

entity alu_tb is
end alu_tb;

architecture test of alu_tb is

    signal x_input : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal y_input : STD_LOGIC_VECTOR (15 downto 0) := (others => '1');

    signal zr_output : STD_LOGIC;
    signal ng_output : STD_LOGIC;
    signal test_output : STD_LOGIC_VECTOR (15 downto 0);

    signal control : STD_LOGIC_VECTOR (5 downto 0);
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC;
    
begin

    clk <= not clk after 1 ns;
    reset <= '1', '0' after 5 ns;
    
    x_input <= "0000000000010001" after 43 ns ;
    y_input <= "0000000000000011" after 43 ns;
    
    alu_uut : entity work.ALU(behavioral)
        port map (
            x => x_input,
            y => y_input,
            zx => control(5),
            nx => control(4),
            zy => control(3),
            ny => control(2),
            f => control(1),
            no => control(0),
            zr => zr_output,
            ng => ng_output,
            output => test_output
        );
        
    alu_test : process
    
        file output_file : text;
        variable outfile_line : line;

        constant col : character := '|';
        constant width_1 : character := ' ';
        
        -- Procedure to format and print design output
        procedure printline is
        begin
        
            write(outfile_line, col & width_1); 
            write(outfile_line, x_input);
            write(outfile_line, width_1 & col & width_1);
            write(outfile_line, y_input);
            write(outfile_line, width_1 & col & width_1);
            write(outfile_line, control(5));
            write(outfile_line, width_1 & col & width_1);
            write(outfile_line, control(4));
            write(outfile_line, width_1 & col & width_1);
            write(outfile_line, control(3));
            write(outfile_line, width_1 & col & width_1);
            write(outfile_line, control(2));
            write(outfile_line, width_1 & col & width_1);
            write(outfile_line, control(1));
            write(outfile_line, width_1 & col & width_1);
            write(outfile_line, control(0));
            write(outfile_line, width_1 & col & width_1);
            write(outfile_line, test_output);
            write(outfile_line, width_1 & col & width_1);
            write(outfile_line, zr_output);
            write(outfile_line, width_1 & col & width_1);
            write(outfile_line, ng_output);
            write(outfile_line, width_1 & col);
            writeline(output_file,outfile_line);
            
        end procedure;
    
    begin
     
        -- Write header
        file_open(output_file, "ALU.out", write_mode);
        write(outfile_line, string'("|        x         |        y         |zx |nx |zy |ny | f |no |       out        |zr |ng |"));
        writeline(output_file,outfile_line);
    
        wait until reset <= '0';
        
            control <= "101010";
            wait for 2 ns;
            printline;
            
            control <= "111111";
            wait for 2 ns;
            printline;
    
            control <= "111010";
            wait for 2 ns;
            printline;
                        
            control <= "001100";
            wait for 2 ns;
            printline;
            
            control <= "110000";
            wait for 2 ns;
            printline;
            
            control <= "001101";
            wait for 2 ns;
            printline;
            
            control <= "110001";
            wait for 2 ns;
            printline;
                    
            control <= "001111";
            wait for 2 ns;
            printline;
            
            control <= "110011";
            wait for 2 ns;
            printline;

            control <= "011111";
            wait for 2 ns;
            printline;

            control <= "110111";
            wait for 2 ns;
            printline;

            control <= "001110";
            wait for 2 ns;
            printline;

            control <= "110010";
            wait for 2 ns;
            printline;

            control <= "000010";
            wait for 2 ns;
            printline;

            control <= "010011";
            wait for 2 ns;
            printline;

            control <= "000111";
            wait for 2 ns;
            printline;

            control <= "000000";
            wait for 2 ns;
            printline;

            control <= "010101";
            wait for 2 ns;
            printline;
            -- cutoff
            control <= "101010";
            wait for 2 ns;
            printline;

            control <= "111111";    
            wait for 2 ns;
            printline;

            control <= "111010";
            wait for 2 ns;
            printline;

            control <= "001100"; 
            wait for 2 ns;
            printline;

            control <= "110000";
            wait for 2 ns;
            printline;

            control <= "001101";
            wait for 2 ns;
            printline;

            control <= "110001";
            wait for 2 ns;
            printline;

            control <= "001111";
            wait for 2 ns;
            printline;

            control <= "110011";
            wait for 2 ns;
            printline;

            control <= "011111";
            wait for 2 ns;
            printline;

            control <= "110111";
            wait for 2 ns;
            printline;

            control <= "001110";
            wait for 2 ns;
            printline;

            control <= "110010";
            wait for 2 ns;
            printline;

            control <= "000010";
            wait for 2 ns;
            printline;

            control <= "010011";
            wait for 2 ns;
            printline;

            control <= "000111";
            wait for 2 ns;
            printline;
            
            control <= "000000";
            wait for 2 ns;
            printline;

            control <= "010101"; 
            wait for 2 ns;
            printline;
            
            file_close(output_file);   
            wait;
            
    end process alu_test;

end test;
