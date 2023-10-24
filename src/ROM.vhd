-------------------------------------------------------------------------------
-- File       : ROM.vhd
-- Author     : Mari
-------------------------------------------------------------------------------
-- Description: (Modified from XST UG) Description of a ROM with a VHDL signal
-- through an external file. This uses 256 x 16 bits of space partitioned for
-- read-only memory.
--
-- Download (Original):
-- ftp://ftp.xilinx.com/pub/documentation/misc/xstug_examples.zip
-- File: HDL_Coding_Techniques/rams/roms_signal.vhd
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2023-06-11  1.0      Mari    Created
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use std.textio.all;

entity ROM is
  port (clk  : in  std_logic;
        en   : in  std_logic;
        addr : in  std_logic_vector(7 downto 0);
        dOut : out std_logic_vector(15 downto 0));
end ROM;

architecture syn of ROM is

  type ROM_type is array (0 to 256) of bit_vector (16 downto 0);

  -- Initialize ROM through an external text file
  impure function initROM (ROMFileName : in string) return ROM_type is
    file ROMFile         : text is in ROMFileName;
    variable ROMFileLine : line;
    variable ROM         : ROM_type;
  begin
    for i in ROM_type'range loop
      readline (ROMFile, ROMFileLine);
      read (ROMFileLine, ROM(i));
    end loop;
    return ROM;
  end function;

  signal ROM : ROM_type := initROM("ROM.hack");  -- Add file here for bootloader

  process (clk)
  begin
    if (clk'event and clk = '1') then
      if (en = '1') then
        index <= ROM(conv_integer(addr));
        dOut  <= to_stdlogicvector(index);
      end if;
    end if;
  end process;

end syn;
