-------------------------------------------------------------------------------
-- File       : Register16.vhd
-- Author     : Mari
-------------------------------------------------------------------------------
-- Description: (Modified from XST UG) Description of single-port RAM for
-- an individual register.
--
-- Download (Original):
-- ftp://ftp.xilinx.com/pub/documentation/misc/xstug_examples.zip
-- File: HDL_Coding_Techniques/rams/rams_01.vhd
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2022-12-26  1.0      Mari    Created
-- 2023-07-15  2.0      Mari    Revised to be inferred    
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Register16 is
  port (clk  : in  std_logic;
        load : in  std_logic;
        en   : in  std_logic;
        addr : in  std_logic_vector(14 downto 0);
        dIn  : in  std_logic_vector(15 downto 0);
        dOut : out std_logic_vector(15 downto 0));
end Register16;

architecture syn of Register16 is
  signal reg : std_logic_vector (15 downto 0);
begin

  process (clk)
  begin
    if clk'event and clk = '1' then
      if en = '1' then
        if load = '1' then
          reg <= dIn;
        end if;
        dOut <= reg;
      end if;
    end if;
  end process;

end syn;
