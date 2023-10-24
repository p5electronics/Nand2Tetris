----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/24/2022 01:50:07 PM
-- Design Name: 
-- Module Name: Or8Way - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Or8Way is
    port ( a : in STD_LOGIC_VECTOR (7 downto 0);
         output : out STD_LOGIC);
end Or8Way;

architecture behavioral of Or8Way is

begin

    output <= a(0) or a(1) or a(2) or a(3) or a(4) or a(5) or a(6) or a(7);


end Behavioral;
