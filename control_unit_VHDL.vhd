library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit_VHDL is
  port (
    opcode: in std_logic_vector(5 downto 0);  -- 6-bit opcode input
    reset: in std_logic;  -- Reset signal
    alu_op: out std_logic_vector(2 downto 0);  -- ALU operation code output
    reg_dst, mem_to_reg, jump, branch, branch_g, branch_l, mem_read, mem_write, alu_src, reg_write : out std_logic  -- Control signals
  );
end control_unit_VHDL;

architecture Behavioral of control_unit_VHDL is
begin
  process(reset, opcode)
  begin
    if (reset = '1') then
      -- Reset state
      reg_dst <= '0';
      mem_to_reg <= '0';
      alu_op <= "000";
      jump <= '0';
      branch_g <= '0';
      branch_l <= '0';
      branch <= '0';
      mem_read <= '0';
      mem_write <= '0';
      alu_src <= '0';  -- Default: Second operand from register
      reg_write <= '0';
    else
      case opcode is
        when "000000" => -- R-type instructions
          reg_dst <= '1';
          mem_to_reg <= '0';
          alu_op <= "010";
          jump <= '0';
          branch_g <= '0';
          branch_l <= '0';
          branch <= '0';
          mem_read <= '0';
          mem_write <= '0';
          alu_src <= '0';
          reg_write <= '1';
        when "001000" => -- ADDI
          reg_dst <= '0';
          mem_to_reg <= '0';
          alu_op <= "000";
          jump <= '0';
          branch_g <= '0';
          branch_l <= '0';
          branch <= '0';
          mem_read <= '0';
          mem_write <= '0';
          alu_src <= '1';
          reg_write <= '1';
        when "001100" => -- ANDI
          reg_dst <= '0';
          mem_to_reg <= '0';
          alu_op <= "001";
          jump <= '0';
          branch_g <= '0';
          branch_l <= '0';
          branch <= '0';
          mem_read <= '0';
          mem_write <= '0';
          alu_src <= '1';
          reg_write <= '1';
        when "001101" => -- ORI
          reg_dst <= '0';
          mem_to_reg <= '0';
          alu_op <= "011";
          jump <= '0';
          branch_g <= '0';
          branch_l <= '0';
          branch <= '0';
          mem_read <= '0';
          mem_write <= '0';
          alu_src <= '1';
          reg_write <= '1';
        when "001110" => -- XORI
          reg_dst <= '0';
          mem_to_reg <= '0';
          alu_op <= "100";
          jump <= '0';
          branch_g <= '0';
          branch_l <= '0';
          branch <= '0';
          mem_read <= '0';
          mem_write <= '0';
          alu_src <= '1';
          reg_write <= '1';
        when "100011" => -- LW
          reg_dst <= '0';
          mem_to_reg <= '1';
          alu_op <= "000";
          jump <= '0';
          branch_g <= '0';
          branch_l <= '0';
          branch <= '0';
          mem_read <= '1';
          mem_write <= '0';
          alu_src <= '1';
          reg_write <= '1';
        when "101011" => -- SW
          reg_dst <= '0';
          mem_to_reg <= '0';
          alu_op <= "000";
          jump <= '0';
          branch_g <= '0';
          branch_l <= '0';
          branch <= '0';
          mem_read <= '0';
          mem_write <= '1';
          alu_src <= '1';
          reg_write <= '0';
        when "000100" => -- BEQ
          reg_dst <= '0';
          mem_to_reg <= '0';
          alu_op <= "001";
          jump <= '0';
          branch_g <= '0';
          branch_l <= '0';
          branch <= '1';
          mem_read <= '0';
          mem_write <= '0';
          alu_src <= '0';
          reg_write <= '0';
        when "000101" => -- BNE
          reg_dst <= '0';
          mem_to_reg <= '0';
          alu_op <= "001";
          jump <= '0';
          branch_g <= '0';
          branch_l <= '0';
          branch <= '0';
          mem_read <= '0';          
          mem_write <= '0';
          alu_src <= '0';
          reg_write <= '0';
        when "000010" => -- JUMP
          reg_dst <= '0';
          mem_to_reg <= '0';
          alu_op <= "000";
          jump <= '1';
          branch_g <= '0';
          branch_l <= '0';
          branch <= '0';
          mem_read <= '0';
          mem_write <= '0';
          alu_src <= '0';
          reg_write <= '0';
        when others =>   
          -- Default case: Set default values
          reg_dst <= '0';
          mem_to_reg <= '0';
          alu_op <= "000";
          jump <= '0';
          branch <= '0';
          branch_g <= '0';
          branch_l <= '0';
          mem_read <= '0';
          mem_write <= '0';
          alu_src <= '0';
          reg_write <= '0';
      end case;
    end if;
  end process;
end Behavioral;