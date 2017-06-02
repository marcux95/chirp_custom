library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity dds_tb is
  Port ( 
        sin_data : out std_logic_vector (31 downto 0);
        cos_data : out std_logic_vector (31 downto 0)
       
  );
  
end dds_tb;

architecture Behavioral of dds_tb is

signal clk : std_logic := '0';
signal straigth_counter : std_logic_vector (15 downto 0) := (others => '0');
signal address : std_logic_vector (31 downto 0) := (others => '0');
signal address_s : std_logic_vector (15 downto 0) := (others => '0');

begin

DDS_SIN_COS_I: entity work.dds_sin_cos port map (
                                                    clk,
                                                    address,
                                                    sin_data,
                                                    cos_data
                                                    );

clk <= not(clk) after 10ns;

process(clk)
begin
    if rising_edge(clk) then
    
        straigth_counter <= straigth_counter + 1;
        address_s <= straigth_counter * straigth_counter;
        
        
    end if;
    end process;
    
    address <= address_s(15 downto 0);
end Behavioral;
