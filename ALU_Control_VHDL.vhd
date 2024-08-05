library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_Control_VHDL is
  port(
    ALU_Control: out std_logic_vector(3 downto 0);  -- 4-bit output for ALU control signal
    ALUOp: in std_logic_vector(2 downto 0);  -- 3-bit input control signal from main control unit
    ALU_Funct: in std_logic_vector(5 downto 0)  -- 6-bit function code from instruction
  );
end ALU_Control_VHDL;

architecture Behavioral of ALU_Control_VHDL is
begin
  process(ALUOp, ALU_Funct)
  begin
    case ALUOp is
      when "010" =>  -- R-type instructions
        case ALU_Funct is
          when "100000" =>  -- ADD
            ALU_Control <= "0010";
          when "100010" =>  -- SUB
            ALU_Control <= "0110";
          when "100100" =>  -- AND
            ALU_Control <= "0000";
          when "100101" =>  -- OR
            ALU_Control <= "0001";
          when "100110" =>  -- XOR
            ALU_Control <= "0011";
          when "100111" =>  -- NOR
            ALU_Control <= "0100";
          when others => 
            ALU_Control <= "0000";  -- Default
        end case;
      when "000" => 
        ALU_Control <= "0010";  -- ADD immediate
      when "001" => 
        ALU_Control <= "0000";  -- AND immediate
      when "011" => 
        ALU_Control <= "0001";  -- OR immediate
      when "100" => 
        ALU_Control <= "0011";  -- XOR immediate
      when others => 
        ALU_Control <= "0000";  -- Default case
    end case;
  end process;
end Behavioral;