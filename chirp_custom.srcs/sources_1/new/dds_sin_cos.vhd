library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity dds_sin_cos is
  Port (
         clk : in std_logic;
         
         address : in std_logic_vector(15 downto 0);
         
         sin_data : out std_logic_vector (63 downto 0);
         cos_data : out std_logic_vector (63 downto 0)
  
  );
  
end dds_sin_cos;

architecture Behavioral of dds_sin_cos is

signal sin_coarse_add_s : std_logic_vector (7 downto 0);
signal cos_coarse_add_s : std_logic_vector (7 downto 0);
signal sin_fine_add_s   : std_logic_vector (7 downto 0);
signal cos_fine_add_s   : std_logic_vector (7 downto 0);
signal sin_coarse_data_s : std_logic_vector (31 downto 0);
signal cos_coarse_data_s : std_logic_vector (31 downto 0);
signal sin_fine_data_s   : std_logic_vector (31 downto 0);
signal cos_fine_data_s   : std_logic_vector (31 downto 0);

begin

LUT_I: entity work.luts_0 port map (
                                    clk,
                                    
                                    sin_coarse_add_s,
                                    cos_coarse_add_s,
                                    sin_fine_add_s,
                                    cos_fine_add_s,
                                    
                                    sin_coarse_data_s,
                                    cos_coarse_data_s,
                                    sin_fine_data_s  ,
                                    cos_fine_data_s  
                                    );
                                    
MUL_ACC_I: entity work.mul_acc port map (
                                            address,
                                            sin_coarse_data_s,
                                            cos_coarse_data_s,
                                            sin_fine_data_s  ,
                                            cos_fine_data_s  ,
                                            
                                            sin_coarse_add_s,
                                            cos_coarse_add_s,
                                            sin_fine_add_s  ,
                                            cos_fine_add_s  ,
                                            
                                            sin_data,
                                            cos_data

                                           ) ;                                   
                                    
end Behavioral;
