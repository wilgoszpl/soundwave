library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity KbdDecode is
    Port ( KbdDO : in  STD_LOGIC_VECTOR( 7 downto 0 ));
end KbdDecode;

architecture RTL of KbdDecode is
begin

  process( KbdDO )
  begin
    case KbdDO is

      when "100" & X"45" => -- "0"
        LCD_DI <= X"30";
        
      when "100" & X"16" => -- "1"
        LCD_DI <= X"31";
        
      when "101" & X"6C" => -- Home
        LCD_DI <= X"80";  -- LCD Home1
        
      when "100" & X"5A" => -- Enter
        LCD_DI <= X"C0";  -- LCD Home2
        
      when others =>
        LCD_DI <= "--------";
        
    end case;
  end process;

end RTL;

