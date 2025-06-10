library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor4 is
    Port (
        A : in  STD_LOGIC_VECTOR(3 downto 0);
        B : in  STD_LOGIC_VECTOR(3 downto 0);
        R : out STD_LOGIC_VECTOR(3 downto 0)
    );
end xor4;

architecture Behavioral of xor4 is
begin
    R <= A xor B;
end Behavioral;