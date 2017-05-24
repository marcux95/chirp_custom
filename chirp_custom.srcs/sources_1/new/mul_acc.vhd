library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;

entity mul_acc is
  Port (
         
         address : std_logic_vector(15 downto 0); --stesso address per seno e coseno
                 
         sin_coarse_data : in std_logic_vector(31 downto 0);
         cos_coarse_data : in std_logic_vector(31 downto 0);
         sin_fine_data   : in std_logic_vector(31 downto 0);
         cos_fine_data   : in std_logic_vector(31 downto 0);
         
         sin_coarse_add  : out std_logic_vector(7 downto 0);
         cos_coarse_add  : out std_logic_vector(7 downto 0);
         sin_fine_add    : out std_logic_vector(7 downto 0);
         cos_fine_add    : out std_logic_vector(7 downto 0);
  
         sin_data : out std_logic_vector(63 downto 0);
         cos_data : out std_logic_vector(63 downto 0)
  
   );
   
end mul_acc;

architecture Behavioral of mul_acc is

signal sin_a : std_logic_vector (31 downto 0) := (others => '0');
signal sin_b : std_logic_vector (31 downto 0) := (others => '0');
signal cos_a : std_logic_vector (31 downto 0) := (others => '0');
signal cos_b : std_logic_vector (31 downto 0) := (others => '0');

signal sin_partial_prod_1 : std_logic_vector(63 downto 0);
signal sin_partial_prod_2 : std_logic_vector(63 downto 0);
signal cos_partial_prod_1 : std_logic_vector(63 downto 0);
signal cos_partial_prod_2 : std_logic_vector(63 downto 0);

signal sin_data_s : std_logic_vector (63 downto 0);
signal cos_data_s : std_logic_vector (63 downto 0);



begin

      process (address, sin_coarse_data, sin_fine_data, cos_coarse_data, cos_fine_data)
      begin
        
            sin_coarse_add <= address(15 downto 8);
            sin_a <= sin_coarse_data;
            sin_fine_add <= address(7 downto 0); 
            sin_b <= sin_fine_data;
            cos_coarse_add <= address(15 downto 8);
            cos_a <= cos_coarse_data;
            cos_fine_add <= address(7 downto 0); 
            cos_b <= cos_fine_data;
            
      end process; 
   
    process (sin_a, sin_b, cos_a, cos_b)
    begin        
        
        sin_partial_prod_1 <= sin_a * cos_b;
        sin_partial_prod_2 <= cos_a * sin_b;
        cos_partial_prod_1 <= cos_a * cos_b;
        cos_partial_prod_2 <= sin_a * sin_b;
        
        end process;
 
    process (sin_partial_prod_1, sin_partial_prod_2, cos_partial_prod_1, cos_partial_prod_2)
    begin
        
        sin_data_s <= sin_partial_prod_1(63 downto 0) + sin_partial_prod_2(63 downto 0);
        cos_data_s <= cos_partial_prod_1(63 downto 0) - cos_partial_prod_2(63 downto 0);

    end process;
    
    sin_data <= sin_data_s(63 downto 0);
    cos_data <= cos_data_s(63 downto 0);
 
end Behavioral;
