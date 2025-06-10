library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sub4 is
    Port (
        A     : in  STD_LOGIC_VECTOR(3 downto 0);
        B     : in  STD_LOGIC_VECTOR(3 downto 0);
        S     : out STD_LOGIC_VECTOR(3 downto 0);
        BORROW: out STD_LOGIC
    );
end sub4;

architecture Behavioral of sub4 is
    signal diff : STD_LOGIC_VECTOR(4 downto 0);
begin
    process(A, B)
        variable brr : STD_LOGIC := '0';
        variable s   : STD_LOGIC_VECTOR(3 downto 0);
        variable temp: STD_LOGIC_VECTOR(4 downto 0);
        variable d   : STD_LOGIC;
    begin
        brr := '0';
        for i in 0 to 3 loop
            d := (A(i) xor B(i)) xor brr;
            s(i) := d;
            brr := ((not A(i)) and B(i)) or ((not (A(i) xor B(i))) and brr);
        end loop;
        temp(3 downto 0) := s;
        temp(4) := brr;
        diff <= temp;
    end process;
    S      <= diff(3 downto 0);
    BORROW <= diff(4);
end Behavioral;