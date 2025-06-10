library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ula is
    Port (
        A      : in  STD_LOGIC_VECTOR(3 downto 0);
        B      : in  STD_LOGIC_VECTOR(3 downto 0);
        opcode : in  STD_LOGIC_VECTOR(2 downto 0);
        RESULT : out STD_LOGIC_VECTOR(3 downto 0);
        CARRY  : out STD_LOGIC
    );
end ula;

architecture Structural of ula is
    signal and_r, or_r, xor_r, add_r, sub_r : STD_LOGIC_VECTOR(3 downto 0);
    signal add_c, sub_b : STD_LOGIC;

    component and4 port (
        A : in  STD_LOGIC_VECTOR(3 downto 0);
        B : in  STD_LOGIC_VECTOR(3 downto 0);
        R : out STD_LOGIC_VECTOR(3 downto 0)
    ); end component;

    component or4 port (
        A : in  STD_LOGIC_VECTOR(3 downto 0);
        B : in  STD_LOGIC_VECTOR(3 downto 0);
        R : out STD_LOGIC_VECTOR(3 downto 0)
    ); end component;

    component xor4 port (
        A : in  STD_LOGIC_VECTOR(3 downto 0);
        B : in  STD_LOGIC_VECTOR(3 downto 0);
        R : out STD_LOGIC_VECTOR(3 downto 0)
    ); end component;

    component add4 port (
        A     : in  STD_LOGIC_VECTOR(3 downto 0);
        B     : in  STD_LOGIC_VECTOR(3 downto 0);
        S     : out STD_LOGIC_VECTOR(3 downto 0);
        CARRY : out STD_LOGIC
    ); end component;

    component sub4 port (
        A      : in  STD_LOGIC_VECTOR(3 downto 0);
        B      : in  STD_LOGIC_VECTOR(3 downto 0);
        S      : out STD_LOGIC_VECTOR(3 downto 0);
        BORROW : out STD_LOGIC
    ); end component;

begin

    AND_U : and4 port map(A => A, B => B, R => and_r);
    OR_U  : or4  port map(A => A, B => B, R => or_r);
    XOR_U : xor4 port map(A => A, B => B, R => xor_r);
    ADD_U : add4 port map(A => A, B => B, S => add_r, CARRY => add_c);
    SUB_U : sub4 port map(A => A, B => B, S => sub_r, BORROW => sub_b);

    process(opcode, and_r, or_r, xor_r, add_r, sub_r, add_c, sub_b)
    begin
        case opcode is
            when "000" => RESULT <= and_r; CARRY <= '0';
            when "001" => RESULT <= or_r;  CARRY <= '0';
            when "010" => RESULT <= xor_r; CARRY <= '0';
            when "011" => RESULT <= add_r; CARRY <= add_c;
            when "100" => RESULT <= sub_r; CARRY <= sub_b;
            when others => RESULT <= (others => '0'); CARRY <= '0';
        end case;
    end process;

end Structural;