----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/04/2023 01:28:11 AM
-- Design Name: 
-- Module Name: CPU_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.textio.all;
use ieee.std_logic_textio.all;


entity CPU_tb is
end CPU_tb;

architecture test of CPU_tb is

    signal test_inM : std_logic_vector(15 downto 0);
    signal test_reset : std_logic;
    signal test_instruction : std_logic_vector(15 downto 0);

    signal test_addM : std_logic_vector(14 downto 0);
    signal test_pc : std_logic_vector(14 downto 0);
    signal test_writeM : std_logic;
    signal test_outM : std_logic_vector(15 downto 0);


    signal test_time : string(3 downto 1);
    signal clk : std_logic := '0';

begin

    clk <= not clk after 1 ns;

    CPU_UUT : entity work.CPU(rtl)
        port map ( inM => test_inM,
                 instruction => test_instruction,
                 reset => test_reset,
                 outM => test_outM,
                 writeM => test_writeM,
                 addressM => test_addM,
                 pc => test_pc,
                 clk => clk);
    CPU_TEST : process

        file output_file : text;
        variable output_line : line;

        constant col : character := '|';

        procedure printline is
        begin
        end procedure;

    begin
    
        file_open(output_file, "PC.out", write_mode);
        write(output_line, string'("| time |   in   |reset|load | inc |  out   |"));
        writeline(output_file,output_line);



    end process;
end test;
