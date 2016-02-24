----------------------------------------------------------------------------------

-- Company: 

-- Engineer: 

-- 

-- Create Date:    20:59:57 02/24/2016 

-- Design Name: 

-- Module Name:    seccounter - Behavioral 

-- Project Name: 

-- Target Devices: 

-- Tool versions: 

-- Description: 

--

-- Dependencies: 

--

-- Revision: 

-- Revision 0.01 - File Created

-- Additional Comments: 1秒生成モジュール27MHz版

--

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



-- Uncomment the following library declaration if using

-- arithmetic functions with Signed or Unsigned values

--use IEEE.NUMERIC_STD.ALL;



-- Uncomment the following library declaration if instantiating

-- any Xilinx primitives in this code.

--library UNISIM;

--use UNISIM.VComponents.all;



entity seccounter is

	Port(

		clk		:in std_logic;

		clk_trig_o	:out std_logic

	);

end seccounter;



architecture Behavioral of seccounter is

	constant SEC 	: std_logic_vector(24 downto 0) :=b"1100110111111110011000000";

	signal counter : std_logic_vector(24 downto 0);

	signal clk_trig: std_logic;

begin



process(clk) begin

	if(clk'event and clk = '1') then

		if(SEC - 1 = counter) then

			counter <=  b"0" & x"000000";

			clk_trig <= '1';

		else

			counter <= counter + 1;

			clk_trig <= '0';

		end if;

	end if;

end process;



	clk_trig_o <= clk_trig;



end Behavioral;



