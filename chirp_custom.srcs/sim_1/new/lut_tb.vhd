library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;


entity lut_tb is
  Port (
            sin_coarse_data : out std_logic_vector (31 downto 0);
            cos_coarse_data : out std_logic_vector (31 downto 0);
            sin_fine_data   : out std_logic_vector (31 downto 0);
            cos_fine_data   : out std_logic_vector (31 downto 0)
   );
   
end lut_tb;

architecture Behavioral of lut_tb is

signal clk : std_logic := '0';
signal counter : std_logic_vector (7 downto 0) := (others => '0');

begin

LUT_I: entity work.luts port map (
                                    clk,
                                    counter,
                                    counter,
                                    counter,
                                    counter,
                                    
                                    sin_coarse_data,
                                    cos_coarse_data,
                                    sin_fine_data,
                                    cos_fine_data
                                    );

clk <= not(clk) after 10ns;

process(clk)
begin
    if rising_edge(clk) then
    
        counter <= counter + 1;
        
    end if;
    end process;
    
end Behavioral;
