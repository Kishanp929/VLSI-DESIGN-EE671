-- A DUT entity is used to wrap your design so that we can combine it with testbench.
-- This example shows how you can do this for the OR Gate

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
    port(input_vector: in std_ulogic_vector(63 downto 0);
       	output_vector: out std_ulogic_vector(32 downto 0));
end entity;

architecture DutWrap of DUT is
component MAC is 
    port(
        a, b: in std_ulogic_vector(15 downto 0);
        c: in std_ulogic_vector(31 downto 0);
        s: out std_ulogic_vector(31 downto 0);
        cout: out std_ulogic
    );
end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: MAC 
			port map(
					-- order of inputs B A
					a => input_vector(63 downto 48),
					b => input_vector(47 downto 32),
					c => input_vector(31 downto 0),
               -- order of output OUTPUT
					s => output_vector(31 downto 0),
					cout => output_vector(32)
					);
end DutWrap;