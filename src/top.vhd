-------------------------------------------------------------------------------
-- File       : top.vhd
-- Author     : Mari
-------------------------------------------------------------------------------
-- Description: Top file for HackCPU system.
-- TODO: 1) Make ROM configurable,.
--       2) Find out how to implement LED, BUTTON, and  DEBUG registers.
--       3) Implement 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2023-07-13  1.0      Mari    Created
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- General Signals
signal clk   : std_logic;
signal reset : std_logic;

-- CPU Signals
signal addressM : std_logic_vector(14 downto 0);
signal pc       : std_logic_vector(14 downto 0);
signal outM     : std_logic_vector(15 downto 0);
signal writeM   : std_logic;

-- Instuction and Data Register Signals
signal butOut      : std_logic;
signal dbgOut      : std_logic;
signal ledIn       : std_logic_vector(15 downto 0) := (others => '0');;
signal ledOut      : std_logic_vector(15 downto 0);
-- signal ramOut      : std_logic_vector(15 downto 0);
-- signal instruction : std_logic_vector(15 downto 0);

-- -- Memory Mapping Signals
-- signal memOut  : std_logic_vector(15 downto 0);
-- signal memSel  : std_logic_vector(3 downto 0) := (others => '0');
-- signal memAddr : integer                      := conv_integer(addressM);

-- i_CPU : entity work.CPU(rtl)
--   port map (
--     inM         => memOut,
--     instruction => data,
--     reset       => reset,
--     outM        => outM,
--     writeM      => writeM,
--     addressM    => addressM,
--     pc          => pc,
--     clk         => clk);

-- i_ROM : entity work.ROM(syn)
--   port map (
--     clk  => clk,
--     en   => '1',
--     addr => pc,
--     dOut => instruction);

-- i_RAM : entity work.RAM(syn)
--   generic map (
--     dataStart => 16#0000#,
--     dataEnd   => 16#100F#,
--     dataWidth => 16,
--     addrWidth => 15)
--   port map (
--     clk  => clk,
--     load => memSel(0),
--     en   => '1',
--     addr => addressM,
--     dIn  => outM,
--     dOut => ramOut);

-- -- p_LEDReg : process (clk) is
-- -- begin
-- --   if clk'event and clk = '1' then
-- --     if memSel(1) = '1' then
-- --       ledIn <= outM;
-- --     end if;
-- --     ledOut <= ledIn;
-- --   end if;
-- -- end process p_LEDReg;

-- i_debugRAM : entity work.RAM(syn)
--   generic map (
--     dataStart => 16#100B#,
--     dataEnd   => 16#100F#,
--     dataWidth => 16,
--     addrWidth => 15)
--   port map (
--     clk  => clk,
--     load => memSel(3),
--     en   => '1',
--     addr => addressM,
--     dIn  => outM,
--     dOut => ramOut);

-- -- Maps memory to RAM, I/O, and Debugging Registers.
-- p_memMap : process (memAddr) is
-- begin
--   if ((memAddr >= x"0000") and (memAddr <= x"0EFF")) then
--     memSel <= x"1";                     
--     memOut <= ramOut;
--   elsif (memAddr = x"1000") then
--     memSel <= x"2";                     
--     memOut <= ledOut;
--   -- elsif (memAddr = x"1001") then
                 
  -- elsif ((memAddr >= x"1002") and (memAddr <= x"100A")) then
  --   memSel <= x"4";                     --asserts loadIO, memSel(2)
  
  -- else
  --   memSel <= x"8";                     --asserts loadDEBUG, memSel(3)
  --   memOut <= dbgOut;
  end if;
end process memMap;
