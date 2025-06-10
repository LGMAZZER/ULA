library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and4 is
    Port (
        A : in  STD_LOGIC_VECTOR(3 downto 0);
        B : in  STD_LOGIC_VECTOR(3 downto 0);
        R : out STD_LOGIC_VECTOR(3 downto 0)
    );
end and4;

architecture Behavioral of and4 is
begin
    R <= A and B;
end Behavioral;