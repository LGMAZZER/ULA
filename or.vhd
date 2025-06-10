library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or4 is
    Port (
        A : in  STD_LOGIC_VECTOR(3 downto 0);
        B : in  STD_LOGIC_VECTOR(3 downto 0);
        R : out STD_LOGIC_VECTOR(3 downto 0)
    );
end or4;

architecture Behavioral of or4 is
begin
    R <= A or B;
end Behavioral;