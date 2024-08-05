library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity testbench_MIPS_VHDL is
end testbench_MIPS_VHDL;

architecture behavior of testbench_MIPS_VHDL is 
  -- Component Declaration for the single-cycle MIPS Processor in VHDL
  component MIPS_VHDL
  port(
    clk : in std_logic;
    reset : in std_logic;
    pc_out : out std_logic_vector(4 downto 0);
    alu_result : out std_logic_vector(31 downto 0)
  );
  end component;

  -- Inputs
  signal clk : std_logic := '0';
  signal reset : std_logic := '0';

  -- Outputs
  signal pc_out : std_logic_vector(4 downto 0);
  signal alu_result : std_logic_vector(31 downto 0);

  -- Clock period definitions
  constant clk_period : time := 10 ns;

begin
  -- Instantiate the Unit Under Test (UUT)
  uut: MIPS_VHDL port map (
    clk => clk,
    reset => reset,
    pc_out => pc_out,
    alu_result => alu_result
  );

  -- Clock process definitions
  clk_process : process
  begin
    clk <= '0';
    wait for clk_period / 2;
    clk <= '1';
    wait for clk_period / 2;
  end process;

  -- Stimulus process
  stim_proc: process
  begin  
    -- Reset the processor
    reset <= '1';
    wait for clk_period * 10;
    reset <= '0';

    -- Wait for the simulation to run through the instructions
    wait for clk_period * 500; -- Adjust time as necessary to observe changes

    

    wait;
  end process;
end behavior;