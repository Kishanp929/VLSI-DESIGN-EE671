-- A DUT entity is used to wrap your design so that we can combine it with testbench.
-- This example shows how you can do this for the OR Gate

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
    port(input_vector: in std_logic_vector(64 downto 0);
       	output_vector: out std_logic_vector(32 downto 0));
end entity;

architecture DutWrap of DUT is
   component brent_kung is
     port(
        a, b : in STD_LOGIC_VECTOR(31 downto 0);
        cin : in std_logic;
        sum : out STD_LOGIC_VECTOR(31 downto 0);
        cout : out std_logic
    );
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: brent_kung 
			port map (
					-- order of inputs B A
					a(31 downto 0) => input_vector(64 downto 33),
					b(31 downto 0) => input_vector(32 downto 1),
					cin => input_vector(0),
               -- order of output OUTPUT
					sum(31 downto 0) => output_vector(31 downto 0),
					cout => output_vector(32));
end DutWrap;