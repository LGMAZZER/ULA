library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add4 is
    Port (
        A     : in  STD_LOGIC_VECTOR(3 downto 0);
        B     : in  STD_LOGIC_VECTOR(3 downto 0);
        S     : out STD_LOGIC_VECTOR(3 downto 0);
        CARRY : out STD_LOGIC
    );
end add4;

architecture Behavioral of add4 is
    signal sum : STD_LOGIC_VECTOR(4 downto 0);
begin
    process(A, B)
        variable c : STD_LOGIC := '0';
        variable s : STD_LOGIC_VECTOR(3 downto 0);
        variable temp : STD_LOGIC_VECTOR(4 downto 0);
    begin
        c := '0';
        for i in 0 to 3 loop
            s(i) := A(i) xor B(i) xor c;
            c := (A(i) and B(i)) or (A(i) and c) or (B(i) and c);
        end loop;
        temp(3 downto 0) := s;
        temp(4) := c;
        sum <= temp;
    end process;
    S     <= sum(3 downto 0);
    CARRY <= sum(4);
end Behavioral;