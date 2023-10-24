-------------------------------------------------------------------------------
-- File       : CPU.vhd
-- Author     : Mari
-------------------------------------------------------------------------------
-- Description: Nand2Tetris Hack CPU written in VHDL
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2023-01-04  1.0      Mari  Created
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CPU is
  port (
    inM         : in  std_logic_vector (15 downto 0);
    instruction : in  std_logic_vector (15 downto 0);
    reset       : in  std_logic;
    outM        : out std_logic_vector (15 downto 0);
    writeM      : out std_logic;
    addressM    : out std_logic_vector (14 downto 0);
    pc          : out std_logic_vector (14 downto 0);
    clk         : in  std_logic);
end CPU;

architecture rtl of CPU is

  -- Outputs
  signal outALU : std_logic_vector(15 downto 0);
  signal outAM  : std_logic_vector(15 downto 0);

  -- Register Inputs 
  signal regA : std_logic_vector(15 downto 0);
  signal regD : std_logic_vector(15 downto 0);

  -- Control Signals
  signal loadA : std_logic;
  signal loadD : std_logic;
  signal loadI : std_logic;
  signal eq    : std_logic;
  signal lt    : std_logic;
  signal j0    : std_logic;
  signal j1    : std_logic;
  signal j2    : std_logic;
  signal jmp   : std_logic;

  signal count : integer := 0;          -- For Program Counter

begin

  process is
  begin
    if (instruction(12) = '1') then
      outAM <= inM;
    else
      outAM <= regA;
    end if;
  end process;

  i_ALU : entity work.ALU(Behavioral)
    port map (
      x      => regD,
      y      => outAM,
      zx     => instruction(11),
      nx     => instruction(10),
      zy     => instruction(9),
      ny     => instruction(8),
      f      => instruction(7),
      no     => instruction(6),
      zr     => eq,
      ng     => lt,
      output => outALU);

  outM     <= outALU;
  writeM   <= instruction(15) and instruction(3);
  addressM <= regA;

  loadA <= instruction(15) and instruction(5);
  loadD <= instruction(15) and instruction(4);
  loadI <= not instruction(15);

  j0  <= eq and instruction(1);
  j1  <= lt and instruction(2);
  j2  <= not(eq or lt) and instruction(0);
  jmp <= instruction(15) and (j0 or j1 or j2);

  -- Data and Address Registers
  p_DReg : process(clk)
  begin
    if rising_edge(clk) then
      if (reset = '1') then
        regD <= std_logic_vector(to_signed(0, 16));
      elsif (loadD = '1') then
        regD <= outALU;
      else
        regD <= regD;
      end if;
    end if;
  end process;

  p_AReg : process (clk)
  begin
    if rising_edge (clk) then
      if (reset = '1') then
        regA <= std_logic_vector(to_signed(0, 16));
      elsif (loadI = '1') then
        regA <= instruction;
      elsif (loadA = '1') then
        regA <= outALU;
      else
        regA <= regA;
      end if;
    end if;
  end process;

  -- Program Counter
  p_ProgramCounter : process (clk)
  begin
    if rising_edge (clk) then
      if (reset = '1') then
        count <= 0;
      elsif (jmp = '1') then
        count <= to_integer(signed(regA));
      else
        count <= count + 1;
      end if;
    end if;
  end process;

  pc <= std_logic_vector(to_signed(count, 14));

end rtl;
