-------------------------------------------------------------------------------
-- File       : ALU.vhd
-- Author     : Mari
-------------------------------------------------------------------------------
-- Description: Nand2Tetris' ALU written in VHDL
-------------------------------------------------------------------------------
-- Date        Version  Author  Description
-- 2023-07-08  1.0      Mari    Created
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_misc.all;
use IEEE.numeric_std.all;

entity ALU is
  port (zr     : out std_logic;
        ng     : out std_logic;
        output : out std_logic_vector (15 downto 0);
        x      : in  std_logic_vector (15 downto 0);
        y      : in  std_logic_vector (15 downto 0);
        zx     : in  std_logic;
        nx     : in  std_logic;
        zy     : in  std_logic;
        ny     : in  std_logic;
        f      : in  std_logic;
        no     : in  std_logic);
end ALU;

architecture behavioral of ALU is

  -- Zero Outputs
  signal zero  : std_logic_vector (15 downto 0) := (others => '0');
  signal ZXout : std_logic_vector (15 downto 0);
  signal ZYout : std_logic_vector (15 downto 0);

  -- Inverted Inputs
  signal toNX : std_logic_vector (15 downto 0);
  signal toNY : std_logic_vector (15 downto 0);

  -- Inverted Outputs
  signal NXout : std_logic_vector (15 downto 0);
  signal NYout : std_logic_vector (15 downto 0);

  -- Operation Inputs
  signal toFa : std_logic_vector (15 downto 0);
  signal toFb : std_logic_vector (15 downto 0);

  -- Add or And
  signal Fout    : std_logic_vector (15 downto 0);
  signal notFout : std_logic_vector (15 downto 0);

  -- Connection signals
  signal toZRa : std_logic;
  signal toZRb : std_logic;
  signal tempout : std_logic_vector (15 downto 0);

begin

  p_ZXMux : process (x, zero, zx) is
  begin
    if zx = '0' then
      ZXout <= x;
    else
      ZXout <= zero;
    end if;
  end process p_ZXMux;

  p_ZYMux : process (y, zero, zy) is
  begin
    if zy = '0' then
      ZYout <= y;
    else
      ZYout <= zero;
    end if;
  end process p_ZYMux;

  toNX <= not ZXout;
  toNY <= not ZYout;

  p_NXMux : process (ZXout, toNX, nx) is
  begin
    if nx = '0' then
      NXout <= ZXout;
    else
      NXout <= toNX;
    end if;
  end process p_NXMux;

  p_NYMux : process (ZYout, toNY, ny) is
  begin
    if ny  = '0' then
      NYout <= ZYout;
    else
      NYout <= toNY;
    end if;
  end process p_NYMux;

  toFa <= NXout and NYout;
  toFb <= std_logic_vector(unsigned(NXout) + unsigned(NYout));

  p_FMux : process (toFa, toFb, f) is
  begin
    if f = '0' then
      Fout <= toFa;
    else
      Fout <= toFb;
    end if;
  end process p_FMux;

  notFout <= not Fout;

  p_EndMux : process (Fout, notFout, no) is
  begin
    if no = '0' then
      tempout <= Fout;
    else
      tempout <= notFout;
    end if;
  end process p_EndMux;

  output <= tempout;
  ng     <= tempout(15);

  toZRa <= or_reduce(tempout(7 downto 0));
  toZRb <= or_reduce(tempout(15 downto 8));

  zr <= not (toZRa or toZRb);

end behavioral;
