library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Instruction_Memory_VHDL is
  port (
    inst_add: in std_logic_vector(4 downto 0);  -- 5-bit instruction address input
    instruction: out std_logic_vector(31 downto 0)  -- 32-bit instruction output
  );
end Instruction_Memory_VHDL;

architecture Behavioral of Instruction_Memory_VHDL is
  signal rom_addr: integer range 0 to 31;
  type ROM_type is array (0 to 31) of std_logic_vector(31 downto 0);  -- Exactly 32 elements
  constant rom_data: ROM_type := (
    x"00000020",  -- add $1, $2, $3
    x"00200022",  -- sub $1, $1, $2
    x"00400024",  -- and $1, $2, $2
    x"00600025",  -- or $1, $3, $2
    x"00800026",  -- xor $1, $4, $2
    x"00A00027",  -- nor $1, $5, $2
    x"20C0000A",  -- addi $12, $0, 10
    x"30E0000F",  -- andi $14, $0, 15
    x"340A003C",  -- ori $10, $0, 60
    x"380B00F0",  -- xori $11, $0, 240
    x"8C0C0004",  -- lw $12, 4($0)
    x"AC0D0008",  -- sw $13, 8($0)
    x"10000002",  -- beq $0, $0, 2
    x"08000002",  -- j 2
    -- Fill the rest with NOPs (No Operation)
    x"00000000", x"00000000", x"00000000", x"00000000",
    x"00000000", x"00000000", x"00000000", x"00000000",
    x"00000000", x"00000000", x"00000000", x"00000000",
    x"00000000", x"00000000", x"00000000", x"00000000",
    x"00000000", x"00000000"
  );
begin
  process(inst_add, rom_addr)
  begin
    rom_addr <= to_integer(unsigned(inst_add));
    instruction <= rom_data(rom_addr);
  end process;
end Behavioral;