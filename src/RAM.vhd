-------------------------------------------------------------------------------
-- File       : RAM.vhd
-- Author     : Mari
-------------------------------------------------------------------------------
-- Description: (Modified from XST UG) Description of single-port RAM in
-- read-first mode with custom partition space.
--
-- Download (Original):
-- ftp://ftp.xilinx.com/pub/documentation/misc/xstug_examples.zip
-- File: HDL_Coding_Techniques/rams/rams_01.vhd
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2023-07-15  1.0      Mari    Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity RAM is
  generic (
    dataStart : integer := 0;
    dataEnd   : integer := 3839;
    dataWidth : integer := 16;
    addrWidth : integer := 15);
  port (
    clk  : in  std_logic;
    load : in  std_logic;
    en   : in  std_logic;
    addr : in  std_logic_vector(addrWidth-1 downto 0);
    dIn  : in  std_logic_vector(dataWidth-1 downto 0);
    dOut : out std_logic_vector(dataWidth-1 downto 0));
end RAM;

architecture syn of RAM is
  type ram_type is array (dataEnd-1 downto dataStart) of std_logic_vector (dataWidth-1 downto 0);
  signal RAM : ram_type;
begin

  process (clk)
  begin
    if clk'event and clk = '1' then
      if en = '1' then
        if load = '1' then
          RAM(conv_integer(addr)) <= dIn;
        end if;
        dOut <= RAM(conv_integer(addr));
      end if;
    end if;
  end process;

end syn;
