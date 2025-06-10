library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display5 is
    Port (
        entrada : in  STD_LOGIC_VECTOR(4 downto 0);
        saida   : out STD_LOGIC_VECTOR(4 downto 0)
    );
end display5;

architecture Behavioral of display5 is
begin
    saida <= entrada;
end Behavioral;