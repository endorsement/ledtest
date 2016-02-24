----------------------------------------------------------------------------------

-- Company: 

-- Engineer: 

-- 

-- Create Date:    20:23:21 02/24/2016 

-- Design Name: 

-- Module Name:    main - Behavioral 

-- Project Name: 

-- Target Devices: 

-- Tool versions: 

-- Description: 

--

-- Dependencies: 

--

-- Revision: 

-- Revision 0.01 - File Created

-- Additional Comments: 

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

library UNISIM;

use UNISIM.VComponents.all;



entity main is
    Port ( clk : in  STD_LOGIC;
           btn : in  STD_LOGIC_VECTOR (3 downto 0);
           led : out  STD_LOGIC_VECTOR (3 downto 0));
end main;



architecture Behavioral of main is

--	constant SEC :std_logic_vector(28 downto 0) :=b"11001101111111100110000000000";

	signal clk_buf : std_logic ; -- clockbuffer

	signal counter : std_logic_vector(3 downto 0);

	signal clk_1sec: std_logic ;

	

	COMPONENT seccounter

	PORT(

		clk : IN std_logic;          

		clk_trig_o : OUT std_logic

		);

	END COMPONENT;



begin



u1_bufg : bufg port map (
   i => clk,
	o => clk_buf);



	Inst_seccounter: seccounter PORT MAP(

		clk => clk_buf,

		clk_trig_o => clk_1sec

	);



process(clk_buf) begin

	if(clk_buf'event and clk_buf = '1') then

		if(clk_1sec = '1') then

			counter <= counter + 1;

		end if;

	end if;

end process;



led(0) <= counter(3);
led(1) <= counter(2);
led(2) <= counter(1);
led(3) <= counter(0);



end Behavioral;



