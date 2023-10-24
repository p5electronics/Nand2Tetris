----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/17/2022 01:24:10 AM
-- Design Name: 
-- Module Name: And - Behavioral
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

entity and_gate is
    port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           and_out : out STD_LOGIC);
end and_gate;

architecture behavioral of and_gate is

begin
    and_out <= a and b;
end behavioral;
