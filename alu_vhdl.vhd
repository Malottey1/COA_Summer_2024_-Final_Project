library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
  Port (
    inp_a : in STD_LOGIC_VECTOR(31 downto 0);  -- 32-bit input A
    inp_b : in STD_LOGIC_VECTOR(31 downto 0);  -- 32-bit input B
    alu_control : in STD_LOGIC_VECTOR(3 downto 0);  -- 4-bit control signal to determine ALU operation
    alu_result : out STD_LOGIC_VECTOR(31 downto 0);  -- 32-bit output result
    zero_flag, sign_flag : out std_logic  -- Output flags: zero flag and sign flag
  );
end alu;

architecture Behavioral of alu is
  signal out_alu : std_logic_vector(31 downto 0);  -- Internal signal for ALU output
  constant zero_vector : std_logic_vector(31 downto 0) := (others => '0'); -- 32-bit zero vector
  signal mul_result : signed(63 downto 0);  -- Intermediate signal for 64-bit multiplication result
begin
  -- Process to perform ALU operations based on control signal
  process(inp_a, inp_b, alu_control) 
  begin
    case alu_control is
      when "0010" => 
        -- Addition operation
        out_alu <= std_logic_vector(signed(inp_a) + signed(inp_b));
      when "0110" => 
        -- Subtraction operation
        out_alu <= std_logic_vector(signed(inp_a) - signed(inp_b));
      when "0000" => 
        -- AND operation
        out_alu <= inp_a and inp_b;
      when "0001" => 
        -- OR operation
        out_alu <= inp_a or inp_b;
      when "0011" => 
        -- XOR operation
        out_alu <= inp_a xor inp_b;
      when "0100" => 
        -- NOR operation
        out_alu <= not (inp_a or inp_b);
      when others => 
        -- Default case
        out_alu <= zero_vector;
    end case;
  end process;

  -- Set zero flag if the result is zero
  zero_flag <= '1' when (out_alu = zero_vector) else '0';

  -- Set sign flag if the result is negative (MSB is '1')
  sign_flag <= '1' when (out_alu(31) = '1') else '0';

  -- Assign the ALU result to the output
  alu_result <= out_alu;

end Behavioral;