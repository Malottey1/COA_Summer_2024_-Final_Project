library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sRam is
  generic(
    width: integer := 32;  -- Word width (bit-width of each location)
    depth: integer := 32;  -- Number of memory locations
    dataaddr: integer := 5  -- Address width (log2(depth))
  );
  port(
    clk: in std_logic;  -- Clock input
    Read: in std_logic;  -- Read enable signal
    Write: in std_logic;  -- Write enable signal
    Addr: in std_logic_vector(dataaddr-1 downto 0);  -- Address input (5 bits for 32 locations)
    Data_in: in std_logic_vector(width-1 downto 0);  -- Data input (32 bits)
    Data_out: out std_logic_vector(width-1 downto 0)  -- Data output (32 bits)
  );
end sRam;

architecture behav of sRam is
  -- Type declaration for RAM, an array of 32 locations each 32 bits wide
  type ram_type is array (0 to depth-1) of std_logic_vector(width-1 downto 0);
  -- Signal declaration for the internal RAM storage
  signal tmp_ram: ram_type;
begin  
  -- Process to handle read and write operations
  process(clk)
  begin
    if (rising_edge(clk)) then
      if (Write = '1') then
        -- Write data to RAM at the given address
        tmp_ram(to_integer(unsigned(Addr))) <= Data_in;
      elsif (Read = '1') then
        -- Read data from RAM at the given address
        Data_out <= tmp_ram(to_integer(unsigned(Addr))); 
      else
        -- If neither read nor write is enabled, set Data_out to high-impedance
        Data_out <= (others => 'Z');
      end if;
    end if;
  end process;
end behav;